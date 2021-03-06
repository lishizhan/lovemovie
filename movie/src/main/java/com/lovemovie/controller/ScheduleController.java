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
import org.springframework.web.servlet.ModelAndView;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
     * ?????????????????????????????????
     * @return
     */
    @RequestMapping(value = "/findAllMovieName")
    @ResponseBody
    public Msg findAllMovieName(){
        List<Movie> movieList = movieService.findAllMovies(1);
        return Msg.success().add("movieList", movieList);
    }
    /**
     * ?????????????????????
     * @return
     */
    @RequestMapping(value = "/findAllCinemaName")
    @ResponseBody
    public Msg findAllCinemaName(){

        List<Cinema> cinemaList = cinemaService.findAllCinemas();
        return Msg.success().add("cinemaList",cinemaList);
    }

    /**
     * ????????????
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

    //????????????id??????????????????????????????????????????????????????1-2-3-4???1
    @RequestMapping(value = "/deleteSchedule/{scheduleId}", method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteComment(@PathVariable("scheduleId") String scheduleId) {
        System.out.println("ids = " + scheduleId);
        if (scheduleId.contains("-")) {
            //????????????
            String[] arrId = scheduleId.split("-");
            int[] ints = new int[arrId.length];
            for (int i = 0; i < arrId.length; i++) {
                ints[i] = Integer.parseInt(arrId[i]);
            }
            // System.out.println("int[]:"+ Arrays.toString(ints));
            scheduleService.deleteBatch(ints);
            return Msg.success();
        } else {
            //????????????
            return scheduleService.deleteMovieById(scheduleId);
        }
    }

    /**
     * ??????????????????
     * @param movieId
     * @return
     */
    @RequestMapping(value = "/buyTicketDetails")
    public ModelAndView buyTicketDetails(Integer movieId){
        Movie movie = movieService.findMovieByMovieId(movieId);
        ModelAndView mv = new ModelAndView();
        //??????????????????
        Date reDate = new Date(System.currentTimeMillis());
        String ft = new SimpleDateFormat("yyyy-MM-dd").format(reDate);
        //??????????????????????????????
        List<Cinema> cinemaList = cinemaService.findCinemasByMovieId(movieId);

        for (Cinema cinema : cinemaList) {
            for (Hall hall : cinema.getHallList()) {
                for (Schedule schedule : hall.getScheduleList()) {
                    System.out.println("schedule = " + schedule);
                }
            }

        }

        mv.addObject("ft",ft);
        mv.addObject("movie", movie);
        mv.addObject("cinemaList",cinemaList);
        mv.setViewName("forward:/WEB-INF/views/jsp/movie-ticket.jsp");
        return mv;
    }


    @RequestMapping(value = "/chooseSeat")
    public ModelAndView chooseSeat(Integer movieId,Integer cinemaId){
        System.out.println("movie_id = " + movieId);
        System.out.println("cinemaId = " + cinemaId);
        Movie movie = movieService.findMovieByMovieId(movieId);
        Cinema cinema = cinemaService.findCinemas(cinemaId);
        List<Schedule> scheduleList  = scheduleService.findScheduleByCinemaIdAndMovieId(cinemaId,movieId);
        for (Schedule schedule : scheduleList) {
            System.out.println("---------------------------------------------------------");
            System.out.println("schedule = " + schedule);
            System.out.println("---------------------------------------------------------");
        }
        System.out.println("cinema = >>>>>>>>>>" + cinema);
        System.out.println("movie = >>>>>>>>>>" + movie);

        //??????????????????
        Date reDate = new Date(System.currentTimeMillis());
        String ft = new SimpleDateFormat("yyyy-MM-dd").format(reDate);
        ModelAndView mv = new ModelAndView();
        mv.addObject("cinema",cinema);
        mv.addObject("movie",movie);
        mv.addObject("ft",ft);
        mv.addObject("scheduleList",scheduleList);
        mv.setViewName("forward:/WEB-INF/views/jsp/movie-schedule.jsp");
        return mv;
    }


    /**
     * ????????????id???????????????????????????????????????
     * @param movieId
     * @return
     */
    @RequestMapping(value = "/findCinemasByMovieId")
    public Msg findCinemasByMovieId(Integer movieId){
        List<Cinema> cinemaList = cinemaService.findCinemasByMovieId(movieId);
        return Msg.success().add("cinemaList",cinemaList);
    }




}
