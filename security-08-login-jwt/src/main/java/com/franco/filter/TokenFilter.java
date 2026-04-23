package com.franco.filter;


import cn.hutool.jwt.JWTUtil;
import com.franco.constant.Constant;
import com.franco.pojo.TUser;
import com.franco.utils.HutoolJwtUtils;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.nio.charset.StandardCharsets;

@Component
public class TokenFilter extends OncePerRequestFilter {
    @Autowired
    private StringRedisTemplate redisTemplate;

    @Value("${jwt.secret}")
    private String secret;

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {

        response.setContentType("application/json;charset=UTF-8");

        //获取登录请求的url
        String requestURI = request.getRequestURI();

        if ("OPTIONS".equalsIgnoreCase(request.getMethod())) {
            filterChain.doFilter(request, response);
            return;
        }

        // 判断当前请求是否是登录请求（并且是post请求方式）
        boolean isLoginSubmission = Constant.LOGIN_PROCESSING_URL.equals(requestURI) && "POST".equalsIgnoreCase(request.getMethod());

        if (isLoginSubmission) { /*是登录请求*/
            filterChain.doFilter(request, response);
            return; // 添加return，避免继续执行
        }

        else
        { /*非登录请求需要验证Token*/

            // 拿请求头的 token
            String token = request.getHeader("Authorization");

            //验证 Authorization: Bearer <token值> 标准格式
            if (token == null || !token.startsWith("Bearer ")) {
                response.setStatus(401); //401 未授权
                response.getWriter().write("{\"code\":401,\"msg\":\"未提供Token\"}");
                return; // 立即返回
            }

            // 去除 "Bearer " 前缀，获取真正的token
            token = token.substring(7).trim();
            if (token.startsWith("\"") && token.endsWith("\"")) {
                token = token.substring(1, token.length() - 1);
            }


            //验证token 合法性和有效期

            boolean verify = false;
            try {
                verify = JWTUtil.verify(token, secret.getBytes(StandardCharsets.UTF_8));
            } catch (Exception e) {
                throw new RuntimeException(e);
            }

            if (!verify) {
                response.setStatus(401);
                response.getWriter().write("{\"code\":401,\"msg\":\"Token无效或已过期\"}");
                return; // 立即返回
            }

            //根据前端 的 token 获取用户信息 (用于取Redis中的token),
            //Redis中存储的token 的key是用户的信息;
            Object userId = JWTUtil.parseToken(token).getPayloads().get("userId");


            //取出Redis中的token
            String redisToken = redisTemplate.opsForValue().get(Constant.USER_LOGIN_KEY + userId);


            if (redisToken == null || !redisToken.equals(token)) {
                response.setStatus(401);
                response.getWriter().write("{\"code\":401,\"msg\":\"Token已失效，请重新登录\"}");
                return; // 立即返回
            }

            // 从 Redis 获取完整用户信息
            String userJSON = redisTemplate.opsForValue().get(Constant.USER_INFO_KEY + userId);
            TUser user = cn.hutool.json.JSONUtil.toBean(userJSON, TUser.class);

            // 【关键】创建 Authentication 对象，告诉 Security 用户已认证
            UsernamePasswordAuthenticationToken authentication =
                    new UsernamePasswordAuthenticationToken(user, null, AuthorityUtils.NO_AUTHORITIES);

            // 将 Authentication 存入 SecurityContext
            SecurityContextHolder.getContext().setAuthentication(authentication);

            //存储用户id
            request.setAttribute("userId", userId);
            //放行
            System.out.println("----已通过Token验证-----");

            filterChain.doFilter(request, response);
        }

    }
}
