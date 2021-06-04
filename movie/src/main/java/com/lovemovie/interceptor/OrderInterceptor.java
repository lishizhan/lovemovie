package com.lovemovie.interceptor;

import com.lovemovie.domain.User;
import com.lovemovie.utils.AssertUtil;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @Author : Alishiz
 * @Date : 2021/6/5/0005 0:32
 * @email : 1575234570@qq.com
 * @Description :
 */
public class OrderInterceptor extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        User user = (User) request.getSession().getAttribute("user");
        AssertUtil.isNotLogin(user==null,"用户未登录不能购票");
        return true;
    }
}
