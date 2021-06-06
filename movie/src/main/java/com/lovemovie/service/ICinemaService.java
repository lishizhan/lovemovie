package com.lovemovie.service;

import com.lovemovie.domain.Cinema;

import java.util.List;

/**
 * @Author : Alishiz
 * @Date : 2021/5/3/0003 10:59
 * @email : 1575234570@qq.com
 * @Description :
 */
public interface ICinemaService {
    List<Cinema> findCinemasByMovieId(Integer movieId);

    List<Cinema> findAllCinemas();

    Cinema findCinemas(Integer cinemaId);
}
