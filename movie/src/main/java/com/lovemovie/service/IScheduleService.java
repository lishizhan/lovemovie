package com.lovemovie.service;

import com.github.pagehelper.PageInfo;
import com.lovemovie.domain.Schedule;
import com.lovemovie.model.Msg;

import java.util.List;

/**
 * @Author : Alishiz
 * @Date : 2021/6/5/0005 0:50
 * @email : 1575234570@qq.com
 * @Description :
 */
public interface IScheduleService {

    /**
     * 查询所有的场次信息
     * @return
     */
    List<Schedule> findAllSchedule(String movieName);

    Msg addScheduleService(String movieName, String hallName, String cinemaName, int schedulePrice, String scheduleStartTime);

    void deleteBatch(int[] ints);

    Msg deleteMovieById(String scheduleId);

    List<Schedule> findScheduleByCinemaIdAndMovieId(Integer cinemaId, Integer movieId);
}
