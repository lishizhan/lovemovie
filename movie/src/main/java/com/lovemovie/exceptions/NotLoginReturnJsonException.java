package com.lovemovie.exceptions;

/**
 * @Author : Alishiz
 * @Date : 2021/5/15/0015 10:17
 * @email : 1575234570@qq.com
 * @Description :
 */
public class NotLoginReturnJsonException extends RuntimeException{
    private Integer code=300;
    private String msg="请登录";
    public NotLoginReturnJsonException() {
        super();
    }


    public NotLoginReturnJsonException(Integer code, String msg) {
        super(msg);
        this.code = code;
        this.msg = msg;
    }
    public NotLoginReturnJsonException(String msg) {
        super(msg);
        this.msg = msg;
    }
    public NotLoginReturnJsonException(Integer code) {
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
