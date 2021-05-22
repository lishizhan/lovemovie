package com.lovemovie.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lovemovie.dao.CommentMapper;
import com.lovemovie.domain.Comment;
import com.lovemovie.model.Msg;
import com.lovemovie.service.ICommentService;
import com.lovemovie.utils.AssertUtil;
import com.lovemovie.utils.DateTimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @Author : Alishiz
 * @Date : 2021/5/13/0013 19:02
 * @email : 1575234570@qq.com
 * @Description :
 */
@Service
public class CommentServiceImpl implements ICommentService {

    @Autowired
    private CommentMapper commentMapper;


    @Override
    public Msg findCommentByMovieId(Integer movieId,Integer pageNum,Integer pageSize) {

        AssertUtil.isTrue(null ==movieId, "电影id为空");

        PageHelper.startPage(pageNum, pageSize);
        List<Comment> commentList = commentMapper.findCommentByMovieId(new Long(movieId));
        System.out.println("commentList = " + commentList);
        PageInfo<Comment> pageInfo = new PageInfo<>(commentList,pageSize);
        return Msg.success().add("commentList",pageInfo);
    }

    @Override
    public Msg addComment(String comment, Integer movieId, Long userId) {
        AssertUtil.isTrue(comment==null, "评论不能为空");
        AssertUtil.isTrue(movieId==null,"电影编号不能为空");
        AssertUtil.isTrue(userId==null,"用户id不能为空");
        Comment comment1 = new Comment();
        comment1.setMovieId(new Long(movieId));
        comment1.setCommentContent(comment);
        comment1.setCommentTime(new Date());
        comment1.setUserId(userId);
        commentMapper.insertSelective(comment1);
        return Msg.success();
    }
}
