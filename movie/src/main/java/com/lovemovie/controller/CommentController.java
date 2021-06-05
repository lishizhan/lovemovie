package com.lovemovie.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lovemovie.domain.Comment;
import com.lovemovie.domain.Movie;
import com.lovemovie.domain.User;
import com.lovemovie.model.Msg;
import com.lovemovie.service.ICommentService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @Author : Alishiz
 * @Date : 2021/5/13/0013 18:56
 * @email : 1575234570@qq.com
 * @Description : 评论模块管理
 */
@Controller
@RequestMapping(value = "/comment")
public class CommentController {

    @Autowired
    private ICommentService commentService;


    /**
     * 根据电影id查询对应的评论信息，并按时间排序
     *
     * @param movieId  电影id
     * @param pageNum  第几页
     * @param pageSize 每页显示几条
     * @return
     */
    @RequestMapping(value = "/findComment")
    @ResponseBody
    public Msg findCommentByMovieId(Integer movieId,
                                    @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
                                    @RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize) {

        Msg msg = commentService.findCommentByMovieId(movieId, pageNum, pageSize);

        return msg;
    }


    /**
     * 用户点击发表评论按钮
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/addCommentBtn")
    @ResponseBody
    public Msg addCommentBtn(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        return Msg.success();
    }

    /**
     * 发表评论
     *
     * @param request 请求作用域
     * @param comment 用户评论内容
     * @return
     */
    @RequestMapping(value = "/addComment")
    @ResponseBody
    public Msg addComment(HttpServletRequest request, String comment, Integer movieId) {
        User user = (User) request.getSession().getAttribute("user");
        // System.out.println("用户:"+user.getUserName()+"对电影["+movieId+"]发表评论："+comment);
        Msg msg = commentService.addComment(comment, movieId, user.getUserId());
        return msg;
    }

    /**
     * 查询所有评论
     *
     * @return
     */
    @RequestMapping(value = "/findAllComment")
    @ResponseBody
    public Msg findAllComment(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,@RequestParam( value = "pageSize", defaultValue = "10") Integer pageSize,String userName) {
            PageHelper.startPage(pageNum, pageSize);
            List<Comment> commentList = commentService.findAllComment(userName);
            PageInfo<Comment> pageInfo = new PageInfo<>(commentList, pageSize);
            System.out.println(pageInfo);
            // return Msg.success().add("movieList",movieList);
            return Msg.success().add("commentList", pageInfo);
    }

    //根据评论id删除，单个删除和批量删除二合一，1-2-3-4，1
    @RequestMapping(value = "deleteComment/{commentId}", method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteComment(@PathVariable("commentId") String commentId) {
        System.out.println("ids = " + commentId);
        if (commentId.contains("-")) {
            //批量删除
            String[] arrId = commentId.split("-");
            int[] ints = new int[arrId.length];
            for (int i = 0; i < arrId.length; i++) {
                ints[i] = Integer.parseInt(arrId[i]);
            }
            // System.out.println("int[]:"+ Arrays.toString(ints));
            commentService.deleteBatch(ints);
            return Msg.success();
        } else {
            //单个删除
            return commentService.deleteMovieById(commentId);
        }
    }


}
