package com.franco.service.impl;

import com.franco.mapper.TUserMapper;
import com.franco.pojo.TUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class UserService implements com.franco.service.UserService {
    @Autowired
    private TUserMapper tUserMapper;
    /**
     * 在登录的过程中，会Security框架调用此方法，根据用户名查询用户信息
     *
     * @param username 这个是用户名，就是用户输入的（需要接受的）
     * @return
     * @throws UsernameNotFoundException
     */
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
       TUser tUser = tUserMapper.selectByLoginAct(username);

        if(tUser == null){
            throw new UsernameNotFoundException("用户不存在");
        }

        return User.builder()
                .username(tUser.getLoginAct()) //前端输入的账号
                .password(tUser.getLoginPwd()) //拿数据库的密码和前端输入的密码进行匹配
                .authorities(AuthorityUtils.NO_AUTHORITIES) //权限为空
                .build();
    }
}
