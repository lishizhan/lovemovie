package com.lovemovie.service;

import com.lovemovie.model.Msg;

/**
 * @Author : Alishiz
 * @Date : 2021/5/3/0003 10:59
 * @email : 1575234570@qq.com
 * @Description :
 */
public interface IUserService {

    public Msg login(String userName, String userPwd);
}
