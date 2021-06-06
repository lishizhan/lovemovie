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
    <link rel="stylesheet" href="static/css/movie-theatre-list.css">
    <!-- 引入网页图标 -->
    <link rel="shortcut icon" href="static/images/logo/bitbug_favicon.ico" type="image/x-icon">
    <script src="static/bootstrap/Jquery/jquery.min.js"></script>
    <script src="static/bootstrap/js/bootstrap.min.js"></script>
    <style>
        #listActor ul li {
            float: left;
            margin-right: 20px;
            margin-bottom: 10px;
        }

        #listActor ul li img {
            width: 128px;
            height: 170px;
        }

        .cinema {
            height: 260px;
            border: 1px solid #999;
            margin-top: 50px;
        }

        table tr td {
            font-size: 16px;
        }

        table input {
            display: none;
        }

        .cinema-cell .cinema-name {
            display: inline-block;
            font-size: 16px;
            line-height: 18px;
            color: #000;
            margin-bottom: 10px;
        }

        .movie-number-list {
            margin-top: 80px;
        }

        .details-top .movie-img {
            position: absolute;
            left: 0px;
            bottom: -20px;
            height: 190px;
            width: 230px;
            background-color: #fff;
            padding: 5px;
            border-bottom: 3px solid #ec971f;
        }

        .details-top {
            height: 220px;
            width: 100%;
            border-bottom: 2px solid bisque;
            background-color: #2f323e;
        }

        .details-top .movie-title {
            position: absolute;
            left: 270px;
            bottom: 0;
            height: 240px;
            color: #fff;
        }

    </style>
    <title>love movie</title>
</head>

<body style="background-color: #f2f2f2">
<!--页面头部 开始-->
<%@include file="common/head.jsp" %>
<!--页面头部 结束-->

<div class="details-top">
    <div class="container" style="position: relative; height: 230px;">
        <div class="movie-img">
            <img src="static/images/cinema/2.jpg" width="100%" alt="">
        </div>
        <div class="movie-title">
            <h3 style="margin-top: 70px">${cinema.cinemaName}</h3>
            <h5>地址：${cinema.cinemaAddress}</h5>
        </div>

    </div>
</div>

<div class="movie-number-list w">
    <div>
        <h3 style="font-weight: 800">${movie.movieCnName} &nbsp;&nbsp;&nbsp;&nbsp;
            <c:if test="${movie.movieScore != 0.0}">
                <span style="font-size: 28px;font-style:italic;color: #FFB400">${movie.movieScore}</span>
            </c:if>
            <c:if test="${movie.movieScore == 0.0}">
                <span style="font-size: 28px;font-style:italic;color: #FFB400">暂无评分</span>
            </c:if>
        </h3>
        <span style="font-size: 16px">上映日期：${movie.movieReleasedateStr}</span>&nbsp;&nbsp;&nbsp;&nbsp;
        <span style="font-size: 16px">时长：${movie.movieDuration}分钟</span>&nbsp;&nbsp;&nbsp;&nbsp;
        <span style="font-size: 16px">导演：${movie.movieDirector}</span>
    </div>
    <br>
    <br>
    <h4>观影日期：${ft}</h4>

    <table class="table table-striped">
        <thead>
        <tr>
            <th>放映时间</th>
            <th>地区</th>
            <th>放映厅</th>
            <th>售价（元）</th>
            <th>选座购票</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${scheduleList}" var="item">
            <tr>
                <th scope="row">${item.scheduleStarttime}</th>
                <td>${item.scheduleMovie.movieCountry}</td>
                <td>${item.scheduleHall.hallName}</td>
                <td>￥ ${item.schedulePrice} 元</td>
                <td><a class="btn btn-danger" href="order/buyTicketOrder">选坐购票</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>


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


</script>
</body>

</html>
