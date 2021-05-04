package com.lovemovie.utils;

import com.lovemovie.exceptions.LoginException;
import com.lovemovie.exceptions.ParamsException;

/**
 * @Author : Alishiz
 * @Date : 2021/5/3/0003 21:01
 * @email : 1575234570@qq.com
 * @Description : 断言
 */
public class AssertUtil {

    //参数异常
    public static void isTrue(Boolean flag,String msg){
        if (flag){
            throw  new ParamsException(msg);
        }
    }
    public static void isTrue(Boolean flag,String msg,Integer code){
        if (flag){
            throw  new ParamsException(code,msg);
        }
    }
    public static void isNotLogin(Boolean flag,String msg){
        if (flag){
            throw  new LoginException(msg);
        }
    }

}
