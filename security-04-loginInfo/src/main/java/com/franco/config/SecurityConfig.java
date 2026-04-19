package com.franco.config;

import com.franco.filter.CaptchaFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
    @Autowired
    private CaptchaFilter captchaFilter;

    @Bean  // 把密码编码器加到容器中
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean // 配置过滤器链
    SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        return http
                // 配置登录页
                .formLogin(formLogin -> formLogin
                        .loginProcessingUrl("/userLogin") //登录的账号密码往哪个地址提交
                        .loginPage("/userLogin")      // 登录页面
                        .successForwardUrl("/welcome") // 登录成功后跳转的页面(默认是跳转到之前访问的地址)
                )
                .authorizeHttpRequests(authorizeHttpRequests -> authorizeHttpRequests
                        .requestMatchers("/userLogin", "/captchaCode").permitAll()
                        .anyRequest().authenticated())
                //添加验证码过滤器 在认证之前
                .addFilterBefore(captchaFilter, UsernamePasswordAuthenticationFilter.class)
                .build();
    }
}
