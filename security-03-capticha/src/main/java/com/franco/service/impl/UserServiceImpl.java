package com.franco.service.impl;

import com.franco.mapper.TUserMapper;
import com.franco.pojo.TUser;
import com.franco.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private TUserMapper tUserMapper;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        //在数据库中把数据查出来
        TUser tUser = tUserMapper.selectByLoginAct(username);
        if(tUser == null){
            throw  new UsernameNotFoundException("用户不存在");
        }

        //使用springSecurity的User类，并封装为 UserDetails 返回
        return User.builder()
                .username(tUser.getLoginAct())
                .password(tUser.getLoginPwd())
                .authorities(AuthorityUtils.NO_AUTHORITIES)
                .build();
    }
}
