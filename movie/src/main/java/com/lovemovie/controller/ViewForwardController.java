package com.lovemovie.controller;

import com.lovemovie.domain.Movie;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * @Author : Alishiz
 * @Date : 2021/5/4/0004 11:38
 * @email : 1575234570@qq.com
 * @Description :
 */
@Controller
@RequestMapping(value = "/view")
public class ViewForwardController {

    @RequestMapping(value = "/index")
    public String index(HttpServletRequest request) {
        request.setAttribute("page", 1);
        return "jsp/index";
    }

    @RequestMapping(value = "/movieCodepen")
    public String movieCodepen(HttpServletRequest request) {
        request.setAttribute("page", 2);
        return "jsp/movie-codepen";
    }

    @RequestMapping(value = "/movieTheatreList")
    public String movieTheatreList(HttpServletRequest request) {
        request.setAttribute("page", 3);
        return "jsp/movie-theatre-list";
    }
    @RequestMapping(value = "/movieTop")
    public String movieTop(HttpServletRequest request) {
        request.setAttribute("page", 3);
        return "jsp/movie-top";
    }

    //登陆
    @RequestMapping(value = "/goLogin")
    public String goLogin() {
        return "jsp/login";
    }

    @RequestMapping(value = "/goRegister")
    public String goRegister() {
        return "jsp/register";
    }






}
