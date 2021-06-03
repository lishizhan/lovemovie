<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<!doctype html>
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="static/css/base.css">
    <link rel="stylesheet" href="static/css/index.css">
    <link rel="stylesheet" href="static/css/movie-details.css">
    <!-- 引入网页图标 -->
    <link rel="shortcut icon" href="static/images/logo/bitbug_favicon.ico" type="image/x-icon">
    <script src="static/bootstrap/Jquery/jquery.min.js"></script>
    <script src="static/bootstrap/js/bootstrap.min.js"></script>
    <style>
        #listActor ul li{
            float: left;
            margin-right: 20px;
            margin-bottom: 10px;
        }

        #listActor ul li img{
            width: 128px;
            height: 170px;
        }
        .gopinlum {
            position: absolute;
            top: 0;
            right: 0;
            display: inline-block;

        }
    </style>
    <title>love movie</title>
</head>

<body style="background-color: #f2f2f2">
<!--页面头部 开始-->
<%@include file="common/head.jsp" %>
<!--页面头部 结束-->

<div class="details-top">
    <div class="container" style="position: relative; height: 300px;">
        <div class="movie-img">
            <img src="${movie.moviePicture}" width="100%" alt="">
        </div>
        <div class="movie-title">
            <h3 style="margin-top: 0px">${movie.movieCnName}</h3>
            <h5>${movie.movieFgName}</h5>
            <h5>地区：${movie.movieCountry}</h5>
            <h5>类型：${movie.movieType}</h5>
            <h5>上映时间：${movie.movieReleasedate}</h5>
            <br>
            <div>
                <button class="btn btn-info"><span class="glyphicon glyphicon-heart"></span> 想看</button>
                <button class="btn btn-info"><span class="glyphicon glyphicon-star"></span> 评分</button>
            </div>
            <c:if test="${movie.movieState==1}">
                <button class="btn btn-info" style="background-color: #df2d2d;padding: 6px 100px;margin-top: 10px">购&nbsp;&nbsp;票</button>
            </c:if>

        </div>
        <div class="movie-score">
            <p>用户评分</p>
            <p class="score">
                <span>${movie.movieScore}</span>
                <span class="glyphicon glyphicon-star"></span>
                <span class="glyphicon glyphicon-star"></span>
                <span class="glyphicon glyphicon-star"></span>
                <span class="glyphicon glyphicon-star"></span>
                <span class="glyphicon glyphicon-star"></span>
                <span class="glyphicon glyphicon-star-empty"></span>
            </p>
            <p>累计票房</p>
            <p style="font-size: 26px">${movie.movieBoxoffice}万</p>
        </div>
    </div>
</div>
<div class="container" style="margin-top: 20px;">
    <div class="introduce">
        <span>介绍</span>
    </div>
    <div class="movie-jieshao">
        <div class="movie-contro-title">剧情简介</div>
        <div>
            <p style="font-size: 18px">
                ${movie.movieDetail}
            </p>

        </div>
    </div>
    <div class="movie-yanyuan">
        <div class="movie-contro-title">演职人员</div>
        <div id="listActor">
            <ul>
                <li>
                    <img src="${listActor.director.actorHeadImg}" alt="演员">
                    <p class="h5">导演：${listActor.director.actorName}</p>
                </li>
                <c:forEach items="${listActor.actorList}" var="entry">
                    <li>
                        <img src="${entry.actorHeadImg}" alt="演员">
                        <p class="h5">${entry.actorName}</p>
                        <span>饰演：${entry.portray}</span>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>

</div>
<div class="container movie-pinlun">
    <div class="movie-contro-title">热门评论
        <button id="addCommentBtn" style="float: right" class="btn btn-info right">发表评论</button>
    </div>

    <ul class="pinlun">
        <!--<li>
            <div>
                <img src="upload/movies/movie1.jpg" alt="头像">
                <div>
                    <p>admin</p>
                    <p>2021-10-19 00:20:44</p>
                </div>
            </div>
            <p>
                很棒，杰森斯坦森的演技还是很棒，一个沉默又狠的硬汉，我觉得这种电影比小鲜肉更有传播男性的承担，男性的魅力，反派一号把狡诈，阴险和贪婪演的很投入，让观众可以更加带入其中的氛围，带入情绪，融入电影的情节，电影也讽刺了美国退伍军人的待遇问题和持枪问题，反映出了资本社会的黑暗，杰森斯坦森也表演出了对于儿子的爱，全程虽然台词不多，但是一举一动把心中的愤怒表现得淋漓尽致，很是突出了电影名称。</p>
        </li>
        <li>
            <div>
                <img src="upload/movies/movie1.jpg" alt="头像">
                <div>
                    <p>admin</p>
                    <p>2021-10-19 00:20:44</p>
                </div>
            </div>
            <p>
                很棒，突出了电影名称。</p>
        </li>
        <li>
            <div>
                <img src="upload/movies/movie1.jpg" alt="头像">
                <div>
                    <p>admin</p>
                    <p>2021-10-19 00:20:44</p>
                </div>
            </div>
            <p>
                全程虽然台词不多，但是一举一动把心中的愤怒表现得淋漓尽致，很是突出了电影名称。</p>
        </li>-->
    </ul>
