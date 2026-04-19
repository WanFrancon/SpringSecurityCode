package com.franco.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author franco
 *
 *自定义登录页面
 */

@Controller  //前后端不分离的写法
public class UserController {
    @GetMapping("/login")
    public String index() {
        return "login";
    }
    @GetMapping("/get")
    @ResponseBody
    public String get() {
        return "Hello SpringSecurity!";
    }
}
