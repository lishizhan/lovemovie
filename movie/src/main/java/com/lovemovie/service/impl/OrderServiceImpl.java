package com.lovemovie.service.impl;

import com.lovemovie.dao.*;
import com.lovemovie.domain.Hall;
import com.lovemovie.domain.Movie;
import com.lovemovie.domain.OrderInfo;
import com.lovemovie.domain.Schedule;
import com.lovemovie.model.Msg;
import com.lovemovie.service.IOrderService;
import com.lovemovie.utils.AssertUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author : Alishiz
 * @Date : 2021/6/5/0005 0:49
 * @email : 1575234570@qq.com
 * @Description :
 */
@Service
public class OrderServiceImpl implements IOrderService {
    @Autowired
    private OrderInfoMapper orderInfoMapper;
    @Autowired
    private UserMapper userMapper;

    @Autowired
    private ScheduleMapper scheduleMapper;

    @Autowired
    private HallMapper hallMapper;

    @Autowired
    private CinemaMapper cinemaMapper;

    @Autowired
    private MovieMapper movieMapper;

    @Override
    public void addOrder(OrderInfo orderInfo) {
        int insert = orderInfoMapper.insert(orderInfo);
    }

    @Override
    public List<OrderInfo> findAllOrderInfo(String userName) {

        List<OrderInfo> list = orderInfoMapper.findRefundOrderByUserName(userName);
        if(list.size() > 0) {
            for(OrderInfo orderInfo : list) {
                orderInfo.setOrderUser(userMapper.findUserById(orderInfo.getUserId()));
                Schedule schedule = scheduleMapper.findScheduleById(orderInfo.getScheduleId());
                Hall hall = hallMapper.findHallById(schedule.getHallId());
                hall.setHallCinema(cinemaMapper.findCinemaById(new Long(hall.getCinemaId())));
                schedule.setScheduleHall(hall);
                schedule.setScheduleMovie(movieMapper.findMovieById(schedule.getMovieId()));
                orderInfo.setOrderSchedule(schedule);
            }
        }else {
            list = null;
        }
        return list;
    }

    @Override
    public List<OrderInfo> getAllOrderInfoForManage(String userName) {
        List<OrderInfo> list = orderInfoMapper.findAllOrdersSearchUserName(userName);
        for(OrderInfo order : list) {
            order.setOrderUser(userMapper.findUserById(order.getUserId()));
            Schedule schedule = scheduleMapper.findScheduleById(order.getScheduleId());
            Hall hall = this.hallMapper.findHallById(schedule.getHallId());
            hall.setHallCinema(this.cinemaMapper.findCinemaById(hall.getCinemaId()));
            schedule.setScheduleHall(hall);
            schedule.setScheduleMovie(this.movieMapper.findMovieById(schedule.getMovieId()));
            order.setOrderSchedule(schedule);
        }
        return list;

    }

    @Override
    public List<OrderInfo> findAllOrder(String userName) {
        List<OrderInfo> allOrders = orderInfoMapper.getAllOrders(userName);
        for (OrderInfo allOrder : allOrders) {
            Schedule schedule = scheduleMapper.findScheduleById(allOrder.getScheduleId());
            Hall hall = hallMapper.findHallById(schedule.getHallId());
            schedule.setScheduleHall(hall);
            Movie movie = movieMapper.findMovieById(schedule.getMovieId());
            schedule.setScheduleMovie(movie);
            allOrder.setOrderSchedule(schedule);
        }

        return allOrders;
    }

    @Override
    public void deleteBatch(int[] ints) {
        orderInfoMapper.deleteBatch(ints);
    }

    @Override
    public Msg deleteMovieById(String orderId) {
        int i = orderInfoMapper.deleteByPrimaryKey(orderId);
        if (i > 0) {
            return Msg.success();
        } else {
            return Msg.fail();
        }
    }
}
