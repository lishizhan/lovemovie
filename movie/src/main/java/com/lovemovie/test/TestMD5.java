package com.lovemovie.test;

import com.lovemovie.utils.MD5Util;
import org.junit.Test;

/**
 * @Author : Alishiz
 * @Date : 2021/5/3/0003 20:16
 * @email : 1575234570@qq.com
 * @Description :
 */
public class TestMD5 {
    @Test
    public void test01() {
        String user = MD5Util.getMD5("user");
        System.out.println("user = " + user);


    }
}
