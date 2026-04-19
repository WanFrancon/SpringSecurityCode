package com.franco.controller;

import org.springframework.boot.autoconfigure.security.SecurityProperties;
import org.springframework.security.web.FilterChainProxy;
import org.springframework.security.web.authentication.ui.DefaultLoginPageGeneratingFilter;
import org.springframework.security.web.authentication.ui.DefaultLogoutPageGeneratingFilter;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserController {
//    FilterChainProxy              //           入口
//    SecurityProperties                配置（默认密码和用户的类）
//    DefaultLoginPageGeneratingFilter  登录页面
//    DefaultLogoutPageGeneratingFilter 登出页面
//
    @GetMapping("/get")
    public String getUser() {
        return "get user";
    }
}
