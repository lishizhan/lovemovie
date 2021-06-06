package com.lovemovie.dao;

import com.lovemovie.domain.Hall;

import java.util.List;

public interface HallMapper {
    int deleteByPrimaryKey(String hallId);

    int insert(Hall record);

    int insertSelective(Hall record);

    Hall selectByPrimaryKey(String hallId);

    Hall findHallAndCinemaNameById(String hallId);

    int updateByPrimaryKeySelective(Hall record);

    int updateByPrimaryKey(Hall record);

    List<Hall> findHallByCinemaId(Long cinemaId);

    Hall findHallById(String hallId);
}