package com.lovemovie.service.impl;

import com.lovemovie.dao.ActorMapper;
import com.lovemovie.dao.MovieMapper;
import com.lovemovie.domain.Actor;
import com.lovemovie.domain.Movie;
import com.lovemovie.domain.MovieInfo;
import com.lovemovie.model.Msg;
import com.lovemovie.service.IMovieService;
import com.lovemovie.utils.AssertUtil;
import com.lovemovie.utils.DateUtils;
import com.lovemovie.utils.UUIDUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

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

    @Autowired
    private ActorMapper actorMapper;

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
        //保存演员信息
        Actor actor = new Actor();
        actor.setActorId(UUIDUtil.getUUID());
        actor.setActorName(movieInfo.getMovieActor());
        actor.setPortray(movieInfo.getMovieActorPortray());
        actor.setActorHeadImg(movieInfo.getMovieActorImgPath());
        System.out.println("actor = " + actor);
        //调用dao保存演员信息
        int insert = actorMapper.insert(actor);
        System.out.println("演员信息插入情况 =>>>>>>> " + insert);
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
        movie.setMovieType(sb.toString());
        movie.setMovieReleasedate(DateUtils.stringToDate(movieInfo.getMovieReleasedate(), "yyyy-MM-dd"));
        movie.setMovieCountry(movieInfo.getMovieCountry());
        movie.setMoviePicture(movieInfo.getMoviePicture());
        movie.setMovieState(Integer.parseInt(movieInfo.getMovieState()));
        movie.setMovieActor(actor.getActorId());
        movie.setMovieScore(0.0F);
        movie.setMovieBoxoffice(0.0f);
        movie.setMovieCommentcount(0L);
        movie.setIsDelete(1);
        System.out.println("movie =>>>>>>>" + movie);
        //调用dao保存电影信息
        int i = movieMapper.insert(movie);
        System.out.println("电影插入情况 =>>>>>>> " + i);
        return Msg.success();
    }

    @Override
    public Msg findMovieNameIsExist(String movieName) {

        AssertUtil.isTrue(movieName==null, "参数不能为空！！");
        Movie movie=movieMapper.checkMovieByName(movieName);
        System.out.println("movie和情况： " + movie);
        AssertUtil.isTrue(movie!=null, "电影名称已经存在");
        return Msg.success();
    }
}
