package com.lovemovie.service.impl;

import com.lovemovie.dao.MovieMapper;
import com.lovemovie.domain.Movie;
import com.lovemovie.domain.MovieInfo;
import com.lovemovie.model.Msg;
import com.lovemovie.service.IMovieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author : Alishiz
 * @Date : 2021/5/3/0003 11:04
 * @email : 1575234570@qq.com
 * @Description :
 */
@Service
public class MovieServiceImpl implements IMovieService {
    @Autowired
    private MovieMapper movieMapper;
    @Override
    public List<Movie> findAllMovies(int movie_state) {

        return movieMapper.findAllMovies(movie_state);
    }

    @Override
    public Movie findMovieByMovieId(Integer movieId) {
        return movieMapper.selectByPrimaryKey(new Long(movieId));
    }

    @Override
    public List<Movie> findAllMovies() {

        List<Movie> allMovies = movieMapper.findMoviesAll();

        return allMovies;
    }

    @Override
    public Msg addMovie(MovieInfo movieInfo) {
        //字段校验





        return null;
    }
}
