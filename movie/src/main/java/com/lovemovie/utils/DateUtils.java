package com.lovemovie.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @Author : Alishiz
 * @Date : 2021/4/9/0009 16:50
 * @email : 1575234570@qq.com
 * @Description :
 */
public class DateUtils {

    //日期转换为字符串
    public static String dateToString(Date date,String format){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(format);
        String s = simpleDateFormat.format(date);
        return s;
    }


    //字符串转换为日期
    public static Date stringToDate(String date,String format) throws ParseException {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(format);
        Date parse = simpleDateFormat.parse(date);
        return parse;
    }



}
