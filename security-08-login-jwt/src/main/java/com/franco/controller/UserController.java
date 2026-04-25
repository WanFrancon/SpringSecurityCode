package com.franco.controller;

import cn.hutool.captcha.CaptchaUtil;
import cn.hutool.captcha.ICaptcha;
import com.franco.constant.Constant;
import com.franco.result.Result;
import com.franco.utils.LoginIfoUtil;
import com.franco.utils.MyCodeGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.security.authentication.AbstractAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import java.io.ByteArrayOutputStream;
import java.security.Principal;
import java.util.Base64;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

@RestController
@RequestMapping
//跨域处理
@CrossOrigin(origins = "*")
public class UserController {
    @Autowired
    private StringRedisTemplate redisTemplate;

    @GetMapping("/")
    public String hello() {
        return "hello world";
    }
/**
 * 获取验证码
 */
    @GetMapping("/captchaCode")
    public Result<Map<String, Object>> getCaptchaCode() throws Exception {

        //1. 使用验证码工具类生成验证码
        /**
         * 有动态的还有静态验证码 两种
         *
         * 干扰因素是线条，圆圈，又是两种
         *
         * 生成的验证码可以自定义，需要写一个类继承CodeGenerator，
         * 并重写generate方法，然后把这个类当做参数传递给方法
         */
        ICaptcha captcha = CaptchaUtil.createGifCaptcha(100, 40, new MyCodeGenerator(), 4);

        //验证码的key
        String captchaKey = UUID.randomUUID().toString();

        //2. 将验证码答案保存到 Redis，2 分钟过期
        redisTemplate.opsForValue().set(
                Constant.CAPTCHA_KEY + captchaKey,
                captcha.getCode(),
                2,
                TimeUnit.MINUTES
        );

        //3. 将验证码图片转成 base64，前端直接放到 img src
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        captcha.write(outputStream);
        String imageBase64 = Base64.getEncoder().encodeToString(outputStream.toByteArray());

        return Result.success(Map.of(
                "captchaKey", captchaKey,  //验证码的key
                "image", "data:image/gif;base64," + imageBase64  //验证码图片
        ));
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
