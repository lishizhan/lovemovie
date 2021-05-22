package com.lovemovie.service;

import com.lovemovie.domain.Movie;

import java.util.List;

/**
 * @Author : Alishiz
 * @Date : 2021/5/3/0003 10:58
 * @email : 1575234570@qq.com
 * @Description :
 */
public interface IMovieService {


    /**
     * 根据电影的状态查询所有电影
     * @param movie_state
     * @return
     */
    List<Movie> findAllMovies(int movie_state);

    Movie findMovieByMovieId(Integer movieId);

    /**
     * 查询所有的电影
     * @return
     */
    List<Movie> findAllMovies();
}
