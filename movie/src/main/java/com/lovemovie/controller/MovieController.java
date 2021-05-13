package com.lovemovie.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lovemovie.domain.Movie;
import com.lovemovie.service.IMovieService;
import com.lovemovie.model.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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

    /**
     * 首页电影展示，按电影上映时间进行排列
     * @param pageNum
     * @param pageSize
     * @return
     */
    @RequestMapping(value = "/findAllMovies")
    @ResponseBody
    public Msg findAllMovies(Integer pageNum,Integer pageSize ){
        PageHelper.startPage(pageNum, pageSize);
        List<Movie> movieList = movieService.findAllMovies(1);
        PageInfo<Movie> pageInfo = new PageInfo<>(movieList,pageSize);
        System.out.println(pageInfo);
        // return Msg.success().add("movieList",movieList);
        return Msg.success().add("movieList",pageInfo);
    }

    /**
     * 跳转电影详情页，根据电影id查询电影信息
     * @param movieId
     * @return
     */
    @RequestMapping(value = "/movieDetails")
    public ModelAndView movieDetails(Integer movieId) {
        System.out.println("movieId = " + movieId);
        Movie movie = movieService.findMovieByMovieId(movieId);
        System.out.println("movie = " + movie);
        ModelAndView mv = new ModelAndView();
        mv.addObject("movie",movie);
        mv.setViewName("forward:/WEB-INF/views/jsp/movie-details.jsp");
        return mv;
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
