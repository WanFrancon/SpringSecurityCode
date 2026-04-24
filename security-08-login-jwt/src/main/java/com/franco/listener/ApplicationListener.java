package com.franco.listener;

import com.franco.constant.Constant;
import org.apache.tomcat.util.bcel.Const;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEvent;
import org.springframework.context.event.ContextClosedEvent;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

import java.util.Set;

/**
 * 监听器
 * @author franco
 * 监听器，关闭服务时，对Redis进行操作
 * 删除所有用户的 Token 和用户信息
 */
@Component
public class ApplicationListener implements org.springframework.context.ApplicationListener<ContextClosedEvent> {

    @Autowired
    private StringRedisTemplate redisTemplate;

    @Override
    public void onApplicationEvent(ContextClosedEvent event) {
        System.out.println("===== 应用关闭，开始清理Redis中的Token和用户信息 =====");

        // 获取所有登录相关的 Key
        Set<String> loginKeys = redisTemplate.keys(Constant.USER_LOGIN_KEY + "*");
        if (loginKeys != null && !loginKeys.isEmpty()) {
            Long deletedCount = redisTemplate.delete(loginKeys);
            System.out.println("已删除 " + deletedCount + " 个登录Token");
        }

        // 获取所有用户信息相关的 Key
        Set<String> infoKeys = redisTemplate.keys(Constant.USER_INFO_KEY + "*");
        if (infoKeys != null && !infoKeys.isEmpty()) {
            Long deletedCount = redisTemplate.delete(infoKeys);
            System.out.println("已删除 " + deletedCount + " 个用户信息");
        }

        System.out.println("===== Redis清理完成 =====");
    }
}
