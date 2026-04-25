package com.franco.constant;

/**
 * 全局常量  类
 */
public class Constant {

    // JWT 密匙
    public static final String SECRET = "change-me-local-jwt-secret";


    // 用户信息保存在redis中的key
    public static final String USER_INFO_KEY = "security:user:info";

    // 用户登录成功后，toke保存在redis中的key
    public static final String USER_LOGIN_KEY = "security:user:token:";

    //security 登录请求的url
    public static final String LOGIN_PROCESSING_URL = "/user/login";

    // 验证码保存在 Redis 中的 key 前缀
    public static final String CAPTCHA_KEY = "security:captcha:";
}
