package com.lovemovie.test;

import com.lovemovie.domain.Actor;
import com.lovemovie.domain.Movie;
import com.lovemovie.service.IActorService;
import com.lovemovie.service.IMovieService;
import com.lovemovie.service.impl.ActorServiceImpl;
import com.lovemovie.service.impl.MovieServiceImpl;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * @Author : Alishiz
 * @Date : 2021/6/1/0001 19:57
 * @email : 1575234570@qq.com
 * @Description :
 */
public class MyServiceTest {
    @Test
    public void test01() {
        ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
        IMovieService movieService = ac.getBean(MovieServiceImpl.class);
        Movie movie = movieService.findMovieByMovieId(45);
        System.out.println("movie = " + movie);

    }
    @Test
    public void test02() {
        ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
        IActorService actorService = ac.getBean(ActorServiceImpl.class);
        Actor actor = actorService.getDirectorById("de66d0b165f944908ebd451cbe448bfe");
        System.out.println("actor = " + actor);


    }
}
