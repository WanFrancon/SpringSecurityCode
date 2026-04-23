# Redis + JWT + Spring Security 前后端分离登录修改笔记

## 0. 这次问题在哪里

你遇到的现象是：前端点登录，登录看起来成功了，但是控制台没有打印出 token。

核心原因在后端：

`MyAuthenticationSuccessHandler` 里有两个同名方法：

```java
onAuthenticationSuccess(request, response, chain, authentication)
onAuthenticationSuccess(request, response, authentication)
```

Spring Security 表单登录成功后，默认调用的是 3 个参数的这个方法：

```java
onAuthenticationSuccess(HttpServletRequest request,
                        HttpServletResponse response,
                        Authentication authentication)
```

但是你之前把“生成 token 并返回给前端”的代码写在了 4 个参数的方法里，3 个参数的方法是空的，所以浏览器拿不到 token。

这次修复后：

- 后端登录成功会返回 JSON：`{"code":200,"message":"login success","token":"xxx"}`
- 后端会把 token 存入 Redis：`security:user:token:{用户id}`
- 前端会打印：`token: xxx`
- 前端会把 token 保存到 `localStorage`

## 1. 用小白能理解的话解释

你可以把登录过程理解成进游乐园：

- 用户名和密码：你在门口出示身份证。
- Spring Security：门口安检员，负责检查你是谁、密码对不对、账号有没有被禁用。
- JWT token：检查通过后给你的门票。
- Redis：售票系统后台，记录这张票还有效。
- 前端：拿到门票后，以后访问别的接口时把门票带上。

登录成功后，后端必须把“门票 token”明确写回响应体，前端才能拿到。

之前的问题就是：后端虽然有生成 token 的代码，但写错了回调方法位置，Spring Security 没有执行那段代码。

## 2. 完整请求流程

完整登录流程如下：

1. 浏览器打开 `security-07_V3/index.html`。
2. 用户输入 `username` 和 `password`。
3. 前端用 axios 发 POST 请求到：

```text
http://localhost:8080/user/login
```

4. 请求体是表单格式：

```text
username=xxx&password=xxx
```

5. 请求进入后端 Spring Security 过滤器链。
6. `UsernamePasswordAuthenticationFilter` 拦截 `/user/login`。
7. Spring Security 从请求里取出 `username`、`password`。
8. 调用 `UserServiceImpl#loadUserByUsername`。
9. 后端根据用户名去数据库查 `t_user`。
10. Spring Security 用 `BCryptPasswordEncoder` 校验密码。
11. 如果密码正确，调用 `MyAuthenticationSuccessHandler`。
12. 成功处理器生成 JWT。
13. 成功处理器把 JWT 保存到 Redis。
14. 成功处理器把 JWT 返回给前端。
15. 前端从 `result.data.token` 里取出 token。
16. 前端打印 token，并保存到 `localStorage`。

## 3. 后端处理逻辑

### 3.1 SecurityConfig 做了什么

`SecurityConfig` 是 Spring Security 的核心配置。

这次整理后，重点配置是：

```java
.formLogin(formLogin -> formLogin
        .loginProcessingUrl("/user/login")
        .successHandler(myAuthenticationSuccessHandler)
        .failureHandler(myAuthenticationFailureHandler)
        .permitAll()
)
```

意思是：

- `/user/login` 是登录接口。
- 登录成功走 `MyAuthenticationSuccessHandler`。
- 登录失败走 `MyAuthenticationFailureHandler`。

还配置了：

```java
.sessionManagement(sessionManagement ->
        sessionManagement.sessionCreationPolicy(SessionCreationPolicy.STATELESS))
```

意思是：后端不靠 Session 记住登录状态，而是靠 token。

### 3.2 登录成功处理器做了什么

登录成功后：

```java
TUser tUser = (TUser) authentication.getPrincipal();
String userJSON = JSONUtil.toJsonStr(tUser);
String token = JWTUtil.createToken(Map.of("user", userJSON), SECRET.getBytes());
redisTemplate.opsForValue().set(Constant.USER_LOGIN_KEY + tUser.getId(), token, expiration, TimeUnit.SECONDS);
```

这几行的意思是：

