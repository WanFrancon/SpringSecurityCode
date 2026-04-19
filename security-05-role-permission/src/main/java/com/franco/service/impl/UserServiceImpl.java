package com.franco.service.impl;

import com.franco.mapper.TRoleMapper;
import com.franco.mapper.TUserMapper;
import com.franco.pojo.TRole;
import com.franco.pojo.TUser;
import com.franco.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService{
    @Autowired
    private TUserMapper tUserMapper;
    @Autowired
    private TRoleMapper tRoleMapper;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        //在数据库中把数据查出来
        TUser tUser = tUserMapper.selectByLoginAct(username);
        if(tUser == null){
            throw  new UsernameNotFoundException("用户不存在");
        }
        //查用户角色表(一个用户可能有多个角色)
        List<TRole> roles = tRoleMapper.selectByUserId(tUser.getId());
        tUser.setRoles(roles);
        return tUser;
    }
}
