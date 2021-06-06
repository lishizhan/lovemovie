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

<!--<section class="movie-type w">
    <ul>
        <li>
            <div class="type-item">品牌:</div>
            <ul class="type-movie-item">
                <li class="movie-type-active">全部</li>
                <li>金逸影城    </li>
                <li>大地影院    </li>
                <li>万达影城    </li>
                <li>中影国际影城</li>
                <li>完美世界影城</li>
                <li>烽禾影城    </li>
                <li>比高电影城   </li>
                <li>横店影视    </li>
                <li>星美国际影城  </li>
                <li>中影星美国际影城</li>

&lt;!&ndash;                <li>CGV影城</li>&ndash;&gt;
&lt;!&ndash;                <li>英皇ua电影城</li>&ndash;&gt;
&lt;!&ndash;                <li>保利国际影城</li>&ndash;&gt;
&lt;!&ndash;                <li>中影佰纳国际影城</li>&ndash;&gt;
&lt;!&ndash;                <li>新天地影城</li>&ndash;&gt;
&lt;!&ndash;                <li>唯亚影城</li>&ndash;&gt;
&lt;!&ndash;                <li>中环影城</li>&ndash;&gt;
&lt;!&ndash;                <li>卢米埃影城</li>&ndash;&gt;
&lt;!&ndash;                <li>星光影城</li>&ndash;&gt;
&lt;!&ndash;                <li>星汇电影城</li>&ndash;&gt;
&lt;!&ndash;                <li>中影UL城市影院</li>&ndash;&gt;
&lt;!&ndash;                <li>百老汇影城</li>&ndash;&gt;
&lt;!&ndash;                <li>中影星美影城</li>&ndash;&gt;
&lt;!&ndash;                <li>万星国际影城</li>&ndash;&gt;
&lt;!&ndash;                <li>左岸国际影城</li>&ndash;&gt;
&lt;!&ndash;                <li>自由人影城</li>&ndash;&gt;
&lt;!&ndash;                <li>橙天嘉禾影城</li>&ndash;&gt;
&lt;!&ndash;                <li>中瑞国际影城</li>&ndash;&gt;
&lt;!&ndash;                <li>环球国际影城</li>&ndash;&gt;
&lt;!&ndash;                <li>中影数字国际影城</li>&ndash;&gt;
&lt;!&ndash;                <li>太平洋电影城</li>&ndash;&gt;
&lt;!&ndash;                <li>星空影城</li>&ndash;&gt;
                <li>中影南方国际影城</li>
                <li>其他</li>
            </ul>
        </li>
        <li>
            <div class="type-item">行政区域:</div>
            <ul class="type-movie-item">
                <li class="movie-type-active">全部</li>
                <li>地铁附近 </li>
                <li>南海区 </li>
                <li>顺德区 </li>
                <li>禅城区 </li>
                <li>三水区 </li>
                <li>黄岐 </li>
                <li>大沥 </li>
                <li>盐步 </li>
                <li>南庄 </li>
                <li>高明区</li>

            </ul>
        </li>

    </ul>

</section>-->

