package com.lovemovie.dao;

import com.lovemovie.domain.Actor;

public interface ActorMapper {
    int deleteByPrimaryKey(String actorId);

    int insert(Actor record);

    int insertSelective(Actor record);

    Actor selectByPrimaryKey(String actorId);

    int updateByPrimaryKeySelective(Actor record);

    int updateByPrimaryKey(Actor record);

    Actor queryActorByName(String movieDirector);

    Actor queryActorById(String movieActor);
}