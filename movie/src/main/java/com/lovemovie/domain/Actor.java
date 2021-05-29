package com.lovemovie.domain;

public class Actor {
    private Integer actorId;

    private String actorHeadImg;

    private String isDelete;

    private String actorName;

    private String portray;

    private Integer movieId;

    public Integer getActorId() {
        return actorId;
    }

    public void setActorId(Integer actorId) {
        this.actorId = actorId;
    }

    public String getActorHeadImg() {
        return actorHeadImg;
    }

    public void setActorHeadImg(String actorHeadImg) {
        this.actorHeadImg = actorHeadImg == null ? null : actorHeadImg.trim();
    }

    public String getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(String isDelete) {
        this.isDelete = isDelete == null ? null : isDelete.trim();
    }

    public String getActorName() {
        return actorName;
    }

    public void setActorName(String actorName) {
        this.actorName = actorName == null ? null : actorName.trim();
    }

    public String getPortray() {
        return portray;
    }

    public void setPortray(String portray) {
        this.portray = portray == null ? null : portray.trim();
    }

    public Integer getMovieId() {
        return movieId;
    }

    public void setMovieId(Integer movieId) {
        this.movieId = movieId;
    }
}