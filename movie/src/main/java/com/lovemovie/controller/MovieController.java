package com.lovemovie.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lovemovie.domain.Actor;
import com.lovemovie.domain.Movie;
import com.lovemovie.model.FilmParam;
import com.lovemovie.service.IActorService;
import com.lovemovie.service.IMovieService;
import com.lovemovie.model.Msg;
import com.lovemovie.utils.AssertUtil;
import com.lovemovie.utils.ImageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

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

    @Autowired
    private IActorService actorService;

    /**
     * 首页电影展示，按电影上映时间进行排列
     *
     * @param pageNum
     * @param pageSize
     * @return
     */
    @RequestMapping(value = "/findAllMovies")
    @ResponseBody
    public Msg findAllMovies(Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Movie> movieList = movieService.findAllMovies(1);
        PageInfo<Movie> pageInfo = new PageInfo<>(movieList, pageSize);
        System.out.println(pageInfo);
        // return Msg.success().add("movieList",movieList);
        return Msg.success().add("movieList", pageInfo);
    }

    /**
     * 跳转电影详情页，根据电影id查询电影信息
     *
     * @param movieId
     * @return
     */
    @RequestMapping(value = "/movieDetails")
    public ModelAndView movieDetails(Integer movieId) {
        System.out.println("movieId = " + movieId);
        Movie movie = movieService.findMovieByMovieId(movieId);
        System.out.println("movie = " + movie);
        Map<String, Object> listActor = null;
        if (movie != null) {
            //获取演职人员信息
            listActor = actorService.getActorById(movie.getMovieDirector(), movie.getMovieActor());
        }

        ModelAndView mv = new ModelAndView();
        mv.addObject("movie", movie);
        mv.addObject("listActor", listActor);
        mv.setViewName("forward:/WEB-INF/views/jsp/movie-details.jsp");
        return mv;
    }

    /**
     * 首页电影展示，按电影上映时间进行排列
     *
     * @param pageNum
     * @return
     */
    @RequestMapping(value = "/findAllTypeMovies")
    @ResponseBody
    public Msg findAllTypeMovies(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum) {
        //分页插件,传入页面的，每页几条
        PageHelper.startPage(pageNum, 15);
        List<Movie> allMovies = movieService.findAllMovies();
        //使用pageInfo包装查询后的结果,包括我们查询出来的数据。传入连续显示的页数
        PageInfo<Movie> pageInfo = new PageInfo<>(allMovies, 15);
        return Msg.success().add("movieList", pageInfo);

    }

    /**
     * pageNum:页码、sortId：排序、typeId：类型、sourceId：区域、yearId：上映年份
     * @return
     */
    @RequestMapping(value = "/movies")
    @ResponseBody
    public Msg findMovies(FilmParam filmParam) {
        System.out.println("filmParam = " + filmParam);
        //分页插件,传入页面的，每页几条
        PageHelper.startPage(Integer.parseInt(filmParam.getPageNum()), 15);
        List<Movie> allMovies = movieService.findMovies(filmParam);
        //使用pageInfo包装查询后的结果,包括我们查询出来的数据。传入连续显示的页数
        PageInfo<Movie> pageInfo = new PageInfo<>(allMovies, 15);
        return Msg.success().add("movieList", pageInfo);
    }

    /**
     * 首页电影展示，按电影上映时间进行排列
     *
     * @param pageNum
     * @return
     */
    @RequestMapping(value = "/film")
    @ResponseBody
    public Msg film(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum) {
        //分页插件,传入页面的，每页几条
        PageHelper.startPage(pageNum, 15);
        List<Movie> allMovies = movieService.findAllMovies();
        //使用pageInfo包装查询后的结果,包括我们查询出来的数据。传入连续显示的页数
        PageInfo<Movie> pageInfo = new PageInfo<>(allMovies, 15);
        return Msg.success().add("movieList", pageInfo);

    }


    @RequestMapping(value = "/search")
    public String search(String searchName) {
        System.out.println("searchName = " + searchName);
        return "jsp/movie-search";
    }


    /**
     * 根据电影类型搜索
     *
     * @return
     */
    @RequestMapping(value = "/findMoviesByType")
    public Msg findMoviesByType() {

        return null;
    }

    /**
     * 根据评分、上映时间、热度进行排序
     *
     * @return
     */
    @RequestMapping(value = "/sortAllMovies")
    public Msg sortAllMovies(String sortId) {
        switch (sortId) {
            case "1":
                break;
            case "2":
                break;
            case "3":
                break;
            default:
                break;
        }


        return null;
    }


    /**
     * 测试接口
     *
     * @return
     */
    @RequestMapping(value = "/test")
    @ResponseBody
    public Msg test() {
        return Msg.success();
    }

    @RequestMapping(value = "/fileUpload")
    @ResponseBody
    public Msg testUpload(HttpServletRequest request, MultipartFile upload) throws Exception {
        String imgPath = ImageUtils.upload(request, upload);
        System.out.println("imgPath = " + imgPath);
        return Msg.success();
    }


}
