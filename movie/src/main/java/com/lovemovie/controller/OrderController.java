package com.lovemovie.controller;

import com.lovemovie.domain.Movie;
import com.lovemovie.model.Msg;
import com.lovemovie.service.IHallService;
import com.lovemovie.service.IMovieService;
import com.lovemovie.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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

    /**
     * 跳转购票页面
     * @param movieId
     * @return
     */
    @RequestMapping(value = "/buyTicketDetails")
    public ModelAndView buyTicketDetails(Integer movieId){
        Movie movie = movieService.findMovieByMovieId(movieId);
        ModelAndView mv = new ModelAndView();
        mv.addObject("movie", movie);
        mv.setViewName("forward:/WEB-INF/views/jsp/movie-ticket.jsp");
        return mv;
    }


    @RequestMapping(value = "/chooseSeat")
    public ModelAndView chooseSeat(){
        ModelAndView mv = new ModelAndView();
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
