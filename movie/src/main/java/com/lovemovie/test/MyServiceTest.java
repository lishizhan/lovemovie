package com.lovemovie.test;

import com.lovemovie.domain.*;
import com.lovemovie.model.FilmParam;
import com.lovemovie.service.IActorService;
import com.lovemovie.service.IMovieService;
import com.lovemovie.service.IScheduleService;
import com.lovemovie.service.impl.*;
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

    @Test
    public void findAllComment() {
        ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
        CommentServiceImpl commentService = ac.getBean(CommentServiceImpl.class);
        List<Comment> allComment = commentService.findAllComment("user");
        for (Comment comment : allComment) {
            System.out.println("CommentId = " + comment.getCommentId());
            System.out.println("UserName = " + comment.getUser().getUserName());
            System.out.println("CommentContent = " + comment.getCommentContent());
            System.out.println("CommentTime = " + comment.getCommentTime());
        }
    }
    @Test
    public void testFindAllSchedule() {
        ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
        ScheduleServiceImpl scheduleService = ac.getBean(ScheduleServiceImpl.class);
        List<Schedule> allSchedule = (List<Schedule>) scheduleService.findAllSchedule("");

        for (Schedule schedule : allSchedule) {
            System.out.println("schedule = " + schedule);
            System.out.println("场次编号 = " + schedule.getScheduleId());
            System.out.println("影院 = " + schedule.getScheduleHall().getHallCinema().getCinemaName());
            System.out.println("影院地址 = " + schedule.getScheduleHall().getHallCinema().getCinemaAddress());
            System.out.println("影厅 = " + schedule.getScheduleHall().getHallName());
            System.out.println("电影 = " + schedule.getScheduleMovie().getMovieCnName());
            System.out.println("放映时间 = " + schedule.getScheduleStarttime());
            System.out.println("价格 = " + schedule.getSchedulePrice());
            System.out.println("剩余票数 = " + schedule.getScheduleRemain());
            System.out.println("-------------------------------->>>>>");
        }
    }

    @Test
    public void testFindCinemasByMovieId() {
        ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
        CinemaServiceImpl cinemaService = ac.getBean(CinemaServiceImpl.class);
        List<Cinema> cinemaList = cinemaService.findCinemasByMovieId(49);

        for (Cinema cinema : cinemaList) {
            System.out.println("cinema = " + cinema);
        }
    }

    @Test
    public void testFindScheduleByCinemaIdAndMovieId() {
        ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
        IScheduleService scheduleService = ac.getBean(ScheduleServiceImpl.class);
        List<Schedule> scheduleList = scheduleService.findScheduleByCinemaIdAndMovieId(1, 49);
        for (Schedule schedule : scheduleList) {
            System.out.println("schedule.getScheduleHall() =>>>>>" + schedule.getScheduleHall());
            System.out.println("schedule.getScheduleMovie() =>>>>" + schedule.getScheduleMovie());
        }
    }

}
