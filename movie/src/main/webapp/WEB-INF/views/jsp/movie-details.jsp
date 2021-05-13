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
    <title>Title</title>
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
        <div>
            <ul>
                <li>
                    <img src="" alt="演员">
                </li>
            </ul>
        </div>
    </div>

</div>
<style>
    .gopinlum {
        position: absolute;
        top: 0;
        right: 0;
        display: inline-block;

    }
</style>
<div class="container movie-pinlun">
    <div class="movie-contro-title">热门评论<a href="" style="float: right" class="btn btn-info right">发表评论</a></div>

    <ul class="pinlun">
        <li>
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
        </li>
    </ul>
</div>

<!--底部 开始-->
<%@include file="common/footer.jsp" %>

<!--底部 结束-->


<script src="static/bootstrap/Jquery/jquery.min.js"></script>
<script src="static/bootstrap/js/bootstrap.min.js"></script>

<script>
    $(".user").click(function () {
        window.location.href = 'user-main.html';
    });


</script>
</body>

</html>