<!--影院列表开始-->
<section class="movie-theatre-list w">
    <div class="movie-theatre-top">
        <span>影院列表</span>
    </div>

    <div class="cinema-cell">
        <div class="cinema-info">
            <a href="#" class="cinema-name">金逸影城（普君店）</a>
            <p class="cinema-address">地址：禅城区南庄南庄二马路89号吉利购物广场4楼403室</p>
            <div class="cinema-tags">
                <span class="cinema-tags-item">退票</span>
                <span class="cinema-tags-item">改签</span>
            </div>
        </div>

        <div class="buy-btn">
            <a href="#" class="buy-btn-click" >选座购票</a>
        </div>

        <div class="price">
            <span class="price-red">￥</span>
            <span class="price-red">49.90</span>
            <span>起</span>
        </div>
    </div>
    <div class="cinema-cell">
        <div class="cinema-info">
            <a href="#" class="cinema-name">金逸影城（普君店）</a>
            <p class="cinema-address">地址：禅城区南庄南庄二马路89号吉利购物广场4楼403室</p>
            <div class="cinema-tags">
                <span class="cinema-tags-item">退票</span>
                <span class="cinema-tags-item">改签</span>
            </div>
        </div>

        <div class="buy-btn">
            <a href="#" class="buy-btn-click" >选座购票</a>
        </div>

        <div class="price">
            <span class="price-red">￥</span>
            <span class="price-red">49.90</span>
            <span>起</span>
        </div>
    </div>
    <div class="cinema-cell">
        <div class="cinema-info">
            <a href="#" class="cinema-name">金逸影城（普君店）</a>
            <p class="cinema-address">地址：禅城区南庄南庄二马路89号吉利购物广场4楼403室</p>
            <div class="cinema-tags">
                <span class="cinema-tags-item">退票</span>
                <span class="cinema-tags-item">改签</span>
            </div>
        </div>

        <div class="buy-btn">
            <a href="#" class="buy-btn-click" >选座购票</a>
        </div>

        <div class="price">
            <span class="price-red">￥</span>
            <span class="price-red">49.90</span>
            <span>起</span>
        </div>
    </div>
    <div class="cinema-cell">
        <div class="cinema-info">
            <a href="#" class="cinema-name">金逸影城（普君店）</a>
            <p class="cinema-address">地址：禅城区南庄南庄二马路89号吉利购物广场4楼403室</p>
            <div class="cinema-tags">
                <span class="cinema-tags-item">退票</span>
                <span class="cinema-tags-item">改签</span>
            </div>
        </div>

        <div class="buy-btn">
            <a href="#" class="buy-btn-click" >选座购票</a>
        </div>

        <div class="price">
            <span class="price-red">￥</span>
            <span class="price-red">49.90</span>
            <span>起</span>
        </div>
    </div>
    <div class="cinema-cell">
        <div class="cinema-info">
            <a href="#" class="cinema-name">金逸影城（普君店）</a>
            <p class="cinema-address">地址：禅城区南庄南庄二马路89号吉利购物广场4楼403室</p>
            <div class="cinema-tags">
                <span class="cinema-tags-item">退票</span>
                <span class="cinema-tags-item">改签</span>
            </div>
        </div>

        <div class="buy-btn">
            <a href="#" class="buy-btn-click" >选座购票</a>
        </div>

        <div class="price">
            <span class="price-red">￥</span>
            <span class="price-red">49.90</span>
            <span>起</span>
        </div>
    </div>
    <div class="cinema-cell">
        <div class="cinema-info">
            <a href="#" class="cinema-name">金逸影城（普君店）</a>
            <p class="cinema-address">地址：禅城区南庄南庄二马路89号吉利购物广场4楼403室</p>
            <div class="cinema-tags">
                <span class="cinema-tags-item">退票</span>
                <span class="cinema-tags-item">改签</span>
            </div>
        </div>

        <div class="buy-btn">
            <a href="#" class="buy-btn-click" >选座购票</a>
        </div>

        <div class="price">
            <span class="price-red">￥</span>
            <span class="price-red">49.90</span>
            <span>起</span>
        </div>
    </div>
    <div class="movie-page">
        <ul class="paging modal-page">
            <li><a href="#" class="prev">&laquo</a></li>
            <li><a href="#" class="active">1</a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">4</a></li>
            <li><a href="#">5</a></li>
            <li><a href="#">6</a></li>
            <li><a href="#">7</a></li>
            <li><a href="#">8</a></li>
            <li><a href="#">9</a></li>
            <li><a href="#" class="next">&raquo;</a></li>
        </ul>
    </div>

</section>

<!--影院列表结束-->




<!--底部 开始-->
<%@ include file="/WEB-INF/views/jsp/common/footer.jsp"%>

<!--底部 结束-->


<script>



</script>

</body>
</html>