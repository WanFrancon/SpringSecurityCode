package com.franco.pojo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import org.springframework.lang.Nullable;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

/**
 * 用户表
 * t_user
 */
@Data
public class TUser implements Serializable , UserDetails {
    /**
     * 主键，自动增长，用户ID
     */
    private Integer id;

    /**
     * 登录账号
     */
    private String loginAct;

    /**
     * 登录密码
     */
    @JsonIgnore
    private String loginPwd;

    /**
     * 用户姓名
     */
    private String name;

    /**
     * 用户手机
     */
    private String phone;

    /**
     * 用户邮箱
     */
    private String email;

    /**
     * 账户是否没有过期，0已过期 1正常
     */
    private Integer accountNoExpired;

    /**
     * 密码是否没有过期，0已过期 1正常
     */
    private Integer credentialsNoExpired;

    /**
     * 账号是否没有锁定，0已锁定 1正常
     */
    private Integer accountNoLocked;

    /**
     * 账号是否启用，0禁用 1启用
     */
    private Integer accountEnabled;

    /**
     * 创建时间
     */

    private Date createTime;

    /**
     * 创建人
     */
    private Integer createBy;

    /**
     * 编辑时间
     */

    private Date editTime;

    /**
     * 编辑人
     */
    private Integer editBy;

    /**
     * 最近登录时间
     */

    private Date lastLoginTime;

    private static final long serialVersionUID = 1L;

    /**
     * 角色表
     */
    @JsonIgnore
    List<TRole> roles;

/*-------------------------------- 实现UserDetails 的七个方法 --------------------------------*/
    /*
    * 返回用户的权限(角色、权限code)
     */
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        Collection<GrantedAuthority>  authorities = new ArrayList<>();
        for (TRole role : this.roles) {

            //放入角色 需要加ROLE_ 前缀 才能被 @PerAuthorize("hasRole()") 识别
            authorities.add(new SimpleGrantedAuthority("ROLE_"+role.getRole()));

            //放入权限 (权限标识符，权限code，权限代码)
//            authorities.add(new SimpleGrantedAuthority(tPermission.getPermission()));
        }
        return authorities;
    }

    /**
     * 获取密码
     * @return
     * 密码
     */
    @JsonIgnore //忽略该字段，不参与json转换
    @Override
    public @Nullable String getPassword() {
        return this.loginPwd;
    }

    /**
     * 获取用户名
     * @return
     * 用户名
     */
    @Override
    public String getUsername() {
        return this.loginAct;
    }

    /**
     * 账户是否没有过期
     * @return turn 已过期 ,false正常(0已过期 1正常)
     */
    @Override
    public boolean isAccountNonExpired() {
        return this.accountNoExpired == 1;
    }

    /**
     * 账户是否没有锁定
     * @return
     * ture 锁定 ,false正常(0已锁定 1正常)
     */
    @Override
    public boolean isAccountNonLocked() {
        return this.accountNoLocked == 1;
    }

    /**
     * 密码是否没有过期
     * @return
     * ture 锁定 ,false正常(0已锁定 1正常)
     */
    @Override
    public boolean isCredentialsNonExpired() {
        return this.credentialsNoExpired == 1;
    }

    /**
     * 账户是否启用
     * @return
     * ture 锁定 ,false正常(0禁用 1启用)
     */
    @Override
    public boolean isEnabled() {
        return this.accountEnabled == 1;
    }
}