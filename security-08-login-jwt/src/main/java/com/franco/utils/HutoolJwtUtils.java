package com.franco.utils;

import cn.hutool.json.JSONObject;
import cn.hutool.jwt.JWT;
import cn.hutool.jwt.JWTUtil;
import com.franco.constant.Constant;

import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

/**
 * JWT工具类(基于hutool - jwt 工具生成)
 */
public class HutoolJwtUtils {

    public static void main(String[] args) {
//        HashMap<String, Object> payload = new HashMap<>();
//        payload.put("username","franco");
//        payload.put("phone","123123123");
//        //测试 创建jwt
//        String token = createToken(payload);
//        System.out.println(token);
//
//        //测试 验证jwt
//        System.out.println(verifyToken(token));
//
//        //测试 解析jwt
//        System.out.println(parseToken(token));

       String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyTmFtZSI6Iu" +
               "W8oOeQqiIsInVzZXJJZCI6M30.rHanesQhgQgYfJLVZyR58HsWg13ld0OSBgrg5hkmHCA";
        JSONObject payloads = JWTUtil.parseToken(token).getPayloads();
        System.out.println(payloads.get("userName"));

//        boolean b = verifyToken(token);
//        System.out.println(b);

    }


    //创建 token
    public static String createToken(HashMap<String, Object> payload){
        if (payload == null){
            payload = new HashMap<>();
            payload.put("username","franco");
            payload.put("phone","123123123");
        }
        return JWTUtil.createToken( payload, Constant.SECRET.getBytes(StandardCharsets.UTF_8));
    }

    //验证 token
    public static boolean verifyToken(String token){
        return JWTUtil.verify(token, Constant.SECRET.getBytes(StandardCharsets.UTF_8));
    }

    public static boolean verifyToken(String token, String secret){
        return JWTUtil.verify(token, secret.getBytes(StandardCharsets.UTF_8));
    }

    //解析 token
    public static String parseToken(String token){
        JWT parseJwt = JWTUtil.parseToken(token);
        String username = parseJwt.getPayload("username").toString();
        return username;
    }
}
