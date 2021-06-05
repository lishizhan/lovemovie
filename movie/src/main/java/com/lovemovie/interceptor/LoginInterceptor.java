package com.lovemovie.interceptor;

import com.lovemovie.domain.User;
import com.lovemovie.utils.AssertUtil;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @Author : Alishiz
 * @Date : 2021/5/4/0004 18:27
 * @email : 1575234570@qq.com
 * @Description :拦截器
 */
public class LoginInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response,
                             Object handler) throws Exception {

        User user = (User) request.getSession().getAttribute("user");

        User admin = (User) request.getSession().getAttribute("admin");
        if (user!=null){
            return true;
        }
        if (admin!=null){
            return true;
        }

        AssertUtil.isNotLogin(user==null,"用户未登录");
        return true;
    }
}
