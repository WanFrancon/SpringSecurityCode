package com.franco.utils;

import cn.hutool.captcha.generator.CodeGenerator;

import java.util.Random;

/**
 * 自定义验证码生成器
 *
 * 需要覆盖 父类方法
 */
public class MyCodeGenerator implements CodeGenerator {
    @Override
    public String generate() {
        int code = 1000 +new Random().nextInt(9000);
        return String.valueOf(code);
    }

    @Override
    public boolean verify(String code, String userInputCode) {
        return false;
    }
}
