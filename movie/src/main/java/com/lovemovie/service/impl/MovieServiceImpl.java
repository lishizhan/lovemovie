package com.lovemovie.service.impl;

import com.lovemovie.dao.MovieMapper;
import com.lovemovie.domain.Movie;
import com.lovemovie.domain.MovieInfo;
import com.lovemovie.model.Msg;
import com.lovemovie.service.IMovieService;
import com.lovemovie.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.util.Arrays;
import java.util.List;

/**
 * @Author : Alishiz
 * @Date : 2021/5/3/0003 11:04
 * @email : 1575234570@qq.com
 * @Description :
 */
@Service
public class MovieServiceImpl implements IMovieService {
    @Autowired
    private MovieMapper movieMapper;
    @Override
    public List<Movie> findAllMovies(int movie_state) {

        return movieMapper.findAllMovies(movie_state);
    }

    @Override
    public Movie findMovieByMovieId(Integer movieId) {
        return movieMapper.selectByPrimaryKey(new Long(movieId));
    }

    @Override
    public List<Movie> findAllMovies() {

        List<Movie> allMovies = movieMapper.findMoviesAll();

        return allMovies;
    }

    @Override
    public Msg addMovie(MovieInfo movieInfo) throws ParseException {
        System.out.println("movieInfo =>> " + movieInfo);
        System.out.println("------------------------------------------------");
        //字段校验
        //。。。。


        //保存电影信息
        Movie movie = new Movie();
        movie.setMovieCnName(movieInfo.getMovieCnName());
        movie.setMovieFgName(movieInfo.getMovieFgName());
        movie.setMovieDirector(movieInfo.getMovieDirector());
        movie.setMovieDetail(movieInfo.getMovieDetail());
        movie.setMovieDuration(movieInfo.getMovieDuration());
        //电影类型处理
        String[] movieTypeSrr = {"爱情", "惊悚", "科幻", "动作", "悬疑", "犯罪", "冒险", "战争", "奇幻", "运动", "家庭", "古装", "武侠", "其他"};
        String[] type = movieInfo.getMovieType().split(",");
        System.out.println("type = " + Arrays.toString(type));
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < type.length; i++) {
            sb.append(movieTypeSrr[Integer.parseInt(type[i])]).append(",");
        }
        System.out.println("sb = " + sb);

        movie.setMovieType(sb.toString());
        movie.setMovieReleasedate(DateUtils.stringToDate(movieInfo.getMovieReleasedate(),"yyyy-MM-dd"));
        movie.setMovieCountry(movieInfo.getMovieCountry());
        movie.setMoviePicture(movieInfo.getMoviePicture());
        movie.setMovieState(Integer.parseInt(movieInfo.getMovieState()));
        movie.setMovieActor(movieInfo.getMovieActor());

        System.out.println("movie = " + movie);
        //调用dao保存电影信息


        //保存演员信息


        return Msg.success();
    }
}
