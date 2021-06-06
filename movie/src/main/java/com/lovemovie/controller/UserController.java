package com.lovemovie.controller;

import com.google.code.kaptcha.Constants;
import com.lovemovie.domain.User;
import com.lovemovie.model.Msg;
import com.lovemovie.service.IUserService;
import com.lovemovie.utils.ImageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.text.ParseException;

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

    /**
     * 用户登陆
     *
     * @param userName 用户名
     * @param userPwd  用户密码
     * @param code     验证码
     * @param request
     * @return
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public Msg login(String userName, String userPwd, String code, HttpServletRequest request) {
        //判断验证码是否正确
        String attribute = (String) request.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY);

        if (!attribute.equals(code)) {
            Msg msg = new Msg();
            msg.setMsg("验证码错误");
            msg.setCode(200);
            return msg;
            // return Msg.fail().add("msg", "验证码错误");
        }
        Msg loginMsg = userService.login(userName.trim(), userPwd.trim());
        //没有异常则登陆成功
        //判断用户权限，如果是1则是管理员，如果是0则是普通用户
        User user = (User) loginMsg.getExtend().get("user");
        if (user.getUserRole() == 1) {
            request.getSession().setAttribute("admin", user);
            // System.out.println("user = " + user);
            return Msg.success().add("msg", "adminSuccess");
        }
        request.getSession().setAttribute("user", user);
        // System.out.println("user = " + user);
        return Msg.success().add("msg", "userSuccess");

    }

    /**
     * 退出登陆
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    @ResponseBody
    public Msg logout(HttpServletRequest request) {
        //清除session中user数据
        request.getSession().removeAttribute("user");
        return Msg.success();
    }


    /**
     * 进入个人首页
     *
     * @return
     */
    @RequestMapping(value = "/userMain")
    public ModelAndView userMain(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        ModelAndView mv = new ModelAndView();
        mv.addObject("user", user);
        mv.setViewName("jsp/user-main");

        return mv;
    }


    /**
     * 检查用户名是否可用
     *
     * @param userName 用户名
     * @return
     */
    @RequestMapping(value = "/checkUserName")
    @ResponseBody
    public Msg checkUserName(String userName) {
        //数据库检验
        Msg msg = userService.checkUserName(userName);
        return Msg.success();
    }


    /**
     * 用户注册
     *
     * @param userName    用户名
     * @param userEmail   用户邮箱
     * @param userPwd     用户密码
     * @param userPwdTrue 确认密码
     * @param code        验证码
     * @param request     请求
     * @return msg
     */
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    @ResponseBody
    public Msg register(String userName, String userEmail,
                        String userPwd, String userPwdTrue,
                        String code, HttpServletRequest request) {

        if (!code.equals(request.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY))) {
            return Msg.fail().add("msg", "验证码不正确");
        }
        if (!userPwd.equals(userPwdTrue)) {
            return Msg.fail().add("msg", "两次密码输入不一致");
        }
        Msg msg = userService.register(userName, userEmail, userPwd);
        return msg;
    }

    /**
     * 修改用户密码
     *
     * @param oldPwd  旧密码
     * @param newPwd  新密码
     * @param truePwd 确认密码
     * @return
     */
    @RequestMapping(value = "/updatePwd")
    @ResponseBody
    public Msg updatePwd(String oldPwd, String newPwd, String truePwd, HttpServletRequest request) {
        System.out.println(oldPwd + "\t" + newPwd + "\t" + truePwd);
        User user = (User) request.getSession().getAttribute("user");
        Msg msg = userService.updatePwd(oldPwd, newPwd, truePwd, user);
        request.getSession().removeAttribute("user");
        return msg;
    }

    /**
     * 用户上传头像
     *
     * @param upload  图片
     * @param request 请求作用域
     * @return
     */
    @RequestMapping(value = "/uploadHeadImg")
    @ResponseBody
    public Msg uploadHeadImg(MultipartFile upload, HttpServletRequest request) throws Exception {
        String path = ImageUtils.uploadHeadImg(request, upload);
        User user = (User) request.getSession().getAttribute("user");
        Msg msg = userService.updateHeadImg(user.getUserId(), path);
        if (path != null) {
            String oldImg = user.getUserHeadimg();
            String url = request.getSession().getServletContext().getRealPath(oldImg);
            if (!url.contains("default_userimg.png")){
                File file = new File(url);
                if (file.exists()){
                    file.delete();
                }
            }
        }
        user.setUserHeadimg(path);
        request.getSession().setAttribute("user",user);
        return msg;
    }


    @RequestMapping(value = "/updateUserInfo")
    @ResponseBody
    public Msg updateUserInfo(Integer userId, String userEmail, String userSex, String[] userHobby, String userBirthday) throws ParseException {
        Msg msg = userService.updateUserInfo(userId, userEmail, userSex, userHobby, userBirthday);
        return msg;
    }


    @RequestMapping(value = "/getUserById")
    @ResponseBody
    public Msg getUserById(Integer userId) {
        return userService.getUserByd(userId);
    }


    @RequestMapping(value = "/testInput")
    @ResponseBody
    public Msg testN(String name) {
        System.out.println("name = " + name);
        return Msg.success();
    }


}
