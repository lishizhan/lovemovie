package com.lovemovie.service;

import com.lovemovie.domain.Movie;
import com.lovemovie.domain.MovieInfo;
import com.lovemovie.model.Msg;

import java.text.ParseException;
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

    /**
     * 添加电影
     * @return
     * @param movieInfo
     */
    Msg addMovie(MovieInfo movieInfo) throws ParseException;
}
