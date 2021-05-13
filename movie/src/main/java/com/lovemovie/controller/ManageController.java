package com.lovemovie.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lovemovie.domain.User;
import com.lovemovie.model.Msg;
import com.lovemovie.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @Author : Alishiz
 * @Date : 2021/5/4/0004 16:36
 * @email : 1575234570@qq.com
 * @Description :
 */
@Controller
@RequestMapping(value = "/management")
public class ManageController {
    @Autowired
    private IUserService userService;

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

    /**
     * 分页查询所有的用户信息
     * @param pageNo 第几页
     * @param pageSize 每页显示几条
     * @return
     */
    @RequestMapping(value = "getAllUser")
    @ResponseBody
    public Msg getAllUser(
            @RequestParam(value = "pageNo",defaultValue = "1") Integer pageNo,
            @RequestParam(value = "pageSize",defaultValue = "5") Integer pageSize){

        PageHelper.startPage(pageNo,pageSize);
        List<User> userList = userService.getAllUser();
        PageInfo<User> pageInfo = new PageInfo<>(userList,pageSize);
        return Msg.success().add("pageInfo",pageInfo);
    }




}
