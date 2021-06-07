package com.lovemovie.service.impl;

import com.lovemovie.dao.*;
import com.lovemovie.domain.Hall;
import com.lovemovie.domain.OrderInfo;
import com.lovemovie.domain.Schedule;
import com.lovemovie.service.IOrderService;
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
                // hall.getHallCinema(cinemaMapper.findCinemaById(new Long(Integer.parseInt(hall.getCinemaId()))));
                // schedule.setSchedule_hall(hall);
                // schedule.setSchedule_movie(this.movieMapper.findMovieById(schedule.getMovie_id()));
                // order.setOrder_schedule(schedule);
            }
        }else {
            list = null;
        }
        return list;
    }
}
