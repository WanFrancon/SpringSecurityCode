package com.franco.handler;

import cn.hutool.json.JSONUtil;
import cn.hutool.jwt.JWTUtil;
import com.franco.constant.Constant;
import com.franco.pojo.TUser;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * 登录成功处理类
 * @author franco
 * 在登录成功时，检查登录状态 使用 JWT Redis 生成 token 返回给前端
 */
@Component
public class MyAuthenticationSuccessHandler implements AuthenticationSuccessHandler {
    @Autowired
    private StringRedisTemplate redisTemplate;

    @Value("${jwt.secret}")
    private String SECRET;

    @Value("${jwt.expiration:86400}")
    private Long expiration;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request,
                                        HttpServletResponse response,
                                        FilterChain chain,
                                        Authentication authentication)
            throws IOException, ServletException {
        onAuthenticationSuccess(request, response, authentication);
    }

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request,
                                        HttpServletResponse response,
                                        Authentication authentication)
            throws IOException, ServletException {
        response.setContentType("application/json;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setStatus(HttpServletResponse.SC_OK);

        //生成token
        TUser tUser = (TUser) authentication.getPrincipal(); //获取登录用户信息


        //保存用户信息到Redis中
        String userJSON = JSONUtil.toJsonStr(tUser);
        redisTemplate.opsForValue().set(Constant.USER_INFO_KEY + tUser.getId(),
                userJSON, expiration, TimeUnit.SECONDS);

        //生成token(只放用户姓名和id)
        String token = JWTUtil.createToken(Map.of("userId",
                tUser.getId(),"userName",
                tUser.getName()),SECRET.getBytes());

        //把token放到Redis
        redisTemplate.opsForValue().set(Constant.USER_LOGIN_KEY + tUser.getId(),
                token, expiration, TimeUnit.SECONDS);

        // 返回  token 给前端
        response.getWriter().write(JSONUtil.toJsonStr(Map.of(
                "code", 200,
                "message", "login success",
                "token", token
        )));
    }
}