</div>
<!--评论模态框-->
<div class="modal fade" id="addCommentModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">请发表您的评论</h4>
            </div>
            <div class="modal-body">
                <textarea class="form-control" id="comment" name="comment" rows="13" style="min-width: 90%;resize:none;"
                          maxlength="225"></textarea>
                <span class="help-block"></span>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" id="goCommentBtn" class="btn btn-primary">发表</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!--底部 开始-->
<%@include file="common/footer.jsp" %>

<!--底部 结束-->

<script>
    // 重写方法，自定义格式化日期
    Date.prototype.toLocaleString = function () {
        // 补0   例如 2018/7/10 14:7:2  补完后为 2018/07/10 14:07:02
        function addZero(num) {
            if (num < 10)
                return "0" + num;
            return num;
        }

        // 按自定义拼接格式返回
        return this.getFullYear() + "-" + addZero(this.getMonth() + 1) + "-" + addZero(this.getDate()) + " " +
            addZero(this.getHours()) + ":" + addZero(this.getMinutes()) + ":" + addZero(this.getSeconds());
    };

    //展示评论信息
    function showComment(){
        $.ajax({
            url: "comment/findComment",
            data: {
                "movieId":${movie.movieId},
                "pageNum": 1,
                "pageSize": 5
            },
            type: "get",
            success: function (res) {
                $(".pinlun").empty();
                if (res.code === 100) {
                    $.each(res.extend.commentList.list, function (index, item) {
                        // console.log(item)
                        /*
                        <li>
                            <div>
                                <img src="upload/movies/movie1.jpg" alt="头像">
                                <div>
                                    <p>admin</p>
                                    <p>2021-10-19 00:20:44</p>
                                </div>
                            </div>
                            <p>
                                很棒，
                            </p>
                        </li>
                        * */

                        let li = $("<li></li>");
                        let div = $("<div></div>");
                        let img = $("<img alt='头像'>").attr("src", item.user.userHeadimg);
                        let divn = $("<div></div>");
                        let p1 = $("<p></p>").text(item.user.userName);
                        // 根据毫秒数构建 Date 对象
                        let date = new Date(item.commentTime);
                        // 按重写的自定义格式，格式化日期
                        dateTime = date.toLocaleString();
                        let p2 = $("<p></p>").text(dateTime);
                        let p = $("<p></p>").text(item.commentContent);
                        divn.append(p1).append(p2);
                        div.append(img).append(divn);
                        li.append(div).append(p).appendTo(".pinlun");
                    })
                }
            }
        });
    }

    $(function () {
       showComment();
    })

    $(function () {
        $("#addCommentBtn").click(function () {
            $.ajax({
                url: "comment/addCommentBtn",
                type: "get",
                success: function (res) {
                    // console.log(res)
                    if (res.code === 100) {
                        //用户已经登陆
                        //展示评论模态框
                        loginYes(res);
                    } else {
                        //用户未登录，跳转到登陆也页面
                        window.location.href = "view/goLogin"
                    }
                }
            });
        });
    });

    function loginYes(res) {
        //显示模态框
        $('#addCommentModal').modal({
            //点击背景模态框不消失
            backdrop: "static"
        })
    }

    //点击发表按钮
    $(function () {
        $("#goCommentBtn").click(function () {
            if ($("#comment").val().trim() === '') {
                show_msg("#comment", "error", "评论内容不能为空！");
                return false;
            }
            show_msg("#comment", "success", "");
            $.ajax({
                url:"comment/addComment",
                data: {
                    "comment":$("#comment").val().trim(),
                    "movieId":${movie.movieId}
                },
                type:"POST",
                success:function (res) {
                    if (res.code ===100){
                        //关闭模态框
                        $('#addCommentModal').modal('hide');
                        showComment();
                    }else {
                        show_msg("#comment", "error", res.msg);
                    }

                }
            });
        });
    })

    //展示错误信息
    function show_msg(ele, status, msg) {
        //清除校验状态
        $(ele).parent().removeClass("has-success has-error")
        if ("success" == status) {
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);
            return true;
        } else if ("error" == status) {
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
            return false;
        }
    }


</script>
</body>

</html>
