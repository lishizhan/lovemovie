package com.lovemovie.domain;

import java.util.Date;

public class Movie {
    private Long movieId;//电影编号

    private String movieCnName;// 电影名称（中文）

    private String movieFgName;//电影名称（外语）

    private String movieActor;//电影演职人员

    private String movieDirector;//电影导演

    private String movieDetail;//电影详情

    private String movieDuration;//电影时长

    private String movieType;//电影类型

    private Float movieScore;//电影评分默认为0

    private Float movieBoxoffice;//电影票房 默认为0

    private Long movieCommentcount;//电影参评人数 默认为0

    private Date movieReleasedate;//电影上映时间

    private String movieCountry;//电影制片地区

    private String moviePicture;//电影海报

    private Integer movieState;//电影状态 默认为1  1：在线 0：下架

    public Long getMovieId() {
        return movieId;
    }

    public void setMovieId(Long movieId) {
        this.movieId = movieId;
    }

    public String getMovieCnName() {
        return movieCnName;
    }

    public void setMovieCnName(String movieCnName) {
        this.movieCnName = movieCnName == null ? null : movieCnName.trim();
    }

    public String getMovieFgName() {
        return movieFgName;
    }

    public void setMovieFgName(String movieFgName) {
        this.movieFgName = movieFgName == null ? null : movieFgName.trim();
    }

    public String getMovieActor() {
        return movieActor;
    }

    public void setMovieActor(String movieActor) {
        this.movieActor = movieActor == null ? null : movieActor.trim();
    }

    public String getMovieDirector() {
        return movieDirector;
    }

    public void setMovieDirector(String movieDirector) {
        this.movieDirector = movieDirector == null ? null : movieDirector.trim();
    }

    public String getMovieDetail() {
        return movieDetail;
    }

    public void setMovieDetail(String movieDetail) {
        this.movieDetail = movieDetail == null ? null : movieDetail.trim();
    }

    public String getMovieDuration() {
        return movieDuration;
    }

    public void setMovieDuration(String movieDuration) {
        this.movieDuration = movieDuration == null ? null : movieDuration.trim();
    }

    public String getMovieType() {
        return movieType;
    }

    public void setMovieType(String movieType) {
        this.movieType = movieType == null ? null : movieType.trim();
    }

    public Float getMovieScore() {
        return movieScore;
    }

    public void setMovieScore(Float movieScore) {
        this.movieScore = movieScore;
    }

    public Float getMovieBoxoffice() {
        return movieBoxoffice;
    }

    public void setMovieBoxoffice(Float movieBoxoffice) {
        this.movieBoxoffice = movieBoxoffice;
    }

    public Long getMovieCommentcount() {
        return movieCommentcount;
    }

    public void setMovieCommentcount(Long movieCommentcount) {
        this.movieCommentcount = movieCommentcount;
    }

    public Date getMovieReleasedate() {
        return movieReleasedate;
    }

    public void setMovieReleasedate(Date movieReleasedate) {
        this.movieReleasedate = movieReleasedate;
    }

    public String getMovieCountry() {
        return movieCountry;
    }

    public void setMovieCountry(String movieCountry) {
        this.movieCountry = movieCountry == null ? null : movieCountry.trim();
    }

    public String getMoviePicture() {
        return moviePicture;
    }

    public void setMoviePicture(String moviePicture) {
        this.moviePicture = moviePicture == null ? null : moviePicture.trim();
    }

    public Integer getMovieState() {
        return movieState;
    }

    public void setMovieState(Integer movieState) {
        this.movieState = movieState;
    }
}