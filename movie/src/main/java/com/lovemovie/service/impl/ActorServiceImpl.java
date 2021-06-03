package com.lovemovie.service.impl;

import com.lovemovie.dao.ActorMapper;
import com.lovemovie.domain.Actor;
import com.lovemovie.service.IActorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    @Override
    public Map<String, Object> getActorById(String movieDirector, String movieActor) {
        Actor director = actorMapper.queryActorByName(movieDirector);

        System.out.println("Director = " + director);
        Map<String, Object> map = new HashMap<>();
        map.put("director", director);
        Actor actors = actorMapper.queryActorById(movieActor);
        System.out.println("actors = " + actors);
        String[] actorName = actors.getActorName().split(",");
        String[] imgs = actors.getActorHeadImg().split(",");
        String[] portray = actors.getPortray().split(",");

        List<Actor> actorList = new ArrayList<>();
        for (int i = 0; i < actorName.length; i++) {
            Actor actor = new Actor();
            actor.setActorName(actorName[i]);
            actor.setPortray(portray[i]);
            actor.setActorHeadImg(imgs[i]);
            actorList.add(actor);

        }
        map.put("actorList",actorList);
        return map;
    }
}
