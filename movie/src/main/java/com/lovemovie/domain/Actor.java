package com.lovemovie.domain;

public class Actor {
    private String actorId;

    private String actorHeadImg;

    private String isDelete="1";

    private String actorName;

    private String portray;

    private String movieName;

    public String getActorId() {
        return actorId;
    }

    public void setActorId(String actorId) {
        this.actorId = actorId == null ? null : actorId.trim();
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

    public String getMovieName() {
        return movieName;
    }

    public void setMovieName(String movieName) {
        this.movieName = movieName == null ? null : movieName.trim();
    }

    @Override
    public String toString() {
        return "Actor{" +
                "actorId='" + actorId + '\'' +
                ", actorHeadImg='" + actorHeadImg + '\'' +
                ", isDelete='" + isDelete + '\'' +
                ", actorName='" + actorName + '\'' +
                ", portray='" + portray + '\'' +
                ", movieName='" + movieName + '\'' +
                '}';
    }
}