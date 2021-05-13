package com.lovemovie.service;

import com.lovemovie.domain.User;
import com.lovemovie.model.Msg;

import java.util.List;

/**
 * @Author : Alishiz
 * @Date : 2021/5/3/0003 10:59
 * @email : 1575234570@qq.com
 * @Description :
 */
public interface IUserService {

    public Msg login(String userName, String userPwd);

    List<User> getAllUser();

    Msg register(String userName, String userEmail, String userPwd);

    Msg checkUserName(String userName);
}
