package com.lovemovie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * @Author : Alishiz
 * @Date : 2021/5/4/0004 11:38
 * @email : 1575234570@qq.com
 * @Description :
 */
@Controller
public class BaseController {

    @RequestMapping(value = "/index")
    public String index(HttpServletRequest request){
        request.setAttribute("page",1);
        return "index";
    }

    @RequestMapping(value = "/movieCodepen")
    public String movieCodepen(HttpServletRequest request){
        request.setAttribute("page",2);
        return "movie-codepen";
    }
    @RequestMapping(value = "/movieTheatreList")
    public String movieTheatreList(HttpServletRequest request){
        request.setAttribute("page",3);
        return "movie-theatre-list";
    }



}