- 从 `authentication` 里拿到当前登录用户。
- 把用户对象转成 JSON。
- 用 Hutool 生成 JWT。
- 把 token 存进 Redis，并设置过期时间。

最后返回给前端：

```java
response.getWriter().write(JSONUtil.toJsonStr(Map.of(
        "code", 200,
        "message", "login success",
        "token", token
)));
```

### 3.3 Redis 在这里的作用

JWT 本身是无状态的。只要签名正确，它理论上可以一直被拿来访问，直到过期。

Redis 的作用是：让后端可以主动管理 token。

比如：

- 用户退出登录，可以删除 Redis 里的 token。
- 修改密码后，可以删除旧 token。
- 后台封号后，可以删除 token。
- 可以判断前端带来的 token 是否还是服务端承认的 token。

当前项目已经在登录时存 token，但还没有完整写“后续请求校验 token 的过滤器”。这会是下一步要补的重点。

## 4. 前端处理逻辑

前端登录成功后，现在这样取 token：

```js
const token = result.data?.token;
console.log("login response:", result.data);
console.log("token:", token);
```

保存 token：

```js
localStorage.setItem("token", token);
```

退出登录时删除 token：

```js
localStorage.removeItem("token");
```

后续访问需要登录的接口时，常见写法是把 token 放到请求头：

```js
axios.get("http://localhost:8080/welcome1", {
  headers: {
    Authorization: "Bearer " + localStorage.getItem("token"),
  },
});
```

但是注意：后端必须加 JWT 校验过滤器，否则后端并不会自动识别这个请求头。

## 5. 面试问题

### 5.1 JWT 是什么

JWT 是一种 token 格式，通常由三段组成：

```text
header.payload.signature
```

- header：说明算法和 token 类型。
- payload：保存用户信息、过期时间等。
- signature：签名，防止 token 被篡改。

### 5.2 JWT 和 Session 有什么区别

Session：

- 登录状态主要存在服务端。
- 浏览器通常靠 Cookie 携带 sessionId。
- 服务端压力更大，但主动失效比较简单。

JWT：

- 登录状态主要体现在 token 上。
- 前端一般放在请求头里。
- 服务端可以不存登录状态，但主动失效比较麻烦。

### 5.3 为什么 JWT 还要配 Redis

因为纯 JWT 不好主动踢人下线。

有 Redis 后，后端可以判断：

- token 签名对不对。
- token 过期没有。
- Redis 里是否还存在这个 token。
- Redis 里的 token 是否和前端传来的一样。

### 5.4 Spring Security 登录成功后为什么要写 SuccessHandler

前后端分离项目不需要跳转 HTML 页面，而是需要返回 JSON。

默认的 Spring Security 表单登录更偏传统页面跳转，所以我们要自定义：

- 成功时返回 JSON + token。
- 失败时返回 JSON 错误信息。

### 5.5 为什么要禁用 CSRF

CSRF 主要防的是浏览器自动带 Cookie 导致的攻击。

前后端分离 JWT 项目一般不靠 Cookie 保存登录状态，而是前端主动在请求头带 token，所以通常会禁用 CSRF。

## 6. 难点

### 6.1 Spring Security 不是直接进 Controller

登录接口 `/user/login` 不需要你自己写 Controller。

请求会先被 Spring Security 的过滤器拦截，然后由 Spring Security 调用你的 `UserDetailsService` 去查用户。

### 6.2 authentication 是什么

`Authentication` 可以理解成“认证结果对象”。

登录成功后，它里面会有：

- 当前用户：`authentication.getPrincipal()`
- 权限信息：`authentication.getAuthorities()`
- 是否已认证：`authentication.isAuthenticated()`

### 6.3 UserDetails 很重要

你的 `TUser` 实现了 `UserDetails`，所以它必须正确实现这些方法：

- `getUsername()`
- `getPassword()`
- `getAuthorities()`
- `isAccountNonExpired()`
- `isAccountNonLocked()`
- `isCredentialsNonExpired()`
- `isEnabled()`

这次顺手把 `getAuthorities()` 从 `null` 改成了 `List.of()`。

原因是：没有权限也应该返回空集合，不能返回 `null`。

## 7. 容易混淆的知识点

### 7.1 登录成功不等于前端拿到了 token

