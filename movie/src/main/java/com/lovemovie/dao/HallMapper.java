package com.lovemovie.dao;

import com.lovemovie.domain.Hall;

public interface HallMapper {
    int deleteByPrimaryKey(Long hallId);

    int insert(Hall record);

    int insertSelective(Hall record);

    Hall selectByPrimaryKey(Long hallId);

    int updateByPrimaryKeySelective(Hall record);

    int updateByPrimaryKey(Hall record);
}