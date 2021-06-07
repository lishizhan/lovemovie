package com.lovemovie.dao;

import com.lovemovie.domain.OrderInfo;
import org.springframework.core.annotation.Order;

import java.util.List;

public interface OrderInfoMapper {
    int deleteByPrimaryKey(String orderId);

    int insert(OrderInfo record);

    int insertSelective(OrderInfo record);

    OrderInfo selectByPrimaryKey(String orderId);

    int updateByPrimaryKeySelective(OrderInfo record);

    int updateByPrimaryKey(OrderInfo record);

    List<OrderInfo> findOrdersByScheduleId(Long scheduleId);

    List<OrderInfo> findRefundOrderByUserName(String userName);
}