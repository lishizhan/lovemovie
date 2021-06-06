package com.lovemovie.domain;

import org.springframework.core.annotation.Order;

import java.util.List;

public class Schedule {
    private Long scheduleId;

    private String hallId;//所属放映厅

    private Long movieId; //放映的电影编号

    private String scheduleStarttime;//电影放映时间

    private Integer schedulePrice; //售价

    private Integer scheduleRemain;//剩余座位数

    private Integer scheduleState; //场次状态 1：上映中 0：下架

    private Hall scheduleHall; //所属放映厅对象

    private Movie scheduleMovie; //放映的电影

    private List<OrderInfo> orderList; //所有的订单集合


    public Long getScheduleId() {
        return scheduleId;
    }

    public void setScheduleId(Long scheduleId) {
        this.scheduleId = scheduleId;
    }

    public String getHallId() {
        return hallId;
    }

    public void setHallId(String hallId) {
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

    public Hall getScheduleHall() {
        return scheduleHall;
    }

    @Override
    public String toString() {
        return "Schedule{" +
                "scheduleId=" + scheduleId +
                ", hallId=" + hallId +
                ", movieId=" + movieId +
                ", scheduleStarttime='" + scheduleStarttime + '\'' +
                ", schedulePrice=" + schedulePrice +
                ", scheduleRemain=" + scheduleRemain +
                ", scheduleState=" + scheduleState +
                ", \n\tscheduleHall=" + scheduleHall +
                ", \n\tscheduleMovie=" + scheduleMovie +
                ", \n\torderList=" + orderList +
                '}';
    }

    public void setScheduleHall(Hall scheduleHall) {
        this.scheduleHall = scheduleHall;
    }

    public Movie getScheduleMovie() {
        return scheduleMovie;
    }

    public void setScheduleMovie(Movie scheduleMovie) {
        this.scheduleMovie = scheduleMovie;
    }

    public List<OrderInfo> getOrderList() {
        return orderList;
    }

    public void setOrderList(List<OrderInfo> orderList) {
        this.orderList = orderList;
    }
}