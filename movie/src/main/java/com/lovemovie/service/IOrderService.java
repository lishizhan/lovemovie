package com.lovemovie.service;

import com.lovemovie.domain.OrderInfo;

import java.util.List;

/**
 * @Author : Alishiz
 * @Date : 2021/6/5/0005 0:49
 * @email : 1575234570@qq.com
 * @Description :
 */
public interface IOrderService {
    void addOrder(OrderInfo orderInfo);

    List<OrderInfo> findAllOrderInfo(String userName);
}
