package com.franco.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity   // 开启springSecurity 表示 这是Security的一个配置类
public class SecurityConfig {
    /**
     * springSecurity密码加密需要配置的Bean
     * @return
     */
    @Bean
    public PasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder(); //直接new 接口不行的，需要 new 实现类
    }


    /**
     * 配置springSecurity 自定义登录页面(前后端不分离)
     *  问题：
     *  不使用默认页面，但是会导致默认行为失效，
     *  比如 没有认证拦截。
     *
     *  解决：
     *  通话 HttpSecurity 把默认行为加回来
     *
     *
     *
     * @param http
     * @return
     * @throws Exception
     */
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http)throws  Exception{
        return http.
                // 自定义登录页面
                formLogin(formLogin ->{
                    formLogin //框架默认接收登录信息接口是/login，但是我们做了自定义登录页面 会失效 需要重新配置
                            .loginProcessingUrl("/login") // 登录接口(和表单访问接口一样)
                            .loginPage("/login"); //自定义登录页面 --- thymeleaf页面
                }).
                // 把默认接口功能行为加回来
                        authorizeHttpRequests(authorizeHttpRequests ->{
                            authorizeHttpRequests.
                                    requestMatchers("/login").permitAll() // 登录页面不需要认证
                                    .anyRequest().authenticated(); // 所有请求都需要认证
                }).
                build();
    }
}
