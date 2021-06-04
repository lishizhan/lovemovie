package com.lovemovie.domain;

import com.lovemovie.utils.DateUtils;
import org.springframework.format.annotation.DateTimeFormat;

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
    private String movieTypeStr;//电影类型

    private Float movieScore;//电影评分默认为0

    private Float movieBoxoffice;//电影票房 默认为0

    private Long movieCommentcount;//电影参评人数 默认为0

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date movieReleasedate;//电影上映时间

    private String movieReleasedateStr;//电影上映时间

    private String movieCountry;//电影制片地区

    private String moviePicture;//电影海报

    private Integer movieState;//电影状态 默认为1  1：在线 0：下架

    private Integer isDelete=1;//删除状态 默认为1 表示数据存在，0：表示数据删除

    public String getMovieTypeStr() {
        return movieTypeStr;
    }

    public void setMovieTypeStr(String movieTypeStr) {
        this.movieTypeStr = movieTypeStr;
    }

    public String getMovieReleasedateStr() {

        return DateUtils.dateToString(movieReleasedate, "yyyy-MM-dd");

    }

    public void setMovieReleasedateStr(String movieReleasedateStr) {


        this.movieReleasedateStr = DateUtils.dateToString(movieReleasedate, "yyyy-MM-dd");;
    }

    public Movie() {
    }

    public Movie(Long movieId, String movieCnName, String movieFgName, String movieActor, String movieDirector, String movieDetail, String movieDuration, String movieType, Float movieScore, Float movieBoxoffice, Long movieCommentcount, Date movieReleasedate, String movieReleasedateStr, String movieCountry, String moviePicture, Integer movieState, Integer isDelete) {
        this.movieId = movieId;
        this.movieCnName = movieCnName;
        this.movieFgName = movieFgName;
        this.movieActor = movieActor;
        this.movieDirector = movieDirector;
        this.movieDetail = movieDetail;
        this.movieDuration = movieDuration;
        this.movieType = movieType;
        this.movieScore = movieScore;
        this.movieBoxoffice = movieBoxoffice;
        this.movieCommentcount = movieCommentcount;
        this.movieReleasedate = movieReleasedate;
        this.movieReleasedateStr = movieReleasedateStr;
        this.movieCountry = movieCountry;
        this.moviePicture = moviePicture;
        this.movieState = movieState;
        this.isDelete = isDelete;
    }

    public Integer getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Integer isDelete) {
        this.isDelete = isDelete;
    }

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

    @Override
    public String toString() {
        return "Movie{" +
                "movieId=" + movieId +
                ", movieCnName='" + movieCnName + '\'' +
                ", movieFgName='" + movieFgName + '\'' +
                ", movieActor='" + movieActor + '\'' +
                ", movieDirector='" + movieDirector + '\'' +
                ", movieDetail='" + movieDetail + '\'' +
                ", movieDuration='" + movieDuration + '\'' +
                ", movieType='" + movieType + '\'' +
                ", movieScore=" + movieScore +
                ", movieBoxoffice=" + movieBoxoffice +
                ", movieCommentcount=" + movieCommentcount +
                ", movieReleasedate=" + movieReleasedate +
                ", movieReleasedateStr='" + movieReleasedateStr + '\'' +
                ", movieCountry='" + movieCountry + '\'' +
                ", moviePicture='" + moviePicture + '\'' +
                ", movieState=" + movieState +
                ", isDelete=" + isDelete +
                '}';
    }
}