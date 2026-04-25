package com.franco.filter;

import cn.hutool.json.JSONUtil;
import com.franco.constant.Constant;
import com.franco.result.Result;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;

/**
 * 验证码过滤器
 */
@Component
public class CaptchaFilter extends OncePerRequestFilter {
    @Autowired
    private StringRedisTemplate redisTemplate;

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
            throws ServletException, IOException {

        String requestUrl = request.getServletPath(); // 获取当前请求的url

        // 判断当前请求是否是登录请求（并且是post请求方式）
        boolean isLoginSubmission = Constant.LOGIN_PROCESSING_URL.equals(requestUrl)
                && "POST".equalsIgnoreCase(request.getMethod());

        if (!isLoginSubmission) { // 不是登录请求
            filterChain.doFilter(request, response); // 继续处理下一个过滤器
            return; // 结束当前过滤器
        }

        // 获取用户输入的验证码和本次验证码 key
        String captchaKey = request.getParameter("captchaKey");
        String requestCaptcha = request.getParameter("captchaCode");

        if (!StringUtils.hasLength(requestCaptcha)) { // 兼容旧版本
            requestCaptcha = request.getParameter("captcha");
        }

        if (!StringUtils.hasLength(captchaKey) || !StringUtils.hasLength(requestCaptcha)) {
            writeCaptchaError(response, "验证码不能为空");
            return;
        }

        String redisKey = Constant.CAPTCHA_KEY + captchaKey;
        String redisCaptcha = redisTemplate.opsForValue().get(redisKey);
        redisTemplate.delete(redisKey);

        // 验证码校验
        if (!StringUtils.hasLength(redisCaptcha)) {
            writeCaptchaError(response, "验证码已过期，请刷新后重试");
            return;
        }

        if (!redisCaptcha.equalsIgnoreCase(requestCaptcha)) {
            writeCaptchaError(response, "验证码错误");
            return;
        }

        // 处理登录请求(继续处理下一个过滤器)
        filterChain.doFilter(request, response);
    }

    private void writeCaptchaError(HttpServletResponse response, String message) throws IOException {
        response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        response.setContentType("application/json;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(JSONUtil.toJsonStr(Result.fail(400, message)));
    }
}
