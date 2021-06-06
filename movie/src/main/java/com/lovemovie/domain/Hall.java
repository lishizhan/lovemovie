package com.lovemovie.domain;

import java.util.List;

public class Hall {
    private String hallId;

    private String hallName;//放映厅名称

    private Integer hallCapacity;//放映厅容量

    private Long cinemaId;//所属影院编号

    private Cinema hallCinema; //所属影院

    private List<Schedule> scheduleList; //所有的电影场次集合

    public String getHallId() {
        return hallId;
    }

    public void setHallId(String hallId) {
        this.hallId = hallId;
    }

    public String getHallName() {
        return hallName;
    }

    public void setHallName(String hallName) {
        this.hallName = hallName == null ? null : hallName.trim();
    }

    public Integer getHallCapacity() {
        return hallCapacity;
    }

    public void setHallCapacity(Integer hallCapacity) {
        this.hallCapacity = hallCapacity;
    }

    public Long getCinemaId() {
        return cinemaId;
    }

    public void setCinemaId(Long cinemaId) {
        this.cinemaId = cinemaId;
    }

    public Cinema getHallCinema() {
        return hallCinema;
    }

    public void setHallCinema(Cinema hallCinema) {
        this.hallCinema = hallCinema;
    }

    public List<Schedule> getScheduleList() {
        return scheduleList;
    }

    public void setScheduleList(List<Schedule> scheduleList) {
        this.scheduleList = scheduleList;
    }

    @Override
    public String toString() {
        return "Hall{" +
                "hallId=" + hallId +
                ", hallName='" + hallName +
                ", hallCapacity=" + hallCapacity +
                ", cinemaId=" + cinemaId +
                ", hallCinema=" + hallCinema +
                ", scheduleList=" + scheduleList +
                '}';
    }
}