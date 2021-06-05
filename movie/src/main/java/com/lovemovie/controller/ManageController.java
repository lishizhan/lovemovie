package com.lovemovie.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lovemovie.domain.Actor;
import com.lovemovie.domain.Movie;
import com.lovemovie.domain.MovieInfo;
import com.lovemovie.domain.User;
import com.lovemovie.model.Msg;
import com.lovemovie.service.IActorService;
import com.lovemovie.service.IMovieService;
import com.lovemovie.service.IUserService;
import com.lovemovie.utils.AssertUtil;
import com.lovemovie.utils.ImageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.util.Arrays;
import java.util.List;

/**
 * @Author : Alishiz
 * @Date : 2021/5/4/0004 16:36
 * @email : 1575234570@qq.com
 * @Description :
 */
@Controller
@RequestMapping(value = "/management")
public class ManageController {
    @Autowired
    private IUserService userService;

    @Autowired
    private IMovieService movieService;

    @Autowired
    private IActorService actorService;

    @RequestMapping(value = "/index")
    public String index() {
        return "admin/index";
    }

    @RequestMapping(value = "/adminInfo")
    public String adminInfo() {
        return "admin/admin-info";
    }

    @RequestMapping(value = "/userInfo")
    public String userInfo() {
        return "admin/user-info";
    }

    @RequestMapping(value = "/movieTypeInfo")
    public String movieTypeInfo() {
        return "admin/movie-type-info";
    }

    @RequestMapping(value = "/cityInfo")
    public String cityInfo() {
        return "admin/city-info";
    }

    @RequestMapping(value = "/scheduleInfo")
    public String scheduleInfo() {
        return "admin/schedule-info";
    }

    @RequestMapping(value = "/cinemaInfo")
    public String cinemaInfo() {
        return "admin/cinema-info";
    }

    @RequestMapping(value = "/movieInfo")
    public String movieInfo() {
        return "admin/movie-info";
    }

    @RequestMapping(value = "/orderInfo")
    public String orderInfo() {
        return "admin/order-info";
    }

    @RequestMapping(value = "/movieAppraise")
    public String movieAppraise() {
        return "admin/movie-appraise";
    }

    @RequestMapping(value = "/logoutAdmin")
    public String logoutAdmin(HttpServletRequest request) {
        request.getSession().removeAttribute("admin");
        return "redirect:/view/goLogin";
    }


    /**
     * 电影页面信息跳转
     *
     * @return
     */
    @RequestMapping(value = "/detailMovie")
    public ModelAndView goRegister(Integer movieId) {
        ModelAndView modelAndView = new ModelAndView();
        //返回电影基本信息
        Movie movie = movieService.findMovieByMovieId(movieId);
        modelAndView.addObject("movie", movie);

        //返回导演信息
        Actor director = actorService.getDirectorByName(movie.getMovieDirector());
        modelAndView.addObject("director",director);

        //返回演员信息
        Actor actors =actorService.getDirectorById(movie.getMovieActor());
        modelAndView.addObject("actors",actors);

        modelAndView.setViewName("admin/movie-info-detail");
        return modelAndView;
    }


    /**
     * 分页查询所有的用户信息
     *
     * @param pageNo   第几页
     * @param pageSize 每页显示几条
     * @return
     */
    @RequestMapping(value = "getAllUser")
    @ResponseBody
    public Msg getAllUser(
            @RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo,
            @RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize,
            String userName) {

        PageHelper.startPage(pageNo, pageSize);
        List<User> userList = userService.getAllUser(userName);
        PageInfo<User> pageInfo = new PageInfo<>(userList, pageSize);
        return Msg.success().add("pageInfo", pageInfo);
    }


    /**
     * 查询所有的电影
     *
     * @param pageNo   页数
     * @param pageSize 每页展示条数
     * @return
     */
    @RequestMapping(value = "getAllMovies")
    @ResponseBody
    public Msg getAllMovies(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo,
                            @RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        List<Movie> allMovies = movieService.findAllMovies();
        PageInfo<Movie> pageInfo = new PageInfo<>(allMovies, pageSize);

        return Msg.success().add("pageInfo", pageInfo);
    }


