package com.lovemovie.exceptions;

/**
 * @Author : Alishiz
 * @Date : 2021/5/3/0003 21:04
 * @email : 1575234570@qq.com
 * @Description :
 */
public class ParamsException extends RuntimeException {
    private Integer code=300;
    private String msg="参数异常";
    public ParamsException() {
        super();
    }


    public ParamsException(Integer code, String msg) {
        super(msg);
        this.code = code;
        this.msg = msg;
    }
    public ParamsException(String msg) {
        super(msg);
        this.msg = msg;
    }
    public ParamsException(Integer code) {
        super("参数异常");
        this.code = code;
    }


    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
