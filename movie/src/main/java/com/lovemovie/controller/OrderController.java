package com.lovemovie.controller;

import com.lovemovie.domain.Cinema;
import com.lovemovie.domain.Hall;
import com.lovemovie.domain.Movie;
import com.lovemovie.domain.Schedule;
import com.lovemovie.model.Msg;
import com.lovemovie.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @Author : Alishiz
 * @Date : 2021/6/4/0004 23:48
 * @email : 1575234570@qq.com
 * @Description :
 */
@Controller
@RequestMapping(value = "/order")
public class OrderController {
    @Autowired
    private IMovieService movieService;

    @Autowired
    private IOrderService orderService;

    @Autowired
    private IHallService hallService;

    @Autowired
    private IScheduleService scheduleService;

    @Autowired
    private ICinemaService cinemaService;

    /**
     * 跳转购票页面
     * @param movieId
     * @return
     */
    @RequestMapping(value = "/buyTicketDetails")
    public ModelAndView buyTicketDetails(Integer movieId){
        Movie movie = movieService.findMovieByMovieId(movieId);
        ModelAndView mv = new ModelAndView();

        //查询该影片的排片信息
        List<Cinema> cinemaList = cinemaService.findCinemasByMovieId(movieId);

        for (Cinema cinema : cinemaList) {
            for (Hall hall : cinema.getHallList()) {
                for (Schedule schedule : hall.getScheduleList()) {
                    System.out.println("schedule = " + schedule);
                }
            }

        }

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

        //获取系统时间
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

    @RequestMapping(value = "/buyTicketOrder")
    public ModelAndView buyTicketOrder(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("forward:/WEB-INF/views/jsp/movie-buy-ticket.jsp");
        return mv;
    }


}
