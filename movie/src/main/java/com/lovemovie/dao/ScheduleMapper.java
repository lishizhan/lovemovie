package com.lovemovie.dao;

import com.lovemovie.domain.Schedule;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ScheduleMapper {
    int deleteByPrimaryKey(Long scheduleId);

    int insert(Schedule record);

    int insertSelective(Schedule record);

    Schedule selectByPrimaryKey(Long scheduleId);

    int updateByPrimaryKeySelective(Schedule record);

    int updateByPrimaryKey(Schedule record);

    List<Schedule> findScheduleByCinemaAndMovieAndHall(@Param("hallId") String hallId, @Param("cinemaId") Long cinemaId, @Param("movieId") Integer movieId);

    List<Schedule> findAllSchedule(String movieName);

    void deleteBatch(int[] ints);

    List<Schedule> findScheduleByCinemaAndMovie(@Param("cinemaId") Long cinemaId,@Param("movieId") Long movieId);

    Schedule findScheduleById(Long scheduleId);
}