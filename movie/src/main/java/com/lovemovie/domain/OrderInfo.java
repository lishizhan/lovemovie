package com.lovemovie.domain;

import java.util.Date;

public class OrderInfo {
    private String orderId;

    private Long userId; //所属用户编号

    private Long scheduleId; //所属场次编号,通过schedule_id-》场次信息-》放映厅信息+电影信息

    private String orderPosition;//电影票座位信息

    private Integer orderState;//订单状态 0：退票中 -1：无法退票  1：已支付 2：退票成功

    private Integer orderPrice;//订单价格

    private Date orderTime;//订单支付时间

    private User orderUser;//所属用户对象

    private Schedule orderSchedule;//所属电影场次

    public User getOrderUser() {
        return orderUser;
    }

    public void setOrderUser(User orderUser) {
        this.orderUser = orderUser;
    }

    public Schedule getOrderSchedule() {
        return orderSchedule;
    }

    public void setOrderSchedule(Schedule orderSchedule) {
        this.orderSchedule = orderSchedule;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId == null ? null : orderId.trim();
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getScheduleId() {
        return scheduleId;
    }

    public void setScheduleId(Long scheduleId) {
        this.scheduleId = scheduleId;
    }

    public String getOrderPosition() {
        return orderPosition;
    }

    public void setOrderPosition(String orderPosition) {
        this.orderPosition = orderPosition == null ? null : orderPosition.trim();
    }

    public Integer getOrderState() {
        return orderState;
    }

    public void setOrderState(Integer orderState) {
        this.orderState = orderState;
    }

    public Integer getOrderPrice() {
        return orderPrice;
    }

    public void setOrderPrice(Integer orderPrice) {
        this.orderPrice = orderPrice;
    }

    public Date getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Date orderTime) {
        this.orderTime = orderTime;
    }

    @Override
    public String toString() {
        return "OrderInfo{" +
                "orderId='" + orderId + '\'' +
                ", userId=" + userId +
                ", scheduleId=" + scheduleId +
                ", orderPosition='" + orderPosition + '\'' +
                ", orderState=" + orderState +
                ", orderPrice=" + orderPrice +
                ", orderTime=" + orderTime +
                ", orderUser=" + orderUser +
                ", orderSchedule=" + orderSchedule +
                '}';
    }
}