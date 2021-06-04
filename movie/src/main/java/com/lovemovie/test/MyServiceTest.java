package com.lovemovie.test;

import com.lovemovie.domain.Actor;
import com.lovemovie.domain.Movie;
import com.lovemovie.domain.MovieInfo;
import com.lovemovie.model.FilmParam;
import com.lovemovie.service.IActorService;
import com.lovemovie.service.IMovieService;
import com.lovemovie.service.impl.ActorServiceImpl;
import com.lovemovie.service.impl.MovieServiceImpl;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;
import java.util.Map;
import java.util.Set;

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

    @Test
    public void test03() {
        ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
        IActorService actorService = ac.getBean(ActorServiceImpl.class);
        Map<String, Object> actorMap = actorService.getActorById("邱礼涛", "ea08de10c5da4839a95aa2c94060f237");
        Set<Map.Entry<String, Object>> entries = actorMap.entrySet();
        for (Map.Entry<String, Object> entry : entries) {
            String key = entry.getKey();
            Object value = entry.getValue();
            System.out.println(key + " = " + value);
        }


    }

    @Test
    public void testFindMovies() {
        ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
        IMovieService movieService = ac.getBean(MovieServiceImpl.class);
        List<Movie> movies = movieService.findMovies(new FilmParam("0","0","0","0","1"));
        if (movies!=null){
            for (Movie movie : movies) {
                // System.out.println("year = " + movie.getMovieReleasedateStr());
                System.out.println("score ="+movie.getMovieScore());
            }
        }



    }

}
