package com.lovemovie.exceptions;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @Author : Alishiz
 * @Date : 2021/5/4/0004 16:05
 * @email : 1575234570@qq.com
 * @Description :
 */
@Component
public class GlobalExceptionResolver implements HandlerExceptionResolver {
    @Override
    public ModelAndView resolveException(HttpServletRequest request,
                                         HttpServletResponse response,
                                         Object handler, Exception ex) {
        ModelAndView mv = createDefaultModelAndView();



        return null;
    }

    private ModelAndView createDefaultModelAndView() {
        ModelAndView mv = new ModelAndView();
        //设置默认信息
        // mv.setViewName();
        return mv;
    }
}
