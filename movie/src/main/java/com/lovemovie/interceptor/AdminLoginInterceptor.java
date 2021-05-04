package com.lovemovie.interceptor;

import com.lovemovie.domain.User;
import com.lovemovie.utils.AssertUtil;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @Author : Alishiz
 * @Date : 2021/5/4/0004 21:32
 * @email : 1575234570@qq.com
 * @Description :
 */
public class AdminLoginInterceptor extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response,
                             Object handler) throws Exception {
        User admin = (User) request.getSession().getAttribute("admin");
        AssertUtil.isNotLogin(admin==null, "管理员未登录");
        return true;
    }
}
