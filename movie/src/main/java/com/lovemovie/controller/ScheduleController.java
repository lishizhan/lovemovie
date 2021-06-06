package com.lovemovie.controller;

import com.alibaba.druid.sql.dialect.sqlserver.visitor.SQLServerOutputVisitor;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lovemovie.domain.*;
import com.lovemovie.model.Msg;
import com.lovemovie.service.ICinemaService;
import com.lovemovie.service.IHallService;
import com.lovemovie.service.IMovieService;
import com.lovemovie.service.IScheduleService;
import com.lovemovie.utils.UUIDUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author : Alishiz
 * @Date : 2021/6/6/0006 0:49
 * @email : 1575234570@qq.com
 * @Description :
 */
@Controller
@RequestMapping(value = "/schedule")
public class ScheduleController {
    @Autowired
    private IMovieService movieService;

    @Autowired
    private IHallService hallService;

    @Autowired
    private IScheduleService scheduleService;

    @Autowired
    private ICinemaService cinemaService;

    /*@RequestMapping(value = "/findAllSchedule")
    public Msg findAllSchedule(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
                               @RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize){

        PageHelper.startPage(pageNum,pageSize);
        List<Schedule> scheduleList =  scheduleService.findAllSchedule();
        PageInfo<Schedule> pageInfo = new PageInfo<>(scheduleList, pageSize);
        return Msg.success().add("scheduleList",pageInfo);
    }*/




    @RequestMapping("findAllSchedule")
    @ResponseBody
    public Msg findAllSchedule(@RequestParam(value="pageNum",defaultValue="1")Integer pageNum,
                               @RequestParam(value="pageSize",defaultValue="10")Integer pageSize,
                               @RequestParam("movieName")String movieName) {

        PageHelper.startPage(pageNum,pageSize);
        List<Schedule> allSchedule = scheduleService.findAllSchedule(movieName);
        PageInfo<Schedule> pageInfo = new PageInfo<>(allSchedule,pageSize);
        return Msg.success().add("allSchedule",pageInfo);
    }

    /**
     * 查询所有正在上映的电影
     * @return
     */
    @RequestMapping(value = "/findAllMovieName")
    @ResponseBody
    public Msg findAllMovieName(){
        List<Movie> movieList = movieService.findAllMovies(1);
        return Msg.success().add("movieList", movieList);
    }
    /**
     * 查询所有电影院
     * @return
     */
    @RequestMapping(value = "/findAllCinemaName")
    @ResponseBody
    public Msg findAllCinemaName(){

        List<Cinema> cinemaList = cinemaService.findAllCinemas();
        return Msg.success().add("cinemaList",cinemaList);
    }

    /**
     * 添加场次
     * @return
     */
    @RequestMapping(value = "/addSchedule")
    @ResponseBody
    public Msg addSchedule(@RequestParam("movieName") String movieName,
                           @RequestParam("hallName")String hallName,
                           @RequestParam("cinemaName")String cinemaName,
                           @RequestParam("schedulePrice")int schedulePrice,
                           @RequestParam("scheduleStartTime")String scheduleStartTime){
        System.out.println("movieName = " + movieName);
        System.out.println("hallName = " + hallName);
        System.out.println("cinemaName = " + cinemaName);
        System.out.println("schedulePrice = " + schedulePrice);
        System.out.println("scheduleStartTime = " + scheduleStartTime);

        Msg msg = scheduleService.addScheduleService(movieName,hallName,cinemaName,schedulePrice,scheduleStartTime);

        return msg;
    }

    //根据用户id删除用户，单个删除和批量删除二合一，1-2-3-4，1
    @RequestMapping(value = "/deleteSchedule/{scheduleId}", method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteComment(@PathVariable("scheduleId") String scheduleId) {
        System.out.println("ids = " + scheduleId);
        if (scheduleId.contains("-")) {
            //批量删除
            String[] arrId = scheduleId.split("-");
            int[] ints = new int[arrId.length];
            for (int i = 0; i < arrId.length; i++) {
                ints[i] = Integer.parseInt(arrId[i]);
            }
            // System.out.println("int[]:"+ Arrays.toString(ints));
            scheduleService.deleteBatch(ints);
            return Msg.success();
        } else {
            //单个删除
            return scheduleService.deleteMovieById(scheduleId);
        }
    }




    /**
     * 根据电影id找到所有放映电影的影院列表
     * @param movieId
     * @return
     */
    @RequestMapping(value = "/findCinemasByMovieId")
    public Msg findCinemasByMovieId(Integer movieId){
        List<Cinema> cinemaList = cinemaService.findCinemasByMovieId(movieId);
        return Msg.success().add("cinemaList",cinemaList);
    }




}
