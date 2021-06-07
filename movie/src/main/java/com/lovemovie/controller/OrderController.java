package com.lovemovie.controller;

import com.lovemovie.domain.*;
import com.lovemovie.model.Msg;
import com.lovemovie.service.*;
import com.lovemovie.utils.DateUtils;
import com.sun.org.apache.xpath.internal.operations.Or;
import org.apache.taglibs.standard.lang.jstl.test.beans.PublicInterface2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import sun.rmi.runtime.Log;

import javax.servlet.http.HttpServletRequest;
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
     *
     * @param movieId
     * @return
     */
    @RequestMapping(value = "/buyTicketDetails")
    public ModelAndView buyTicketDetails(Integer movieId) {
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
        mv.addObject("cinemaList", cinemaList);
        mv.setViewName("forward:/WEB-INF/views/jsp/movie-ticket.jsp");
        return mv;
    }


    @RequestMapping(value = "/buyTicketOrder")
    public ModelAndView buyTicketOrder(Integer scheduleId, HttpServletRequest request) {
        System.out.println("scheduleId =>>>>>>" + scheduleId);

        Schedule schedule = scheduleService.findScheduleById(scheduleId);
        System.out.println("schedule = " + schedule);

        User user = (User) request.getSession().getAttribute("user");


        ModelAndView mv = new ModelAndView();
        mv.addObject("schedule", schedule);
        mv.addObject("user", user);
        mv.setViewName("forward:/WEB-INF/views/jsp/movie-buy-ticket.jsp");
        return mv;
    }

    /**
     * 点击确认购票
     *
     * @return
     */
    @RequestMapping(value = "/buyTickets")
    @ResponseBody
    public Msg createOrder(String scheduleId, String seat, String orderPrice, HttpServletRequest request) {
        System.out.println("购票！！！！");
        System.out.println("scheduleId = " + scheduleId);
        System.out.println("seat = " + seat);
        System.out.println("orderPrice = " + orderPrice);

        User user = (User) request.getSession().getAttribute("user");

        //遍历座位信息，循环保存
        String[] seatArr = seat.split("-");
        for (int i = 0; i < seatArr.length; i++) {
            //生成订单编号
            int r1 = (int) (Math.random() * (10));//产生2个0-9的随机数
            int r2 = (int) (Math.random() * (10));
            long now = System.currentTimeMillis();//一个13位的时间戳
            String paymentID = String.valueOf(r1) + String.valueOf(r2) + String.valueOf(now);// 订单ID
            OrderInfo orderInfo = new OrderInfo();
            orderInfo.setOrderId(paymentID);
            orderInfo.setUserId(user.getUserId());
            orderInfo.setScheduleId(new Long(scheduleId));
            orderInfo.setOrderPosition(seatArr[i]);
            orderInfo.setOrderState(1);
            orderInfo.setOrderTime(new Date());
            orderInfo.setOrderPrice(Integer.parseInt(orderPrice));
            System.out.println("orderInfo = " + orderInfo);
            orderService.addOrder(orderInfo);
        }
        return Msg.success();
    }

    @RequestMapping(value = "/findAllOrderInfo")
    @ResponseBody
    public Msg findAllOrderInfo(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        String userName = user.getUserName();
        //根据用户id查询订单信息
        List<OrderInfo> orderInfoList = orderService.findAllOrderInfo(userName);

        return Msg.success().add("orderInfoList", orderInfoList);
    }


}
