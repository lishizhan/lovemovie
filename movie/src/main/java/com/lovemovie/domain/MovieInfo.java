package com.lovemovie.domain;

/**
 * @Author : Alishiz
 * @Date : 2021/5/29/0029 17:08
 * @email : 1575234570@qq.com
 * @Description :
 */
public class MovieInfo {
    private String movieCnName;
    private String movieFgName;
    private String movieDirector;
    private String directorImg;
    private String movieDetail;
    private String movieDuration;
    private String movieType;
    private String movieReleasedate;
    private String movieCountry;
    private String moviePicture;
    private String movieState;
    private String movieActor;
    private String movieActorPortray;
    private String movieActorImgPath;

    @Override
    public String toString() {
        return "MovieInfo{" +
                "\nmovieCnName='" + movieCnName + '\'' +
                ", \nmovieFgName='" + movieFgName + '\'' +
                ", \nmovieDirector='" + movieDirector + '\'' +
                ", \ndirectorImg='" + directorImg + '\'' +
                ", \nmovieDetail='" + movieDetail + '\'' +
                ", \nmovieDuration='" + movieDuration + '\'' +
                ", \nmovieType='" + movieType + '\'' +
                ", \nmovieReleasedate='" + movieReleasedate + '\'' +
                ", \nmovieCountry='" + movieCountry + '\'' +
                ", \nmoviePicture='" + moviePicture + '\'' +
                ", \nmovieState='" + movieState + '\'' +
                ", \nmovieActor='" + movieActor + '\'' +
                ", \nmovieActorPortray='" + movieActorPortray + '\'' +
                ", \nmovieActorImgPath='" + movieActorImgPath + '\'' +
                '}';
    }

    public String getMovieCnName() {
        return movieCnName;
    }

    public void setMovieCnName(String movieCnName) {
        this.movieCnName = movieCnName;
    }

    public String getMovieFgName() {
        return movieFgName;
    }

    public void setMovieFgName(String movieFgName) {
        this.movieFgName = movieFgName;
    }

    public String getMovieDirector() {
        return movieDirector;
    }

    public void setMovieDirector(String movieDirector) {
        this.movieDirector = movieDirector;
    }

    public String getDirectorImg() {
        return directorImg;
    }

    public void setDirectorImg(String directorImg) {
        this.directorImg = directorImg;
    }

    public String getMovieDetail() {
        return movieDetail;
    }

    public void setMovieDetail(String movieDetail) {
        this.movieDetail = movieDetail;
    }

    public String getMovieDuration() {
        return movieDuration;
    }

    public void setMovieDuration(String movieDuration) {
        this.movieDuration = movieDuration;
    }

    public String getMovieType() {
        return movieType;
    }

    public void setMovieType(String movieType) {
        this.movieType = movieType;
    }

    public String getMovieReleasedate() {
        return movieReleasedate;
    }

    public void setMovieReleasedate(String movieReleasedate) {
        this.movieReleasedate = movieReleasedate;
    }

    public String getMovieCountry() {
        return movieCountry;
    }

    public void setMovieCountry(String movieCountry) {
        this.movieCountry = movieCountry;
    }

    public String getMoviePicture() {
        return moviePicture;
    }

    public void setMoviePicture(String moviePicture) {
        this.moviePicture = moviePicture;
    }

    public String getMovieState() {
        return movieState;
    }

    public void setMovieState(String movieState) {
        this.movieState = movieState;
    }

    public String getMovieActor() {
        return movieActor;
    }

    public void setMovieActor(String movieActor) {
        this.movieActor = movieActor;
    }

    public String getMovieActorPortray() {
        return movieActorPortray;
    }

    public void setMovieActorPortray(String movieActorPortray) {
        this.movieActorPortray = movieActorPortray;
    }

    public String getMovieActorImgPath() {
        return movieActorImgPath;
    }

    public void setMovieActorImgPath(String movieActorImgPath) {
        this.movieActorImgPath = movieActorImgPath;
    }
}
