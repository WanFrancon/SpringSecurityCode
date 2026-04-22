package com.franco.filter;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;

/**
 * 验证码过滤器
 */
@Component
public class CaptchaFilter extends OncePerRequestFilter {
    // 登录请求的url
    private static final String LOGIN_PROCESSING_URL = "/userLogin";

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
            throws ServletException, IOException {

        String requestUrl = request.getServletPath(); // 获取当前请求的url

        // 判断当前请求是否是登录请求（并且是post请求方式）
        boolean isLoginSubmission = LOGIN_PROCESSING_URL.equals(requestUrl)
                && "POST".equalsIgnoreCase(request.getMethod());

        if (!isLoginSubmission) { // 不是登录请求
            filterChain.doFilter(request, response); // 继续处理下一个过滤器
            return; // 结束当前过滤器
        }

        // 获取用户输入的验证码
        String requestCaptcha = request.getParameter("captcha");
        // 获取后端生成的session中的验证码
        String sessionCaptcha = (String) request.getSession().getAttribute("captcha");

        // 验证码校验
        if (!StringUtils.hasLength(requestCaptcha) || !requestCaptcha.equals(sessionCaptcha)) {
            response.sendRedirect(LOGIN_PROCESSING_URL); // 重定向到登录页面
            return;
        }

        // 处理登录请求
        filterChain.doFilter(request, response);
    }
}
