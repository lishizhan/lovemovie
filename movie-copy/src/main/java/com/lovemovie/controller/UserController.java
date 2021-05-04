package com.lovemovie.controller;

import com.google.code.kaptcha.Constants;
import com.lovemovie.domain.User;
import com.lovemovie.exceptions.ParamsException;
import com.lovemovie.service.IUserService;
import com.lovemovie.model.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * @Author : Alishiz
 * @Date : 2021/5/3/0003 18:12
 * @email : 1575234570@qq.com
 * @Description :用户模块
 */
@Controller
@RequestMapping(value = "/user")
public class UserController {

    @Autowired
    private IUserService userService;

    @RequestMapping(value = "/login",method = RequestMethod.POST)
    @ResponseBody
    public Msg login(String userName, String userPwd, String code, HttpServletRequest request){

        //判断验证码是否正确
        String attribute = attribute = (String) request.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY);;
        if (!attribute.equals(code)){
            return Msg.fail().add("msg","验证码错误");
        }

        try {
            Msg loginMsg = userService.login(userName.trim(), userPwd.trim());
            //没有异常则登陆成功
            //判断用户权限，如果是1则是管理员，如果是0则是普通用户
            User user = (User) loginMsg.getExtend().get("user");
            if (user.getUserRole()==1){
                request.getSession().setAttribute("admin", user);
                System.out.println("user = " + user);
                return Msg.success().add("msg","adminSuccess");
            }
            request.getSession().setAttribute("user", user);
            System.out.println("user = " + user);
            return Msg.success().add("msg","userSuccess");

        } catch (ParamsException pe) {
            pe.printStackTrace();
            return  Msg.fail().add("msg",pe.getMsg());
        }catch (Exception e){
            e.printStackTrace();
            return Msg.fail().add("msg",e.getMessage());
        }

    }


    @RequestMapping(value = "/logout",method = RequestMethod.GET)
    @ResponseBody
    public Msg logout(HttpServletRequest request){
        //清除session中user数据
        request.getSession().removeAttribute("user");
        return Msg.success();
    }


}
