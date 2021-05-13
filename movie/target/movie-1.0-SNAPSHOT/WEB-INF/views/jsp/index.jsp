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

    <script src="static/bootstrap/Jquery/jquery.min.js"></script>
    <script src="static/bootstrap/js/bootstrap.min.js"></script>
<!--    <script src="static/js/logout.js"></script>-->
    <title>Title</title>
</head>

<body>
<!--页面头部 开始-->
<%--<jsp:include page="common/head.jsp"/>--%>
<%@include file="common/head.jsp"%>
<!--页面头部 结束-->

<!--轮播图开始-->
<section class="lunbo w">
    <!--轮播图 开始-->
    <section class="section-lunbo">
        <div class="lunbotu">
            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">

                <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <img src="static/images/movie/big1.jpg" alt="...">
                    </div>
                    <div class="item">
                        <img src="static/images/movie/big2.png" alt="...">
                    </div>
                    <div class="item">
                        <img src="static/images/movie/bj3.jpg" alt="...">
                    </div>

                </div>

                <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
    </section>
    <!--轮播图 结束-->
</section>
<!--轮播图结束-->

<!--正在热映开始-->
<section class=" hots w ">
    <div class="hots-pay">
        <div class="hots-pay-top-l"></div>
        <div class="hots-pay-top-r">
            <span>正在热映</span>
            <a href="view/movieCodepen">更多</a>
        </div>
        <div class="hots-movie-content" id="movieList">
            <ul></ul>
        </div>
    </div>
    <div></div>
</section>
<!--正在热映结束-->

<%@ include file="/WEB-INF/views/jsp/common/footer.jsp" %>

<script>

    $(function () {
        $.ajax({
            url:"movie/findAllMovies",
            data:{
                "pageNum":1,
                "pageSize":15
            },
            type:"get",
            success:function (res) {
                $.each(res.extend.movieList.list,function (index,item) {
                    let li = $("<li></li>").attr('movie_id',item.movieId);
                    let img = $("<img alt='图片加载失败'>").attr("src",item.moviePicture);
                    let a = $("<a></a>").text("购票");
                    let p = $("<p></p>");
                    let span = $("<span></span>").text(item.movieCnName);
                    let em = $("<em></em>").text(item.movieScore)
                    p.append(span).append(em);
                    li.append(p).append(img).append(a).appendTo("#movieList ul");
                });
            }
        });

        /*$("#movieList ul li").click(function () {
            window.location.href="view/movieDetails";
        });*/
        $(document).on("click","#movieList ul li",function () {
            window.location.href="movie/movieDetails?"+'movieId='+$(this).attr("movie_id");
        })
    })
    /*
    * <li>
        <p>
            <span>阿凡达</span>
            <em>9.1</em>
        </p>
        <img src="static/images/movie/5.jpg" alt="">
        <a href="#">购票</a>
    </li>
    * */

</script>
</body>

</html>
