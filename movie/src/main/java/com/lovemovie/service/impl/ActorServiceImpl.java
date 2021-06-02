package com.lovemovie.service.impl;

import com.lovemovie.dao.ActorMapper;
import com.lovemovie.domain.Actor;
import com.lovemovie.service.IActorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Author : Alishiz
 * @Date : 2021/6/1/0001 17:05
 * @email : 1575234570@qq.com
 * @Description :
 */
@Service
public class ActorServiceImpl implements IActorService {

    @Autowired
    private ActorMapper actorMapper;

    @Override
    public Actor getDirectorByName(String movieDirector) {
        Actor actor =  actorMapper.queryActorByName(movieDirector);
        return actor;
    }

    @Override
    public Actor getDirectorById(String movieActor) {
        Actor actor =actorMapper.queryActorById(movieActor);
        return actor;
    }
}
