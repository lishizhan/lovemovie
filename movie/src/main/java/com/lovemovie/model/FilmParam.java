package com.lovemovie.model;

/**
 * @Author : Alishiz
 * @Date : 2021/6/4/0004 0:19
 * @email : 1575234570@qq.com
 * @Description :
 */
public class FilmParam {
    private String sortId;
    private String typeId;
    private String sourceId;
    private String yearId;
    private String pageNum;

    public String getPageNum() {
        return pageNum;
    }

    public void setPageNum(String pageNum) {
        this.pageNum = pageNum;
    }

    @Override
    public String toString() {
        return "FilmParam{" +
                "sortId='" + sortId + '\'' +
                ", typeId='" + typeId + '\'' +
                ", sourceId='" + sourceId + '\'' +
                ", yearId='" + yearId + '\'' +
                ", pageNum='" + pageNum + '\'' +
                '}';
    }

    public FilmParam(String sortId, String typeId, String sourceId, String yearId, String pageNum) {
        this.sortId = sortId;
        this.typeId = typeId;
        this.sourceId = sourceId;
        this.yearId = yearId;
        this.pageNum = pageNum;
    }

    public FilmParam() {
    }

    public String getSortId() {
        return sortId;
    }

    public void setSortId(String sortId) {
        this.sortId = sortId;
    }

    public String getTypeId() {
        return typeId;
    }

    public void setTypeId(String typeId) {
        this.typeId = typeId;
    }

    public String getSourceId() {
        return sourceId;
    }

    public void setSourceId(String sourceId) {
        this.sourceId = sourceId;
    }

    public String getYearId() {
        return yearId;
    }

    public void setYearId(String yearId) {
        this.yearId = yearId;
    }
}
