package com.lovemovie.dao;

import com.lovemovie.domain.Cinema;

import java.util.List;

public interface CinemaMapper {
    int deleteByPrimaryKey(Long cinemaId);

    int insert(Cinema record);

    int insertSelective(Cinema record);

    Cinema selectByPrimaryKey(Long cinemaId);

    int updateByPrimaryKeySelective(Cinema record);

    int updateByPrimaryKey(Cinema record);

    List<Cinema> findCinemasByMovieId(Long movieId);

    List<Cinema> findAllCinemas();

    Cinema findCinemaById(Long cinemaId);
}