package com.lovemovie.service;

import com.lovemovie.domain.Comment;
import com.lovemovie.model.Msg;

import java.util.List;

/**
 * @Author : Alishiz
 * @Date : 2021/5/13/0013 19:02
 * @email : 1575234570@qq.com
 * @Description :
 */
public interface ICommentService {
    Msg findCommentByMovieId(Integer movieId,Integer pageNum,Integer pageSize);

    Msg addComment(String comment, Integer movieId, Long userId);

    /**
     * 查询所有评论
     * @return
     */
    List<Comment> findAllComment(String userName);

    void deleteBatch(int[] ints);

    Msg deleteMovieById(String commentId);
}
