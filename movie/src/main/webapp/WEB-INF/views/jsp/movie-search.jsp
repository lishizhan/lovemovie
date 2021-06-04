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
    <!-- 引入网页图标 -->
    <link rel="shortcut icon" href="static/images/logo/bitbug_favicon.ico" type="image/x-icon">
    <script src="static/bootstrap/Jquery/jquery.min.js"></script>
    <script src="static/bootstrap/js/bootstrap.min.js"></script>
<!--    <script src="static/js/logout.js"></script>-->
    <title>love movie</title>
</head>

<body>
<!--页面头部 开始-->
<%--<jsp:include page="common/head.jsp"/>--%>
<%@include file="common/head.jsp"%>
<!--页面头部 结束-->
<style>

    .search-res ul li {
        position: relative;
        float: left;
        width: 580px;
        height: 290px;
        background-color: rgb(0, 0, 0, 30%);
        color: white;
        margin: 10px;
        border-radius: 10px;
    }
    .search-res ul li div:first-child{
        display: inline-block;
        width: 182px;
        height: 252px;
        margin: 20px;
        background-color: red;
    }
    .search-res ul li div:last-child{
        position: absolute;
        top: 40px;
        left: 230px;

    }
    .res-score{

        font-weight: 800;
        font-size: 24px;
        font-style: italic;
        color: #ffb409;
    }

</style>
<div class="search-res w clearfix ">

    <c:if test="${empty movieList}">
        <h3>很抱歉，没找到相关的影视剧</h3>
    </c:if>
    <c:if test="${not empty movieList}">
        <ul>
            <c:forEach items="${movieList}" var="item">
                <li>
                    <div>
                        <img src="${item.moviePicture}" alt="">
                    </div>
                    <input type="hidden" id="movieId" name="movieId" value="${item.movieId}">
                    <div>
                        <h2>${item.movieCnName}</h2>
                        <p>${item.movieFgName}</p>
                        <span class="res-score">${item.movieScore}</span>
                        <br>
                        <br>
                        <span>类型：${item.movieType}</span>
                        <br>
                        <span>上映日期：${item.movieReleasedateStr}</span>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </c:if>


</div>


<%@ include file="/WEB-INF/views/jsp/common/footer.jsp" %>

<script>
    $(function () {
        $(document).on("click",".search-res ul li",function () {
            window.location.href="movie/movieDetails?"+'movieId='+$(this).children("input").val();
        })
    })

</script>
</body>

</html>
