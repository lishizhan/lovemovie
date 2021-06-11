package com.lovemovie.service.impl;

import com.lovemovie.dao.ActorMapper;
import com.lovemovie.dao.MovieMapper;
import com.lovemovie.domain.Actor;
import com.lovemovie.domain.Movie;
import com.lovemovie.domain.MovieInfo;
import com.lovemovie.model.FilmParam;
import com.lovemovie.model.Msg;
import com.lovemovie.service.IMovieService;
import com.lovemovie.utils.AssertUtil;
import com.lovemovie.utils.DateUtils;
import com.lovemovie.utils.UUIDUtil;
import org.apache.commons.lang.text.StrBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.xml.transform.Source;
import java.text.ParseException;
import java.util.*;

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

        Movie movie = movieMapper.selectByPrimaryKey(new Long(movieId));
        String type = movie.getMovieType();
        movie.setMovieTypeStr(type);
        String[] movieType = movie.getMovieType().split(",");
        String[] movieTypeSrr = {"全部","爱情", "惊悚", "科幻", "动作", "悬疑", "犯罪", "冒险", "战争", "奇幻", "运动", "家庭", "古装", "武侠", "其他"};
        List<String> strings = Arrays.asList(movieTypeSrr);
        StrBuilder strBuilder = new StrBuilder();
        for (int i = 0; i < movieType.length; i++) {
            strBuilder.append(strings.indexOf(movieType[i])).append(",");
        }
        movie.setMovieType(strBuilder.toString());

        return movie;
    }

    @Override
    public List<Movie> findAllMovies(String movieName) {

        List<Movie> allMovies = movieMapper.findMoviesAllLikeMovieName(movieName);

        return allMovies;
    }

    @Override
    public Msg addMovie(MovieInfo movieInfo) throws ParseException {
        System.out.println("movieInfo =>> " + movieInfo);
        System.out.println("------------------------------------------------");
        //字段校验
        //。。。。
        //保存导演信息，查询时根据导演名字查询
        Actor director = new Actor();
        director.setActorId(UUIDUtil.getUUID());
        director.setActorHeadImg(movieInfo.getDirectorImg());
        director.setIsDelete("1");
        director.setActorName(movieInfo.getMovieDirector());
        int insert1 = actorMapper.insert(director);
        System.out.println("导演信息插入去情况 =>>>>" + insert1);
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

        AssertUtil.isTrue(movieName == null, "参数不能为空！！");
        Movie movie = movieMapper.checkMovieByName(movieName);
        System.out.println("movie和情况： " + movie);
        AssertUtil.isTrue(movie != null, "电影名称已经存在");
        return Msg.success();
    }

    @Override
    public Msg deleteMovieById(String movieId) {
        AssertUtil.isTrue(movieId == null, "电影id不能为空");
        int i = movieMapper.deleteByPrimaryKey(new Long(movieId));
        if (i > 0) {
            return Msg.success();
        } else {
            return Msg.fail();
        }
    }

    @Override
    public void deleteBatch(int[] ints) {
        movieMapper.deleteBatch(ints);
    }

    @Override
    public List<Movie> findMovies(FilmParam filmParam) {
        String[] sorts = {"按评分", "按上映时间"};
        String[] types = {"全部","爱情", "惊悚", "科幻", "动作", "悬疑", "犯罪", "冒险", "战争", "奇幻", "运动", "家庭", "古装", "武侠", "其他"};
        String[] source = {"全部","中国", "美国", "韩国", "日本", "中国香港", "中国台湾", "泰国", "印度", "法国", "英国", "俄罗斯", "意大利", "西班牙", "德国", "波兰", "澳大利亚", "伊朗", "其他",
        };
        String[] years = {"全部","2021", "2020", "2019", "2018", "2017", "2016", "2015", "2014", "2013", "2012", "2011", "2000-2010", "90年代", "80年代", "70年代", "更早"};

        FilmParam param = new FilmParam();
        if (filmParam.getTypeId().equals("0")){
            param.setTypeId(null);
        }else {
            param.setTypeId(types[Integer.parseInt(filmParam.getTypeId())]);
        }
        if (filmParam.getSourceId().equals("0")){
            param.setSourceId(null);
        }else {
            param.setSourceId(source[Integer.parseInt(filmParam.getSourceId())]);
        }
        if (filmParam.getYearId().equals("0")){
            param.setYearId(null);
        }else {
            param.setYearId(years[Integer.parseInt(filmParam.getYearId())]);
        }
        param.setSortId(sorts[Integer.parseInt(filmParam.getSortId())]);
        param.setPageNum(filmParam.getPageNum());
        System.out.println("param = " + param);
        List<Movie> moviesAll =null;
        switch (param.getSortId()){
            case "按评分":
                // typeId,sourceId,yearId
                moviesAll = movieMapper.findMoviesAllByScore(param.getTypeId(),param.getSourceId(),param.getYearId());
                System.out.println("moviesAll = " + moviesAll);
                break;
            case "按上映时间":
                moviesAll = movieMapper.findMoviesAllByYear(param.getTypeId(),param.getSourceId(),param.getYearId());
                System.out.println("moviesAll = " + moviesAll);
                break;
            default:
                break;
        }
        return moviesAll;
    }

    @Override
    public List<Movie> findMovieByNameLike(String searchName) {

        List<Movie> movieList = movieMapper.findMovieByNameLike(searchName);
        return movieList;
    }

    @Override
    public List<Movie> getMovieByScore(int num) {

        return movieMapper.getMovieByScore(num);
    }
}
