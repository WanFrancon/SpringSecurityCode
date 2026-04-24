package com.franco.handler;

import cn.hutool.json.JSONUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.Map;

@Component
public class MyAuthenticationFailureHandler implements AuthenticationFailureHandler {
    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {

        response.setContentType("application/json;charset=UTF-8");

        response.setCharacterEncoding("UTF-8");

        response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);

        response.getWriter().write(JSONUtil.toJsonStr(Map.of(
                "code", 401,
                "message", "login failed",
                "error", exception.getMessage()
        )));
    }
}