    /**
     * 根据电影ID获取信息
     *
     * @param movieId
     * @return
     */
    @RequestMapping(value = "/getMovieByMovieId")
    @ResponseBody
    public Msg getMovieByMovieId(Integer movieId) {
        Movie movie = movieService.findMovieByMovieId(movieId);
        return Msg.success().add("movie", movie);

    }

    /**
     * 添加电影
     *
     * @param
     * @return
     */
    @RequestMapping(value = "/saveMovie", method = RequestMethod.POST)
    @ResponseBody
    public Msg saveMovie(MovieInfo movieInfo) throws ParseException {
        //保存电影
        Msg msg=movieService.addMovie(movieInfo);
        return msg;
    }

    /**
     * 保存演员信息
     * @return
     */
    @RequestMapping(value = "/saveActorInfo")
    @ResponseBody
    public Msg saveActorInfo(Actor actor){
        System.out.println("actor = >>>>>" + actor);
        return Msg.success();
    }

    /**
     * 添加演员头像
     *
     * @param upload  图片
     * @param request 请求作用域
     * @return
     */
    @RequestMapping(value = "/uploadActorHeadImg")
    @ResponseBody
    public Msg uploadActorHeadImg(MultipartFile upload, HttpServletRequest request) throws Exception {
        String path = ImageUtils.uploadActorHeadImg(request, upload);
        System.out.println("path =>>>>>>>>" + path);
        return Msg.success().add("movieImg", path);
    }


    /**
     * 添加电影海报
     *
     * @param upload  图片
     * @param request 请求作用域
     * @return
     */
    @RequestMapping(value = "/uploadMovieImg")
    @ResponseBody
    public Msg uploadMovieImg(MultipartFile upload, HttpServletRequest request) throws Exception {
        String path = ImageUtils.uploadMovieImg(request, upload);
        System.out.println("path =>>>>>>>>" + path);
        return Msg.success().add("movieImg", path);
    }

    /**
     * 验证电影名称是否重复
     * @param movieName
     * @return
     */
    @RequestMapping(value = "/queryByMovieName")
    @ResponseBody
    public Msg isExistMovieByName(String movieName){
        System.out.println("movieName =>>>> " + movieName);
        Msg msg = movieService.findMovieNameIsExist(movieName);
        return msg;
    }


    //根据电影id删除，单个删除和批量删除二合一，1-2-3-4，1
    @RequestMapping(value = "deleteMovie/{movieId}", method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteEmp(@PathVariable("movieId") String movieId) {
        System.out.println("ids = " + movieId);
        if (movieId.contains("-")) {
            //批量删除
            String[] arrId = movieId.split("-");
            int[] ints = new int[arrId.length];
            for (int i = 0; i < arrId.length; i++) {
                ints[i] = Integer.parseInt(arrId[i]);
            }
            // System.out.println("int[]:"+ Arrays.toString(ints));
            movieService.deleteBatch(ints);
            return Msg.success();
        } else {
            //单个删除
            return movieService.deleteMovieById(movieId);
        }
    }


    //根据用户id删除用户，单个删除和批量删除二合一，1-2-3-4，1
    @RequestMapping(value = "/deleteUser/{userId}", method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteComment(@PathVariable("userId") String userId) {
        System.out.println("ids = " + userId);
        if (userId.contains("-")) {
            //批量删除
            String[] arrId = userId.split("-");
            int[] ints = new int[arrId.length];
            for (int i = 0; i < arrId.length; i++) {
                ints[i] = Integer.parseInt(arrId[i]);
            }
            // System.out.println("int[]:"+ Arrays.toString(ints));
            userService.deleteBatch(ints);
            return Msg.success();
        } else {
            //单个删除
            return userService.deleteMovieById(userId);
        }
    }


    @RequestMapping(value = "/addUser")
    @ResponseBody
    public Msg addUser(User user){
        System.out.println("user >>>>>>>>>>>>>>>>>" + user);
        Msg msg = userService.addUser(user);
        return msg;
    }

}
