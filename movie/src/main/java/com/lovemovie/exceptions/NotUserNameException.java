package com.lovemovie.exceptions;

/**
 * @Author : Alishiz
 * @Date : 2021/5/3/0003 21:04
 * @email : 1575234570@qq.com
 * @Description :
 */
public class NotUserNameException extends RuntimeException {
    private Integer code=300;
    private String msg="该用户名已经存在";
    public NotUserNameException() {
        super();
    }


    public NotUserNameException(Integer code, String msg) {
        super(msg);
        this.code = code;
        this.msg = msg;
    }
    public NotUserNameException(String msg) {
        super(msg);
        this.msg = msg;
    }
    public NotUserNameException(Integer code) {
        super("该用户名已经存在");
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
