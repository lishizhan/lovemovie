package com.lovemovie.exceptions;

import com.fasterxml.jackson.core.FormatSchema;
import com.fasterxml.jackson.core.JsonPointer;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import com.fasterxml.jackson.databind.util.JSONPObject;
import com.google.gson.Gson;
import com.lovemovie.model.Msg;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.imageio.IIOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Method;

/**
 * @Author : Alishiz
 * @Date : 2021/5/4/0004 16:05
 * @email : 1575234570@qq.com
 * @Description :全局异常处理
 */
@Component
public class GlobalExceptionResolver implements HandlerExceptionResolver {
    @Override
    public ModelAndView resolveException(HttpServletRequest request,
                                         HttpServletResponse response,
                                         Object target, Exception ex) {
        ModelAndView mv = createDefaultModelAndView(request, ex);

        /*
        * 用户未登录异常处理
        * */
        if (ex instanceof LoginException){
            LoginException e = (LoginException) ex;
            mv.setViewName("exception/notLogin");
            mv.addObject("msg",e.getMsg());
            return mv;
        }




        //区分页面请求和json请求，通过target目标方法获取方法上的注解，判断是否有@RespondBody,有则为json请求
        if (target instanceof HandlerMethod){
            HandlerMethod handler = (HandlerMethod) target;
            Method method = handler.getMethod();
            ResponseBody annotation = method.getAnnotation(ResponseBody.class);
            if (annotation!=null){
                //json请求
                // System.out.println("json请求");
                Msg msg = new Msg();
                msg.setCode(300);
                msg.setMsg("系统繁忙");
                if (ex instanceof ParamsException){
                    ParamsException e = (ParamsException) ex;
                    msg.setCode(e.getCode());
                    msg.setMsg(e.getMsg());
                }

                //将异常信息传递给页面
                response.setCharacterEncoding("UTF-8");
                response.setContentType("application/json;Charset=utf-8");
                PrintWriter pw = null;
                try {
                    pw = response.getWriter();

                    Gson gson = new Gson();
                    String json = gson.toJson(msg);
                    pw.write(json);
                    pw.flush();

                }catch (IOException e){
                    e.printStackTrace();
                }finally {
                    if (pw!=null){
                        pw.close();
                    }
                }


            }else {
                //普通页面请求
                // System.out.println("普通页面请求");

                if (ex instanceof ParamsException){
                    ParamsException e = (ParamsException) ex;
                    mv.addObject("errorMsg",e.getMsg());
                }
                mv.addObject("errorMsg","页面不见啦");
            }

        }

        return mv;
    }

    private ModelAndView createDefaultModelAndView(HttpServletRequest request, Exception ex) {
        ModelAndView mv = new ModelAndView();
        //设置默认信息
        mv.setViewName("exception/error");
        mv.addObject("errorMsg", ex.getMessage());
        return mv;
    }
}
