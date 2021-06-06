package com.lovemovie.service.impl;

import com.lovemovie.dao.CinemaMapper;
import com.lovemovie.dao.HallMapper;
import com.lovemovie.dao.ScheduleMapper;
import com.lovemovie.domain.Cinema;
import com.lovemovie.domain.Hall;
import com.lovemovie.service.ICinemaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author : Alishiz
 * @Date : 2021/6/5/0005 9:44
 * @email : 1575234570@qq.com
 * @Description :
 */
@Service
public class CinemaServiceImpl implements ICinemaService {

    @Autowired
    private CinemaMapper cinemaMapper;

    @Autowired
    private HallMapper hallMapper;

    @Autowired
    private ScheduleMapper scheduleMapper;


    @Override
    public List<Cinema> findCinemasByMovieId(Integer movieId) {
        List<Cinema> cinemaList = cinemaMapper.findCinemasByMovieId(new Long(movieId));
        for(Cinema cinema : cinemaList) {
            List<Hall> hallList = hallMapper.findHallByCinemaId(cinema.getCinemaId());
            for(Hall hall : hallList) {
                hall.setScheduleList(scheduleMapper.findScheduleByCinemaAndMovieAndHall(hall.getHallId(), hall.getCinemaId(), movieId));
            }
            cinema.setHallList(hallList);
        }
        return cinemaList;
    }

    @Override
    public List<Cinema> findAllCinemas() {

        List<Cinema> list = this.cinemaMapper.findAllCinemas();
        for(Cinema cinema : list) {
            List<Hall> hallList = this.hallMapper.findHallByCinemaId(cinema.getCinemaId());
            cinema.setHallList(hallList);
        }
        return list;
    }

    @Override
    public Cinema findCinemas(Integer cinemaId) {

        return cinemaMapper.selectByPrimaryKey(new Long(cinemaId));
    }
}
