package com.franco.config;

import cn.hutool.json.JSONUtil;
import com.franco.filter.CaptchaFilter;
import com.franco.filter.TokenFilter;
import com.franco.handler.AppLoutSuccessHandler;
import com.franco.handler.MyAuthenticationFailureHandler;
import com.franco.handler.MyAuthenticationSuccessHandler;
import com.franco.result.Result;
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
import org.springframework.security.web.authentication.logout.LogoutFilter;
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
    private AppLoutSuccessHandler appLoutSuccessHandler;

    @Autowired
    private TokenFilter tokenFilter;

    @Autowired
    private CaptchaFilter captchaFilter;

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

                // 登出设置
                .logout(logout -> logout
                        .logoutUrl("/user/logout") // 登出接口
                        .logoutSuccessHandler(appLoutSuccessHandler) // 登出成功处理
                        .permitAll() // 允许所有用户访问
                )

                // 权限设置
                .authorizeHttpRequests(authorizeHttpRequests -> authorizeHttpRequests
                        .requestMatchers(HttpMethod.OPTIONS, "/**").permitAll() // 解决options请求
                        .requestMatchers("/", "/captchaCode").permitAll() // 允许访问
                        .requestMatchers(HttpMethod.POST, "/user/login").permitAll() // 允许登录
                        .anyRequest().authenticated() // 其他请求都需要认证
                )

                // 统一处理 Spring Security 认证和授权异常
                .exceptionHandling(exceptionHandling -> exceptionHandling
                        .authenticationEntryPoint((request, response, authException) -> {
                            response.setStatus(401);
                            response.setContentType("application/json;charset=UTF-8");
                            response.setCharacterEncoding("UTF-8");
                            response.getWriter().write(JSONUtil.toJsonStr(Result.fail(401, "请先登录")));
                        })
                        .accessDeniedHandler((request, response, accessDeniedException) -> {
                            response.setStatus(403);
                            response.setContentType("application/json;charset=UTF-8");
                            response.setCharacterEncoding("UTF-8");
                            response.getWriter().write(JSONUtil.toJsonStr(Result.fail(403, "权限不足")));
                        })
                )

                // 添加验证码过滤器(在用户名密码过滤器前面)
                .addFilterBefore(captchaFilter, UsernamePasswordAuthenticationFilter.class)

                // 添加token验证过滤器(在退出登录过滤器前面)
                .addFilterBefore(tokenFilter, LogoutFilter.class)

                // 构建
                .build();
    }
}
