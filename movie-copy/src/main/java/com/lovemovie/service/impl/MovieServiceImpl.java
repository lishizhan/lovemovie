package com.lovemovie.service.impl;

import com.lovemovie.dao.MovieMapper;
import com.lovemovie.domain.Movie;
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
}
