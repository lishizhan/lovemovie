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

<body style="padding-top: 180px">
<!--页面头部 开始-->
<header class="navbar-fixed-top">
    <div class="header-body w">
        <div class="logo">
            <img src="static/images/logo/logo.png" alt="">
        </div>
        <div class="search">
            <form action="#">
                <input type="text" placeholder="搜索您喜欢的电影">
                <button type="submit"></button>
            </form>
        </div>
        <!--        <div class="cart">-->
        <!--            我的购票-->
        <!--        </div>-->
        <c:if test="${empty sessionScope.user}">
            <div class="user-pon">
                <a href="view/goLogin" class="btn btn-danger">登陆</a>
                <a href="view/goRegister" class="btn btn-danger">注册</a>
            </div>
        </c:if>
        <c:if test="${not empty sessionScope.user}">
            <div class="user-pon">
                <button id="logout_btn" class="btn btn-danger">退出账号</button>
            </div>
        </c:if>

        <div class="user">
        </div>
    </div>
    <div id="header_nav" class="header-nav w">
        <ul>
            <c:if test="${requestScope.page==1}">
                <li><a href="view/index" class="nav-active">首页</a></li>
            </c:if>
            <c:if test="${requestScope.page!=1}">
                <li><a href="view/index">首页</a></li>
            </c:if>
            <c:if test="${requestScope.page==2}">
                <li><a href="view/movieCodepen" class="nav-active" >电影</a></li>
            </c:if>
            <c:if test="${requestScope.page!=2}">
                <li><a href="view/movieCodepen">电影</a></li>
            </c:if>
            <c:if test="${requestScope.page==3}">
                <li><a href="view/movieTheatreList" class="nav-active">影院</a></li>
            </c:if>
            <c:if test="${requestScope.page!=3}">
                <li><a href="view/movieTheatreList">影院</a></li>
            </c:if>
        </ul>
    </div>
</header>

<!--页面头部 结束-->
</body>
</html>
<script >
    $(".user").click(function () {
        window.location.href = 'user/userMain';
    });
    $("#logout_btn").click(function () {
        if (confirm("是否退出电影售票系统？")){
            //退出
            $.ajax({
                url:"user/logout",
                type:"GET",
                success:function (res) {
                    console.log(res);
                    //进行页面跳转首页
                    window.location.href="view/index";
                }
            });
        }
    });




</script>