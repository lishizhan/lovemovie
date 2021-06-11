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
    <!--    <meta name="viewport"-->
    <!--          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">-->
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="static/css/base.css">
    <link rel="stylesheet" href="static/css/index.css">
    <link rel="stylesheet" href="static/css/movie-codepen.css">
    <link rel="stylesheet" href="static/css/movie-theatre-list.css">
    <!-- 引入网页图标 -->
    <link rel="shortcut icon" href="static/images/logo/bitbug_favicon.ico" type="image/x-icon">
    <script src="static/bootstrap/Jquery/jquery.min.js"></script>
    <script src="static/bootstrap/js/bootstrap.min.js"></script>
    <title>love movie</title>
</head>

<body>
<!--页面头部 开始-->
<%--<jsp:include page="common/head.jsp"/>--%>
<%@include file="common/head.jsp"%>
<!--页面头部 结束-->
<style>
    .movie-top{

    }
    .movie-top img{
        width: 160px;
        height: 220px;

    }
    .movie-top li{
        height: 230px;
        margin-bottom: 30px;

    }
    .movie-top li:hover{
        border-bottom: 1px solid silver;
    }
    .movie-top li>div:nth-child(1) span{
        display: inline-block;
        width: 50px;
        height: 50px;
        text-align: center;
        line-height: 50px;
        background-color:#ef4238 ;
        color: #fff;
        font-size: 18px;
        margin-top: 85px;
    }
    .movie-top li>div{
        float: left;
        margin-right: 30px;
    }
    .movie-top li>div:nth-child(3){
        margin-top: 40px;
        color: #cccccc;
    }
    .movie-top li>div:nth-child(4){
        float: right;
        margin-top: 80px;
        margin-right: 100px;
        font-size: 36px;
        font-style: italic;
        font-weight: 800;
        color: #ffb400;
    }
</style>
<!--影院列表开始-->
<section class="movie-top w clearfix">
    <ul class="clearfix">
    </ul>
</section>

<!--影院列表结束-->




<!--底部 开始-->
<%@ include file="/WEB-INF/views/jsp/common/footer.jsp"%>

<!--底部 结束-->


<script>
    $(function () {
        $.ajax({
            url:"movie/getMovieByScore",
            success:function (res) {
                console.log(res);
                let movieList = res.extend.movieList;
                /*
                *  <li>
                        <div>
                            <span class="glyphicon glyphicon-king"></span>
                        </div>
                        <div>
                            <img src="static/images/movie/5.jpg" alt="">
                        </div>
                        <div>
                            <h3>战狼2</h3>
                            <p>主演：吴京,弗兰克·格里罗,吴刚</p>
                            <p>上映时间：2021-12-12</p>
                        </div>
                        <div><span>9.7</span></div>
                    </li>
                *
                * */
                $.each(movieList,function (index) {
                    let li = $("<li></li>");
                    li.attr('movie_id',this.movieId);
                    let div1 = $("<div></div>");
                    let div1span = "";
                    if (index===0){
                        div1span=$("<span class=\"glyphicon glyphicon-king\"></span>")
                    }else {
                        div1span=$("<span style='background-color:#ffb400;font-size:30px;'>"+(index+1)+"</span>")
                    }
                    div1.append(div1span);
                    let div2 = $("<div></div>")
                    let div2img = $("<img src='"+this.moviePicture+"' alt=\"\">");

                    div2.append(div2img)
                    let div3 = $("<div></div>")
                    let div3h3 = $("<h3>"+this.movieCnName+"</h3>");
                    let div3p= $("<p>导演："+this.movieDirector+"</p>");
                    let div3p2= $("<p>上映时间："+this.movieReleasedateStr+"</p>");
                    div3.append(div3h3).append(div3p).append(div3p2);
                    let div4 = $("<div></div>");
                    let div4span = $("<span>"+this.movieScore+"</span>");
                    div4.append(div4span);
                    li.append(div1).append(div2).append(div3).append(div4).appendTo(".movie-top ul")
                })


            }
        })
        $(document).on("click",".movie-top li",function () {
            window.location.href="movie/movieDetails?"+'movieId='+$(this).attr("movie_id");
        })
    })

</script>

</body>
</html>