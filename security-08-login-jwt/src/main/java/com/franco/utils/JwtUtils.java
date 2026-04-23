package com.franco.utils;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.TokenExpiredException;
import com.auth0.jwt.interfaces.Claim;
import com.auth0.jwt.interfaces.DecodedJWT;
import org.springframework.beans.factory.annotation.Value;

import java.util.HashMap;
import java.util.Map;
/**
 * jwt工具类(基于java - jwt )、
 * 不需要会背代码 拿来用，会改就行
 */
public class JwtUtils {
    @Value("${jwt.secret}")
    private static String SECRET;

    /*1、怎么生成jwt?*/
    public static String createToken(String userJson){
        Map<String, Object> header = new HashMap<>();
        header.put("alg","HS256");
        header.put("typ","JWT");
        return JWT.create()
                //头
                .withHeader(header)

                //载荷
                .withClaim("user",userJson)
                .withClaim("userpassword",userJson)
//                .withClaim("phone","123123123")
//                .withClaim("email","123123123@123com")

                //签名
                .sign(Algorithm.HMAC256(SECRET));
    }

    /*2、怎么验证jwt有没有被篡改?*/
    public static Boolean  verifyToken(String token){
        //使用密匙创建一个jwt验证对象
        try {
            JWTVerifier jwtVerifier = JWT.require(Algorithm.HMAC256(SECRET)).build();

            //使用验证对象验证  token ，如果 不会抛出异常，token就没有被篡改，说明验证成功，反之token被篡改了，说明验证失败
            jwtVerifier.verify(token);//验证

            return true;

        } catch (Exception e) {
           e.printStackTrace();
        }
        return false;
    }


    /*3、怎么解析jwt里的负债数据?*/
    public static String parseToken(String token){
        try{
            //使用密匙创建一个jwt解析对象
            JWTVerifier jwtVerifier = JWT.require(Algorithm.HMAC256(SECRET)).build();

            //验证 token
            DecodedJWT decodedJWT = jwtVerifier.verify(token);

            //获取用户信息
            Claim user = decodedJWT.getClaim("user");
            //Claim email = decodedJWT.getClaim("email");
            //Claim phone = decodedJWT.getClaim("phone");

            //返回用户信息
            return user.asString();

        }catch (TokenExpiredException  e){
            e.printStackTrace();
            throw new RuntimeException("token已过期");
        }
    }
}
