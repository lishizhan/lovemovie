package com.lovemovie.service;

import com.lovemovie.domain.User;
import com.lovemovie.model.Msg;

import java.text.ParseException;
import java.util.List;

/**
 * @Author : Alishiz
 * @Date : 2021/5/3/0003 10:59
 * @email : 1575234570@qq.com
 * @Description :
 */
public interface IUserService {

    public Msg login(String userName, String userPwd);

    List<User> getAllUser(String userName);

    Msg register(String userName, String userEmail, String userPwd);

    Msg checkUserName(String userName);

    Msg updateHeadImg(Long userId, String path);

    Msg updatePwd(String oldPwd, String newPwd, String truePwd, User user);

    Msg updateUserInfo(Integer userId, String userEmail, String userSex, String[] userHobby, String userBirthday) throws ParseException;

    Msg getUserByd(Integer userId);

    void deleteBatch(int[] ints);

    Msg deleteMovieById(String userId);

    Msg addUser(User user);
}
