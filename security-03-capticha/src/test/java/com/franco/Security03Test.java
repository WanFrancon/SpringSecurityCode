package com.franco;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.password.PasswordEncoder;

@SpringBootTest
class Security03Test {
    @Autowired
    private PasswordEncoder passwordEncoder;

    @Test
    void testPasswordEncoder01(){
        String password = "123456";
        String encode = passwordEncoder.encode(password); // 对密码进行加密
        System.out.println(encode);
        boolean matches = passwordEncoder.matches(password, encode); // 对密码进行匹配
        System.out.println(matches);
    }
    @Test
    void testPasswordEncoder02() {
        String password = "123456";
        for (int i = 0; i < 10; i++) {
            String encode = passwordEncoder.encode(password);
            System.out.println(encode);
        }
    }

}
