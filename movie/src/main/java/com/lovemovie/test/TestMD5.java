package com.lovemovie.test;

import com.lovemovie.utils.MD5Util;
import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author : Alishiz
 * @Date : 2021/5/3/0003 20:16
 * @email : 1575234570@qq.com
 * @Description :
 */
public class TestMD5 {
    @Test
    public void test01() {
        String user = MD5Util.getMD5("123123");
        System.out.println("12312 = " + user);
    }
}
