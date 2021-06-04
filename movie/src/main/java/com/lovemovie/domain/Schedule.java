package com.lovemovie.domain;

import org.springframework.core.annotation.Order;

import java.util.List;

public class Schedule {
    private Long scheduleId;

    private Long hallId;//所属放映厅

    private Long movieId; //放映的电影编号

    private String scheduleStarttime;//电影放映时间

    private Integer schedulePrice; //售价

    private Integer scheduleRemain;//剩余座位数

    private Integer scheduleState; //场次状态 1：上映中 0：下架

    private Hall schedule_hall; //所属放映厅对象
    private Movie schedule_movie; //放映的电影
    private List<Order> orderList; //所有的订单集合

    public Long getScheduleId() {
        return scheduleId;
    }

    public void setScheduleId(Long scheduleId) {
        this.scheduleId = scheduleId;
    }

    public Long getHallId() {
        return hallId;
    }

    public void setHallId(Long hallId) {
        this.hallId = hallId;
    }

    public Long getMovieId() {
        return movieId;
    }

    public void setMovieId(Long movieId) {
        this.movieId = movieId;
    }

    public String getScheduleStarttime() {
        return scheduleStarttime;
    }

    public void setScheduleStarttime(String scheduleStarttime) {
        this.scheduleStarttime = scheduleStarttime == null ? null : scheduleStarttime.trim();
    }

    public Integer getSchedulePrice() {
        return schedulePrice;
    }

    public void setSchedulePrice(Integer schedulePrice) {
        this.schedulePrice = schedulePrice;
    }

    public Integer getScheduleRemain() {
        return scheduleRemain;
    }

    public void setScheduleRemain(Integer scheduleRemain) {
        this.scheduleRemain = scheduleRemain;
    }

    public Integer getScheduleState() {
        return scheduleState;
    }

    public void setScheduleState(Integer scheduleState) {
        this.scheduleState = scheduleState;
    }
}