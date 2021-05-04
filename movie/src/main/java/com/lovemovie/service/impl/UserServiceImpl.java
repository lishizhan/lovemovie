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
        /*if (StringUtils.isBlank(userName)){
            return Msg.fail().add("msg", "用户名不能为空");
        }*/
        AssertUtil.isTrue(StringUtils.isBlank(userName),"用户名不能为空");
        /*if (StringUtils.isBlank(userPwd)){
            return Msg.fail().add("msg", "密码不能为空");
        }*/
        AssertUtil.isTrue(StringUtils.isBlank(userPwd),"密码不能为空");

        //根据用户名查询用户
        User user = userMapper.queryUserByName(userName);
        /*if (user ==null){
            return Msg.fail().add("msg", "用户或密码不正确");
        }*/
        AssertUtil.isTrue(user == null,"用户或密码不正确");
        AssertUtil.isTrue(!user.getUserPwd().equals(MD5Util.getMD5(userPwd)),"用户或密码不正确");

        //经过以上判断后返回成功登陆信息
        return Msg.success().add("user",user);

        //检验密码是否正确
        /*if (user.getUserPwd().equals(MD5Util.getMD5(userPwd))){
            return Msg.success().add("user",user);
        }else {
            return Msg.fail().add("msg", "用户或密码不正确");
        }*/

    }





}
