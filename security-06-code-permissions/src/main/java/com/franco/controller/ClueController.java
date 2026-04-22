package com.franco.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api/clue")
public class ClueController {
    /**
     * 线索管理
     *
     * 列表
     * 录入
     * 编辑
     * 删除
     * 查看
     *
     * @Preauthorize 注解的使用：
     * 使用权限 code方式的 时候
     * 参数hasAuthority命名规范(权限标志符)：功能名 或者 项目名:功能名(和数据库code字段一样)
     */


    //所有用户都有的权限
    @RequestMapping("/list")
    public String list() {
        return "线索列表";
    }

    //用户角色是saler才有权限s
    @PreAuthorize("hasAuthority('clue:add')")
    @RequestMapping("/add")
    public String add() {
        return "线索录入";
    }
    //用户角色是saler才有权限
    @PreAuthorize("hasAuthority('clue:edit')")
    @RequestMapping("/edit")
    public String edit() {
        return "线索编辑";
    }


    //（admin）（manage）都有权限
    @PreAuthorize("hasAnyAuthority('clue:admin','clue:delete')")
    @RequestMapping("/delete")
    public String delete() {
        return "线索删除";
    }


    //用户角色是saler才有权限
    @PreAuthorize("hasAuthority('clue:view')")
    @RequestMapping("/view")
    public String view() {
        return "线索查看";
    }
}
