package com.lovemovie.model;

import java.util.HashMap;
import java.util.Map;

/**
 * @Author : Alishiz
 * @Date : 2021/3/25/0025 13:45
 * @email : 1575234570@qq.com
 * @Description :
 */
//通用的返回类
public class Msg {
    private int code;//100成功，200失败，服务器处理状态
    private String msg;//提示信息
    private Map<String,Object> extend=new HashMap<>();//用户返回给浏览器的数据

    public static Msg success(){
        Msg result =  new Msg();
        result.setCode(100);
        result.setMsg("success");
        return result;
    }
    public static Msg fail(){
        Msg result =  new Msg();
        result.setCode(200);
        result.setMsg("error");
        return result;
    }
    public Msg add(String key, Object value){
        this.getExtend().put(key, value);
        return this;
    }


    public int getCode() {
        return code;

    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }
}
