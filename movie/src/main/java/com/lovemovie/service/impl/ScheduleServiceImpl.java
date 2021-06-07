package com.lovemovie.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lovemovie.dao.*;
import com.lovemovie.domain.Hall;
import com.lovemovie.domain.OrderInfo;
import com.lovemovie.domain.Schedule;
import com.lovemovie.model.Msg;
import com.lovemovie.service.IOrderService;
import com.lovemovie.service.IScheduleService;
import com.lovemovie.utils.AssertUtil;
import com.lovemovie.utils.UUIDUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author : Alishiz
 * @Date : 2021/6/5/0005 0:50
 * @email : 1575234570@qq.com
 * @Description :
 */
@Service
public class ScheduleServiceImpl implements IScheduleService {


    @Autowired
    private ScheduleMapper scheduleMapper;

    @Autowired
    private HallMapper hallMapper;

    @Autowired
    private CinemaMapper cinemaMapper;

    @Autowired
    private MovieMapper movieMapper;


    @Autowired
    private OrderInfoMapper orderInfoMapper;


    @Override
    public List<Schedule> findAllSchedule(String movieName) {
        List<Schedule> allSchedule = scheduleMapper.findAllSchedule(movieName);
        return allSchedule;
    }

    @Override
    public Msg addScheduleService(String movieName, String hallName, String cinemaName, int schedulePrice, String scheduleStartTime) {
        //先保存放映厅
        String hallId = UUIDUtil.getUUID();
        Hall hall = new Hall();
        hall.setHallId(hallId);
        hall.setCinemaId(new Long(cinemaName));
        hall.setHallName(hallName);
        hall.setHallCapacity(84);
        int insert = hallMapper.insert(hall);

        //将场次信息保存到数据库
        Schedule schedule = new Schedule();
        schedule.setHallId(hallId);
        schedule.setMovieId(new Long(movieName));
        schedule.setScheduleStarttime(scheduleStartTime);
        schedule.setScheduleRemain(84);
        schedule.setScheduleState(1);
        schedule.setSchedulePrice(schedulePrice);
        int insert1 = scheduleMapper.insert(schedule);

        if (insert<0 || insert1<0){
            return Msg.fail();
        }
        return Msg.success();
    }

    @Override
    public void deleteBatch(int[] ints) {
        scheduleMapper.deleteBatch(ints);
    }

    @Override
    public Msg deleteMovieById(String scheduleId) {
        AssertUtil.isTrue(scheduleId == null, "用户id不能为空");
        int i = scheduleMapper.deleteByPrimaryKey(new Long(scheduleId));
        if (i > 0) {
            return Msg.success();
        } else {
            return Msg.fail();
        }
    }

    @Override
    public List<Schedule> findScheduleByCinemaIdAndMovieId(Integer cinemaId, Integer movieId) {

        List<Schedule> scheduleList= scheduleMapper.findScheduleByCinemaAndMovie(new Long(cinemaId),new Long(movieId));
        for(Schedule schedule: scheduleList) {
            Hall hall = hallMapper.findHallById(schedule.getHallId());
            schedule.setScheduleHall(hall);
            hall.setHallCinema(cinemaMapper.findCinemaById(hall.getCinemaId()));
            schedule.setScheduleMovie(movieMapper.findMovieById(schedule.getMovieId()));
        }
        return scheduleList;

    }

    @Override
    public Schedule findScheduleById(Integer scheduleId) {
        Schedule schedule = scheduleMapper.findScheduleById(new Long(scheduleId));
        Hall hall = this.hallMapper.findHallById(schedule.getHallId());
        hall.setHallCinema(this.cinemaMapper.findCinemaById(hall.getCinemaId()));
        schedule.setScheduleHall(hall);
        schedule.setScheduleMovie(this.movieMapper.findMovieById(schedule.getMovieId()));
        List<OrderInfo> list = orderInfoMapper.findOrdersByScheduleId(new Long(scheduleId));
        schedule.setOrderList(list);

        return schedule;
    }
}
