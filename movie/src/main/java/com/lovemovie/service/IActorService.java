package com.lovemovie.service;

import com.lovemovie.domain.Actor;

/**
 * @Author : Alishiz
 * @Date : 2021/6/1/0001 17:04
 * @email : 1575234570@qq.com
 * @Description :
 */
public interface IActorService {
    /**
     * 根据导演信息获取导演信息
     * @param movieDirector
     * @return
     */
    Actor getDirectorByName(String movieDirector);

    /**
     * 根据所有演员的Id获取演员信息
     * @param movieActor
     * @return
     */
    Actor getDirectorById(String movieActor);
}
