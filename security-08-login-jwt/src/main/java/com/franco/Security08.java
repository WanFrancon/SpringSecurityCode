package com.franco;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.franco.mapper")
public class Security08 {

    public static void main(String[] args) {
        SpringApplication.run(Security08.class, args);
    }

}
