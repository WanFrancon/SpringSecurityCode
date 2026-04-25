package com.franco.handler;

import cn.hutool.json.JSONUtil;
import com.franco.constant.Constant;
import com.franco.pojo.TUser;
import com.franco.result.Result;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.stereotype.Component;

import java.io.IOException;

@Component
public class AppLoutSuccessHandler implements LogoutSuccessHandler {
    @Autowired
    private StringRedisTemplate redisTemplate;

    @Override
    public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {

        response.setContentType("application/json;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setStatus(HttpServletResponse.SC_OK);

        if (authentication != null && authentication.getPrincipal() != null) {
            TUser tUser = (TUser) authentication.getPrincipal();
            
            // 删除当前用户的 Token
            String tokenKey = Constant.USER_LOGIN_KEY + tUser.getId();
            redisTemplate.delete(tokenKey);
            
            // 删除当前用户的详细信息
            String userInfoKey = Constant.USER_INFO_KEY + tUser.getId();
            redisTemplate.delete(userInfoKey);
            
            System.out.println("已删除用户 " + tUser.getId() + " 的登录信息");
        }

        response.getWriter().write(JSONUtil.toJsonStr(Result.success("logout success", null)));
    }
}
