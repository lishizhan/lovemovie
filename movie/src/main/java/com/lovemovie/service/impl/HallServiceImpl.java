package com.lovemovie.service.impl;

import com.lovemovie.dao.HallMapper;
import com.lovemovie.domain.Hall;
import com.lovemovie.service.IHallService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Author : Alishiz
 * @Date : 2021/6/5/0005 0:51
 * @email : 1575234570@qq.com
 * @Description :
 */
@Service
public class HallServiceImpl implements IHallService {
    @Autowired
    private HallMapper hallMapper;


}
