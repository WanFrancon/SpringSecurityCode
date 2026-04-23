package com.franco;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.franco.mapper")
public class Security06 {

    public static void main(String[] args) {
        SpringApplication.run(Security06.class, args);
    }
}
