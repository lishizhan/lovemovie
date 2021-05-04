package com.lovemovie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * @Author : Alishiz
 * @Date : 2021/5/4/0004 16:36
 * @email : 1575234570@qq.com
 * @Description :
 */
@Controller
@RequestMapping(value = "/management")
public class ManageController {

    @RequestMapping(value = "/index")
    public String index(){
        return "admin/index";
    }
    @RequestMapping(value = "/adminInfo")
    public String adminInfo(){
        return "admin/admin-info";
    }
    @RequestMapping(value = "/userInfo")
    public String userInfo(){
        return "admin/user-info";
    }
    @RequestMapping(value = "/movieTypeInfo")
    public String movieTypeInfo(){
        return "admin/movie-type-info";
    }
    @RequestMapping(value = "/cityInfo")
    public String cityInfo(){
        return "admin/city-info";
    }
    @RequestMapping(value = "/cinemaInfo")
    public String cinemaInfo(){
        return "admin/cinema-info";
    }
    @RequestMapping(value = "/movieInfo")
    public String movieInfo(){
        return "admin/movie-info";
    }
    @RequestMapping(value = "/orderInfo")
    public String orderInfo(){
        return "admin/order-info";
    }
    @RequestMapping(value = "/movieAppraise")
    public String movieAppraise(){
        return "admin/movie-appraise";
    }

    @RequestMapping(value = "/logoutAdmin")
    public String logoutAdmin(HttpServletRequest request){
        request.getSession().removeAttribute("admin");
        return "redirect:/view/goLogin";
    }





}
