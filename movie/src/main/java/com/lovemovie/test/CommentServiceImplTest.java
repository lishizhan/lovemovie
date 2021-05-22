package com.lovemovie.test;

import com.lovemovie.model.Msg;
import com.lovemovie.service.ICommentService;
import com.lovemovie.utils.DateTimeUtil;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.xml.crypto.Data;
import java.util.Date;

/**
 * @Author : Alishiz
 * @Date : 2021/5/14/0014 13:33
 * @email : 1575234570@qq.com
 * @Description :
 */
public class CommentServiceImplTest {

    @Test
    public void test01() {
        ApplicationContext ac  =new ClassPathXmlApplicationContext("applicationContext.xml");
        String[] names = ac.getBeanDefinitionNames();
        for (String name : names) {
            System.out.println("name = " + name);
        }
        ICommentService commentService = ac.getBean(ICommentService.class);
        Msg msg = commentService.findCommentByMovieId(1, 1, 3);
        System.out.println(msg);
    }
    @Test
    public void test123() {
        System.out.println(DateTimeUtil.getSysTime());
    }
}
