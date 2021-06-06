package com.lovemovie.service;

import com.lovemovie.domain.Actor;
import com.lovemovie.domain.Movie;
import com.lovemovie.domain.MovieInfo;
import com.lovemovie.model.FilmParam;
import com.lovemovie.model.Msg;
import org.apache.commons.io.FilenameUtils;

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
    List<Movie> findAllMovies(String movieName);

    /**
     * 添加电影
     * @return
     * @param movieInfo
     */
    Msg addMovie(MovieInfo movieInfo) throws ParseException;

    /**
     * 查询电影名称是否存在
     * @param movieName
     * @return
     */
    Msg findMovieNameIsExist(String movieName);

    /**
     * 根据电影id删除电影
     * @param movieId
     * @return
     */
    Msg deleteMovieById(String movieId);

    /**
     * 批量删除电影
     * @param ints
     */
    void deleteBatch(int[] ints);

    /**
     * 电影模块搜索
     * @param filmParam
     * @return
     */
    List<Movie> findMovies(FilmParam filmParam);

    /**
     * 按电影名字魔法查询
     * @param searchName
     * @return
     */
    List<Movie> findMovieByNameLike(String searchName);
}
