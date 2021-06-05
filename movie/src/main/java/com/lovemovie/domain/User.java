package com.lovemovie.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class User {
    private Long userId;//会员编号

    private String userName;//会员账号

    private String userPwd;//会员密码

    private String userEmail;//会员邮箱

    private Integer userRole;//会员权限（默认为0） 0：普通会员 1：管理员

    private String userHeadimg="upload/default/default_userimg.png";//会员头像
    private String userSex;
    private String userSexStr;

    public String getUserSexStr() {
        if ("0".equals(this.userSex)) {
            this.userSexStr = "女";
        } else {
            this.userSexStr = "男";
        }
        return userSexStr;
    }

    public void setUserSexStr(String userSexStr) {
        this.userSexStr = userSexStr;
    }

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date userBirthday;

    private String userHobby;


    public String getUserSex() {
        return userSex;
    }

    public void setUserSex(String userSex) {
        this.userSex = userSex;
    }

    public Date getUserBirthday() {
        return userBirthday;
    }

    public void setUserBirthday(Date userBirthday) {
        this.userBirthday = userBirthday;
    }

    public String getUserHobby() {
        return userHobby;
    }

    public void setUserHobby(String userHobby) {
        this.userHobby = userHobby;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getUserPwd() {
        return userPwd;
    }

    public void setUserPwd(String userPwd) {
        this.userPwd = userPwd == null ? null : userPwd.trim();
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail == null ? null : userEmail.trim();
    }

    public Integer getUserRole() {
        return userRole;
    }

    public void setUserRole(Integer userRole) {
        this.userRole = userRole;
    }

    public String getUserHeadimg() {
        return userHeadimg;
    }

    @Override
    public String toString() {
        return "User{" +
                "userId=" + userId +
                ", userName='" + userName + '\'' +
                ", userPwd='" + userPwd + '\'' +
                ", userEmail='" + userEmail + '\'' +
                ", userRole=" + userRole +
                ", userHeadimg='" + userHeadimg + '\'' +
                ", userSex='" + userSex + '\'' +
                ", userBirthday=" + userBirthday +
                ", userHobby='" + userHobby + '\'' +
                '}';
    }

    public void setUserHeadimg(String userHeadimg) {
        this.userHeadimg = userHeadimg == null ? null : userHeadimg.trim();

    }
}