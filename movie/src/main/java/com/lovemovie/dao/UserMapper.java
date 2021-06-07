package com.lovemovie.dao;

import com.lovemovie.domain.User;

import java.util.List;

public interface UserMapper {
    int deleteByPrimaryKey(Long userId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Long userId);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    User queryUserByName(String userName);

    List<User> queryAllUser(String userName);

    void deleteBatch(int[] ints);

    User findUserById(Long userId);
}