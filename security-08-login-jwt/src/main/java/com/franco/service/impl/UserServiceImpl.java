package com.franco.service.impl;

import com.franco.mapper.TPermissionMapper;
import com.franco.mapper.TUserMapper;
import com.franco.pojo.TPermission;
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
    private TPermissionMapper tPermissionMapper;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        //在数据库中把数据查出来
        TUser tUser = tUserMapper.selectByLoginAct(username);
        if(tUser == null){
            throw  new UsernameNotFoundException("用户不存在");
        }
        List<TPermission> tPermissions = tPermissionMapper.selectByUserId(tUser.getId());
        tUser.setTPermission(tPermissions);
        return tUser;
    }
}
