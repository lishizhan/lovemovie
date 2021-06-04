package com.lovemovie.dao;

import com.lovemovie.domain.Schedule;

public interface ScheduleMapper {
    int deleteByPrimaryKey(Long scheduleId);

    int insert(Schedule record);

    int insertSelective(Schedule record);

    Schedule selectByPrimaryKey(Long scheduleId);

    int updateByPrimaryKeySelective(Schedule record);

    int updateByPrimaryKey(Schedule record);
}