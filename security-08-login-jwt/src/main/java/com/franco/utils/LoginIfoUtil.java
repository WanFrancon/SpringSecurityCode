package com.franco.utils;

import com.franco.pojo.TUser;
import org.springframework.security.core.context.SecurityContextHolder;

/**
 * 获取登录用户信息工具类
 */
public class LoginIfoUtil {
    /**
     * 获取当前登录用户
     * @return
     * 当前登录用户
     */
    public static TUser getCurrentUser(){
        return (TUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    }
}
