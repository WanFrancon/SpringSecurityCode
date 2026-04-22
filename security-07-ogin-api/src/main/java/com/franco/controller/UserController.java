package com.franco.controller;

import cn.hutool.captcha.CaptchaUtil;
import cn.hutool.captcha.ICaptcha;
import com.franco.utils.LoginIfoUtil;
import com.franco.utils.MyCodeGenerator;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.security.authentication.AbstractAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;

@RestController
@RequestMapping
//跨域处理
@CrossOrigin(origins = "*")
public class UserController {
    @GetMapping("/")
    public String hello() {
        return "hello world";
    }
/**
 * 获取验证码
 */
    @GetMapping("/captchaCode")
    public void getCaptchaCode(HttpSession  session, HttpServletResponse response) throws Exception {

        //1.前后端不分离的场景，告诉浏览器响应的是图片
        response.setContentType("image/jpeg");
        //2.使用验证码工具类生成验证码
        /**
         * 有动态的还有静态验证码 两种
         *
         * 干扰因素是线条，圆圈，又是两种
         *
         * 生成的验证码可以自定义，需要写一个类继承CodeGenerator，
         * 并重写generate方法，然后把这个类当做参数传递给方法
         */
        ICaptcha captcha = CaptchaUtil.createGifCaptcha(100, 40, new MyCodeGenerator(), 4);
        //3.将验证码保存在session中
        session.setAttribute("captcha", captcha.getCode());

        //4.将验证码写出去
        captcha.write(response.getOutputStream());
    }

    @GetMapping("/welcome1")
    public @ResponseBody Object welcome(Principal principal){
        //获取当前登录用户,并且返回。
        return principal;
    }
    @GetMapping("/welcome2")
    public @ResponseBody Object welcome(){
        //获取当前登录用户,并且返回。
        return LoginIfoUtil.getCurrentUser();
    }
    @GetMapping("/welcome3")
    public @ResponseBody Object welcome(Authentication authentication){
        //获取当前登录用户,并且返回。
        return authentication;
    }
    @GetMapping("/welcome4")
    public @ResponseBody Object welcome(AbstractAuthenticationToken  abstractAuthenticationToken){
        //获取当前登录用户,并且返回。
        return abstractAuthenticationToken;
    }
}
