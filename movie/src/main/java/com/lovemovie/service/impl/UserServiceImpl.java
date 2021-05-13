package com.lovemovie.service.impl;

import com.lovemovie.dao.UserMapper;
import com.lovemovie.domain.User;
import com.lovemovie.model.Msg;
import com.lovemovie.service.IUserService;
import com.lovemovie.utils.AssertUtil;
import com.lovemovie.utils.MD5Util;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author : Alishiz
 * @Date : 2021/5/3/0003 18:14
 * @email : 1575234570@qq.com
 * @Description :
 */
@Service
public class UserServiceImpl implements IUserService {

    @Autowired
    private UserMapper userMapper;

    public Msg login(String userName, String userPwd){
        //判断参数是否合法是否为空
        AssertUtil.isTrue(StringUtils.isBlank(userName),"用户名不能为空");
        AssertUtil.isTrue(StringUtils.isBlank(userPwd),"密码不能为空");

        //根据用户名查询用户
        User user = userMapper.queryUserByName(userName);
        AssertUtil.isTrue(user == null,"用户或密码不正确");
        AssertUtil.isTrue(!user.getUserPwd().equals(MD5Util.getMD5(userPwd)),"用户或密码不正确");

        //经过以上判断后返回成功登陆信息
        return Msg.success().add("user",user);


    }

    @Override
    public List<User> getAllUser() {
        return userMapper.queryAllUser();
    }

    @Override
    public Msg register(String userName, String userEmail, String userPwd) {
//将用户信息保存进入数据库
        AssertUtil.isTrue(userName==null, "用户名不能为空");
        AssertUtil.isTrue(userEmail==null,"邮箱不能为空");
        AssertUtil.isTrue(userPwd==null,"密码不能为空");
        User saveUser = new User();
        saveUser.setUserName(userName);
        saveUser.setUserEmail(userEmail);
        saveUser.setUserPwd(MD5Util.getMD5(userPwd));
        saveUser.setUserRole(0);
        userMapper.insertSelective(saveUser);
        return Msg.success();
    }

    @Override
    public Msg checkUserName(String userName) {
        AssertUtil.isTrue(StringUtils.isBlank(userName),"用户名不能为空");
        //检查用户输入的用户名是否合法
        String regx = "(^[a-zA-Z0-9_-]{4,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
        AssertUtil.isTrue(!userName.matches(regx),"用户名不合法");
        User user = userMapper.queryUserByName(userName);
        AssertUtil.isNotUserName(user!=null,"该用户名已经有小伙伴在使用了");

        return Msg.success().add("msg","用户名可以使用");
    }


}