后端认证成功，只代表用户名和密码对了。

前端能不能拿到 token，还要看成功处理器有没有把 token 写进响应体。

### 7.2 Redis 存 token 不等于后端会自动校验 token

登录时把 token 存进 Redis，只是第一步。

后续请求要想真正鉴权，还需要写 JWT 过滤器：

1. 从请求头拿 `Authorization`。
2. 去掉 `Bearer ` 前缀。
3. 校验 JWT 签名。
4. 解析用户信息。
5. 去 Redis 查 token 是否存在。
6. 放入 `SecurityContextHolder`。

### 7.3 permitAll 不是随便放

之前配置里有：

```java
.requestMatchers(HttpMethod.POST).permitAll()
```

这会放行所有 POST 请求，真实项目不推荐。

这次改成只放行：

```java
.requestMatchers(HttpMethod.POST, "/user/login").permitAll()
```

### 7.4 localStorage 和 Cookie 的区别

`localStorage`：

- JS 可以直接读写。
- 容易受到 XSS 影响。
- 常见于简单前后端分离项目。

Cookie：

- 可以设置 `HttpOnly`，让 JS 读不到。
- 如果用 Cookie 保存登录态，要重新考虑 CSRF。

## 8. 拓展问题和后续学习方向

下一步建议按这个顺序学：

1. 写 JWT 校验过滤器 `JwtAuthenticationFilter`。
2. 学 `OncePerRequestFilter`。
3. 学 `SecurityContextHolder`。
4. 学权限注解：`@PreAuthorize`。
5. 学角色和权限表设计：用户、角色、权限、用户角色、角色权限。
6. 学刷新 token：access token + refresh token。
7. 学退出登录：删除 Redis token。
8. 学统一返回结果：`Result<T>`。
9. 学统一异常处理：`@RestControllerAdvice`。
10. 学前端 axios 请求拦截器，自动加 `Authorization` 请求头。

主流方向：

- 前后端分离：JWT + Redis + Spring Security。
- 企业后台：RBAC 权限模型。
- 微服务：OAuth2 / Spring Authorization Server。
- 大厂系统：SSO 单点登录、网关统一鉴权、短 token + 长 refresh token。

## 9. 底层原理

### 9.1 Spring Security 的本质是过滤器链

请求到 Controller 之前，会先经过一串过滤器。

登录请求大概会经过：

```text
浏览器请求
  -> SecurityFilterChain
  -> UsernamePasswordAuthenticationFilter
  -> AuthenticationManager
  -> DaoAuthenticationProvider
  -> UserDetailsService
  -> PasswordEncoder
  -> SuccessHandler / FailureHandler
```

所以你不要以为 `/user/login` 一定要自己写 Controller。

Spring Security 可以直接帮你处理登录。

### 9.2 JWT 为什么不能被随便改

JWT 第三段是签名。

后端用密钥对前两段内容签名。

如果别人改了 payload 里的用户信息，签名就对不上，后端校验会失败。

但是 JWT 的 payload 只是 Base64URL 编码，不是加密，所以不要把密码、身份证号这类敏感信息放进去。

### 9.3 Redis 为什么能控制 JWT

JWT 自己是无状态的。

Redis 是服务端状态。

把 token 存 Redis 后，后端可以多做一层判断：

```text
JWT 签名正确 + Redis 里也存在这个 token = 允许访问
```

如果用户退出登录，就删除 Redis 里的 token。

这样即使前端还拿着旧 token，后端也可以拒绝它。

## 10. 总结

这次不是前端不会打印，而是后端没有在 Spring Security 实际调用的成功回调里返回 token。

正确思路是：

1. 登录请求交给 Spring Security。
2. `UserDetailsService` 查数据库用户。
3. `PasswordEncoder` 校验密码。
4. 成功后在 `AuthenticationSuccessHandler` 生成 JWT。
5. token 存 Redis。
6. token 返回给前端。
7. 前端打印并保存 token。
8. 后续请求带上 token。
9. 后端用 JWT 过滤器校验 token。

当前已经修好了“登录成功后前端拿不到 token”的问题。

后续真正做完整登录鉴权时，建议继续补：JWT 校验过滤器、退出登录接口、axios 请求拦截器、统一返回结果。
