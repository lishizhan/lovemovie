package com.lovemovie.dao;

import com.lovemovie.domain.Movie;
import com.lovemovie.model.FilmParam;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MovieMapper {
    int deleteByPrimaryKey(Long movieId);

    int insert(Movie record);

    int insertSelective(Movie record);

    Movie selectByPrimaryKey(Long movieId);

    int updateByPrimaryKeySelective(Movie record);

    int updateByPrimaryKey(Movie record);

    /**
     * 分页查询所有电影
     * @param movie_state
     * @return
     */
    List<Movie> findAllMovies(int movie_state);

    /**
     * 查询所有电影并按上映时间排序，上映状态
     * @param movieState
     * @return
     */
    List<Movie> findMovieByReleaseDateDesc(int movieState);


    /**
     * 查询所有的电影
     * @return
     */
    List<Movie> findMoviesAll();

    /**
     * 检查数据库中电影名称是否存在
     * @param movieName
     * @return
     */
    Movie checkMovieByName(String movieName);

    void deleteBatch(int[] ints);


    /**
     * 多条件查询按评分
     * @param typeId
     * @param sourceId
     * @param yearId
     * @return
     */
    List<Movie> findMoviesAllByScore(@Param("typeId") String typeId, @Param("sourceId") String sourceId, @Param("yearId") String yearId);

    /**
     * 多条件查询按上映日期
     * @param typeId
     * @param sourceId
     * @param yearId
     * @return
     */
    List<Movie> findMoviesAllByYear(@Param("typeId") String typeId, @Param("sourceId") String sourceId, @Param("yearId") String yearId);

    /**
     * 按电影名字模糊查询
     * @param searchName
     * @return
     */
    List<Movie> findMovieByNameLike(String searchName);
}