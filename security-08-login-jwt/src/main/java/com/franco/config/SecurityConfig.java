package com.franco.config;

import com.franco.filter.TokenFilter;
import com.franco.handler.MyAuthenticationFailureHandler;
import com.franco.handler.MyAuthenticationSuccessHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import java.util.List;

@EnableMethodSecurity
@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Autowired
    private MyAuthenticationSuccessHandler myAuthenticationSuccessHandler;

    @Autowired
    private MyAuthenticationFailureHandler myAuthenticationFailureHandler;

    @Autowired
    private TokenFilter tokenFilter;

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    /**
     *  CORS配置 跨域配置
     */
    CorsConfigurationSource corsConfigurationSource() {

        CorsConfiguration configuration = new CorsConfiguration();
        configuration.setAllowedOrigins(List.of("*"));
        configuration.setAllowedMethods(List.of("GET", "POST", "PUT", "DELETE", "OPTIONS"));
        configuration.setAllowedHeaders(List.of("*"));
        configuration.setMaxAge(3600L);

        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", configuration);
        return source;
    }

    @Bean
    SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        return http

                // 禁用CSRF
                .csrf(csrf -> csrf.disable())

                // 关闭CORS
                .cors(cors -> cors.configurationSource(corsConfigurationSource()))

                // 禁用Session
                .sessionManagement(sessionManagement ->
                        sessionManagement.sessionCreationPolicy(SessionCreationPolicy.STATELESS))

                // 登录设置
                .formLogin(formLogin -> formLogin
                        .loginProcessingUrl("/user/login")// 登录接口
                        .successHandler(myAuthenticationSuccessHandler) // 登录成功处理
                        .failureHandler(myAuthenticationFailureHandler) // 登录失败处理
                        .permitAll() // 允许所有用户访问
                )

                // 权限设置
                .authorizeHttpRequests(authorizeHttpRequests -> authorizeHttpRequests
                        .requestMatchers(HttpMethod.OPTIONS, "/**").permitAll() // 解决options请求
                        .requestMatchers("/", "/captchaCode").permitAll() // 允许访问
                        .requestMatchers(HttpMethod.POST, "/user/login").permitAll() // 允许登录
                        .anyRequest().authenticated() // 其他请求都需要认证
                )

                // 添加过滤器(添加登录之后过滤器)
                .addFilterAfter(tokenFilter, UsernamePasswordAuthenticationFilter.class)

                // 构建
                .build();
    }
}
