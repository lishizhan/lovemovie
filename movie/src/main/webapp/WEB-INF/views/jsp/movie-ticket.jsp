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
            <h5>类型：${movie.movieTypeStr}</h5>
            <h5>上映时间：${movie.movieReleasedateStr}</h5>
            <br>
            <div>
                <button class="btn btn-info"><span class="glyphicon glyphicon-heart"></span> 想看</button>
                <button class="btn btn-info"><span class="glyphicon glyphicon-star"></span> 评分</button>
            </div>
            <c:if test="${movie.movieState==1}">
                <a href="movie/movieDetails?movieId=${movie.movieId}" class="btn btn-info"
                   style="background-color: #df2d2d;padding: 6px 62px;margin-top: 10px">查看更多电影详情</a>
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

<div class="w" style="margin-top: 100px">
    <!--<form action="">
        <table class="table">
            <tr class="movie-time">
                <th scope="row" class="h4">日期：</th>
                <td>今天7月23日</td>
                <td>明天7月24日</td>
            </tr>
            <tr class="movie-brand">
                <th scope="row" class="h4">品牌：</th>
                <td><input type="radio" id="brand0" name="brand" value="0"><label for="brand1">全部 </label></td>
                <td><input type="radio" id="brand1" name="brand" value="1"><label for="brand1">金逸影城 </label></td>
                <td><input type="radio" id="brand2" name="brand" value="2"><label for="brand2">大地影院 </label></td>
                <td><input type="radio" id="brand3" name="brand" value="3"><label for="brand3">万达影城 </label></td>
                <td><input type="radio" id="brand4" name="brand" value="4"><label for="brand4">中影国际影城</label></td>
                <td><input type="radio" id="brand5" name="brand" value="5"><label for="brand5">完美世界影城</label></td>
                <td><input type="radio" id="brand6" name="brand" value="6"><label for="brand6">烽禾影城 </label></td>
                <td><input type="radio" id="brand7" name="brand" value="7"><label for="brand7">比高电影城 </label></td>
                <td><input type="radio" id="brand8" name="brand" value="8"><label for="brand8">横店影视 </label></td>
                <td><input type="radio" id="brand9" name="brand" value="9"><label for="brand9">星美国际影城</label></td>
                <td><input type="radio" id="brand10" name="brand" value="10"><label for="brand9">中影星美国际影城</label></td>
                <td><input type="radio" id="brand11" name="brand" value="11"><label for="brand9">中影南方国际影城</label></td>
                <td><input type="radio" id="brand12" name="brand" value="12"><label for="brand9">其他</label></td>
            </tr>

            <tr class="movie-district">
                <th scope="row" class="h4">行政区域：</th>
                <td><input type="radio" id="district0" name="district" value="0"><label for="district0">全部</label></td>
                <td><input type="radio" id="district1" name="district" value="1"><label for="district1">地铁附近</label>
                </td>
                <td><input type="radio" id="district2" name="district" value="2"><label for="district2">南海区 </label>
                </td>
                <td><input type="radio" id="district3" name="district" value="3"><label for="district3">顺德区 </label>
                </td>
                <td><input type="radio" id="district4" name="district" value="4"><label for="district4">禅城区 </label>
                </td>
                <td><input type="radio" id="district5" name="district" value="5"><label for="district5">三水区 </label>
                </td>
                <td><input type="radio" id="district6" name="district" value="6"><label for="district6">黄岐 </label></td>
                <td><input type="radio" id="district7" name="district" value="7"><label for="district7">大沥 </label></td>
                <td><input type="radio" id="district8" name="district" value="8"><label for="district8">盐步 </label></td>
                <td><input type="radio" id="district9" name="district" value="9"><label for="district9">南庄 </label></td>
                <td><input type="radio" id="district10" name="district" value="10"><label for="district10">高明区</label>
                </td>
            </tr>
            <tr class="movie-hallType">
                <th scope="row" class="h4">特殊厅：</th>
                <td><input type="radio" id="hallType0" name="hallType" value="1"><label for="hallType0">普通厅</label></td>
                <td><input type="radio" id="hallType1" name="hallType" value="2"><label for="hallType1">IMAX厅</label></td>
            </tr>
        </table>
    </form>-->
    <c:if test="${not empty cinemaList}">
        <span class="h3">日期：</span>
        <button class="btn btn-danger">今天：6月6号</button>
        <button class="btn btn-default">明天：6月7号</button>
    </c:if>
</div>

<!--影院列表开始-->
<section class="movie-theatre-list w">
    <div class="movie-theatre-top">
        <span style="color: #1a2226">影院列表</span>
    </div>
    <c:if test="${empty cinemaList}">
        <h4>暂无排片信息~~</h4>
    </c:if>
    <c:forEach items="${cinemaList}" var="item">
        <div class="cinema-cell">
            <div class="cinema-info">
                <a href="#" class="cinema-name">${item.cinemaName}</a>
                <p class="cinema-address">地址：${item.cinemaAddress}</p>
                    <%--<div class="cinema-tags">
                        <span class="cinema-tags-item">退票</span>
                        <span class="cinema-tags-item">改签</span>
                    </div>--%>
            </div>

            <div class="buy-btn">
                <a href="order/chooseSeat?movieId=${movie.movieId}&cinemaId=${item.cinemaId}" class="buy-btn-click">选座购票</a>
            </div>

            <div class="price">
                <span class="price-red">￥</span>
                <span class="price-red">38元</span>
                <span>起</span>
            </div>
        </div>
    </c:forEach>


    <!--<div class="cinema-cell">
        <div class="cinema-info">
            <a href="#" class="cinema-name">金逸影城（普君店）</a>
            <p class="cinema-address">地址：禅城区南庄南庄二马路89号吉利购物广场4楼403室</p>
            <div class="cinema-tags">
                <span class="cinema-tags-item">退票</span>
                <span class="cinema-tags-item">改签</span>
            </div>
        </div>

        <div class="buy-btn">
            <a href="order/chooseSeat" class="buy-btn-click">选座购票</a>
        </div>

        <div class="price">
            <span class="price-red">￥</span>
            <span class="price-red">49.90</span>
            <span>起</span>
        </div>
    </div>-->
</section>

<!--影院列表结束-->


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
