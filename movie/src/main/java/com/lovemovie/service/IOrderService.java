package com.lovemovie.service;

import com.lovemovie.domain.OrderInfo;
import com.lovemovie.model.Msg;

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

    List<OrderInfo> getAllOrderInfoForManage(String userName);

    List<OrderInfo> findAllOrder(String userName);

    void deleteBatch(int[] ints);

    Msg deleteMovieById(String orderId);
}
