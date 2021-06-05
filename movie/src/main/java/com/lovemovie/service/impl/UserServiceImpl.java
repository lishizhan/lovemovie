package com.lovemovie.service.impl;

import com.lovemovie.dao.UserMapper;
import com.lovemovie.domain.User;
import com.lovemovie.model.Msg;
import com.lovemovie.service.IUserService;
import com.lovemovie.utils.AssertUtil;
import com.lovemovie.utils.DateTimeUtil;
import com.lovemovie.utils.DateUtils;
import com.lovemovie.utils.MD5Util;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

/**
 * @Author : Alishiz
 * @Date : 2021/5/3/0003 18:14
 * @email : 1575234570@qq.com
 * @Description :
 */
@Service
public class UserServiceImpl implements IUserService {

    @Autowired
    private UserMapper userMapper;

    public Msg login(String userName, String userPwd) {
        //判断参数是否合法是否为空
        AssertUtil.isTrue(StringUtils.isBlank(userName), "用户名不能为空");
        AssertUtil.isTrue(StringUtils.isBlank(userPwd), "密码不能为空");

        //根据用户名查询用户
        User user = userMapper.queryUserByName(userName);
        AssertUtil.isTrue(user == null, "用户或密码不正确");
        AssertUtil.isTrue(!user.getUserPwd().equals(MD5Util.getMD5(userPwd)), "用户或密码不正确");

        //经过以上判断后返回成功登陆信息
        return Msg.success().add("user", user);


    }

    @Override
    public List<User> getAllUser(String userName) {
        return userMapper.queryAllUser(userName);
    }

    @Override
    public Msg register(String userName, String userEmail, String userPwd) {
//将用户信息保存进入数据库
        AssertUtil.isTrue(userName == null, "用户名不能为空");
        AssertUtil.isTrue(userEmail == null, "邮箱不能为空");
        AssertUtil.isTrue(userPwd == null, "密码不能为空");
        User saveUser = new User();
        saveUser.setUserName(userName);
        saveUser.setUserEmail(userEmail);
        saveUser.setUserPwd(MD5Util.getMD5(userPwd));
        saveUser.setUserRole(0);
        userMapper.insertSelective(saveUser);
        return Msg.success();
    }

    @Override
    public Msg checkUserName(String userName) {
        AssertUtil.isTrue(StringUtils.isBlank(userName), "用户名不能为空");
        //检查用户输入的用户名是否合法
        String regx = "(^[a-zA-Z0-9_-]{4,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
        AssertUtil.isTrue(!userName.matches(regx), "用户名不合法");
        User user = userMapper.queryUserByName(userName);
        AssertUtil.isNotUserName(user != null, "该用户名已经有小伙伴在使用了");

        return Msg.success().add("msg", "用户名可以使用");
    }

    @Override
    public Msg updateHeadImg(Long userId, String path) {
        User user = new User();
        user.setUserId(userId);
        user.setUserHeadimg(path);
        userMapper.updateByPrimaryKeySelective(user);
        return Msg.success().add("headImg", path);


    }

    @Override
    public Msg updatePwd(String oldPwd, String newPwd, String truePwd, User user) {
        AssertUtil.isTrue(oldPwd == null || "".equals(oldPwd), "旧密码不能为空");
        AssertUtil.isTrue(newPwd == null || "".equals(newPwd), "新密码不能为空");
        AssertUtil.isTrue(truePwd == null || "".equals(truePwd), "确认密码不能为空");

        User userByName = userMapper.queryUserByName(user.getUserName());
        AssertUtil.isTrue(!userByName.getUserPwd().equals(MD5Util.getMD5(oldPwd)), "旧密码不正确");
        AssertUtil.isTrue(!newPwd.equals(truePwd), "新密码和确认密码不匹配");

        User user1 = new User();
        user1.setUserId(user.getUserId());
        user1.setUserPwd(MD5Util.getMD5(newPwd));
        int i = userMapper.updateByPrimaryKeySelective(user1);
        return Msg.success();
    }

    @Override
    public Msg updateUserInfo(Integer userId, String userEmail, String userSex, String[] userHobby, String userBirthday) throws ParseException {
        AssertUtil.isTrue(userEmail==null || "".equals(userEmail),"邮箱不能为空");

        String joinUserHobby = StringUtils.join(userHobby,"-");

        User user = new User();
        user.setUserId(new Long(userId));
        user.setUserEmail(userEmail);
        user.setUserSex(userSex);
        user.setUserHobby(joinUserHobby);
        user.setUserBirthday(DateUtils.stringToDate(userBirthday,"yyyy-MM-dd"));

        userMapper.updateByPrimaryKeySelective(user);
        return Msg.success();

    }

    @Override
    public Msg getUserByd(Integer userId) {
        User user = userMapper.selectByPrimaryKey(new Long(userId));
        user.setUserPwd(null);
        return Msg.success().add("user",user);
    }

    @Override
    public void deleteBatch(int[] ints) {
        userMapper.deleteBatch(ints);
    }

    @Override
    public Msg deleteMovieById(String userId) {
        AssertUtil.isTrue(userId == null, "用户id不能为空");
        int i = userMapper.deleteByPrimaryKey(new Long(userId));
        if (i > 0) {
            return Msg.success();
        } else {
            return Msg.fail();
        }
    }

    @Override
    public Msg addUser(User user) {
        int i = userMapper.insertSelective(user);
        if (i>0)return Msg.success();
        return Msg.fail();
    }


}
