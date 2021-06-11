<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<body style="padding-top: 180px">
<!--页面头部 开始-->
<header class="navbar-fixed-top">
    <div class="header-body w">
        <div class="logo">
            <img src="static/images/logo/logo6.png" alt="" style="height: 72px;width: 210px;">
        </div>
        <div class="search">
            <form action="movie/search" method="post" id="search">
                <input type="text" name="searchName" value="${searchName}" placeholder="搜索您喜欢的电影">
                <button type="submit"></button>
            </form>
        </div>
        <!--        <div class="cart">-->
        <!--            我的购票-->
        <!--        </div>-->
        <c:if test="${empty sessionScope.user}">
            <div class="user-pon">
                <a href="view/goLogin" class="btn btn-danger">登录</a>
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
                <li><a href="view/movieTop" class="nav-active">榜单</a></li>
            </c:if>
            <c:if test="${requestScope.page!=3}">
                <li><a href="view/movieTop">榜单</a></li>
            </c:if>
        </ul>
    </div>
</header>

<!--页面头部 结束-->

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
    $("form").on("click",function(){
        if ($("[name=searchName]").val()===""){
            return false;
        }
        return true;
    })



</script>