package com.lovemovie.controller;

import com.lovemovie.domain.Movie;
import com.lovemovie.service.IMovieService;
import com.lovemovie.model.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @Author : Alishiz
 * @Date : 2021/5/3/0003 10:52
 * @email : 1575234570@qq.com
 * @Description : 电影管理模块
 */
@Controller
@RequestMapping(value = "/movie")
public class MovieController {

    @Autowired
    private IMovieService movieService;

    @RequestMapping(value = "/findAllMovies")
    @ResponseBody
    public Msg findAllMovies(){

        List<Movie> movieList = movieService.findAllMovies(1);


        return Msg.success().add("movieList",movieList);
    }





    /**
     * 测试接口
     * @return
     */
    @RequestMapping(value = "/test")
    @ResponseBody
    public Msg test(){
        return Msg.success();
    }
}
