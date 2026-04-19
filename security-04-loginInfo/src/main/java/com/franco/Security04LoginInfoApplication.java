package com.franco;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.franco.mapper")
public class Security04LoginInfoApplication {

    public static void main(String[] args) {
        SpringApplication.run(Security04LoginInfoApplication.class, args);
    }

}
