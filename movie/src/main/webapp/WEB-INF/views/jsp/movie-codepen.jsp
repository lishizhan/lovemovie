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
    <!-- 引入网页图标 -->
    <link rel="shortcut icon" href="static/images/logo/bitbug_favicon.ico" type="image/x-icon">

    <script src="static/bootstrap/Jquery/jquery.min.js"></script>
    <script src="static/bootstrap/js/bootstrap.min.js"></script>
    <title>love movie</title>
    <style>
        .pagination > li:first-child > a, .pagination > li:first-child > span,
        .pagination > li:last-child > a, .pagination > li:last-child > span {
            margin-left: 0;
            border-radius: 25px;
        }

        .pagination > li > a, .pagination > li > span {
            border-radius: 50%;
        }
        .movie-type [type=radio]{
            display: none;
        }
    </style>
</head>

<body>
<!--页面头部 开始-->
<%--<jsp:include page="common/head.jsp"/>--%>
<%@include file="common/head.jsp" %>
<!--页面头部 结束-->
<form id="classdiy">
    <section class="movie-type w">
        <ul>
            <li>
                <div class="type-item">类型:</div>
                <ul class="type-movie-item type">
                    <li class="movie-type-active">
                        <input type="radio" checked name="typeId" value="0">全部
                    </li>
                    <li><input type="radio" name="typeId" value="1">爱情</li>
                    <li><input type="radio" name="typeId" value="2">惊悚</li>
                    <li><input type="radio" name="typeId" value="3">科幻</li>
                    <li><input type="radio" name="typeId" value="4">动作</li>
                    <li><input type="radio" name="typeId" value="5">悬疑</li>
                    <li><input type="radio" name="typeId" value="6">犯罪</li>
                    <li><input type="radio" name="typeId" value="7">冒险</li>
                    <li><input type="radio" name="typeId" value="8">战争</li>
                    <li><input type="radio" name="typeId" value="9">奇幻</li>
                    <li><input type="radio" name="typeId" value="10">运动</li>
                    <li><input type="radio" name="typeId" value="11">家庭</li>
                    <li><input type="radio" name="typeId" value="12">古装</li>
                    <li><input type="radio" name="typeId" value="13">武侠</li>
                    <li><input type="radio" name="typeId" value="14">其他</li>
                </ul>
            </li>
            <li>
                <div class="type-item">区域:</div>
                <ul class="type-movie-item source">
                    <li class="movie-type-active">
                        <input type="radio" name="sourceId" checked value="0">全部
                    </li>
                    <li><input type="radio" name="sourceId" value="1">大陆</li>
                    <li><input type="radio" name="sourceId" value="2">美国</li>
                    <li><input type="radio" name="sourceId" value="3">韩国</li>
                    <li><input type="radio" name="sourceId" value="4">日本</li>
                    <li><input type="radio" name="sourceId" value="5">中国香港</li>
                    <li><input type="radio" name="sourceId" value="6">中国台湾</li>
                    <li><input type="radio" name="sourceId" value="7">泰国</li>
                    <li><input type="radio" name="sourceId" value="8">印度</li>
                    <li><input type="radio" name="sourceId" value="9">法国</li>
                    <li><input type="radio" name="sourceId" value="10">英国</li>
                    <li><input type="radio" name="sourceId" value="11">俄罗斯</li>
                    <li><input type="radio" name="sourceId" value="12">意大利</li>
                    <li><input type="radio" name="sourceId" value="13">西班牙</li>
                    <li><input type="radio" name="sourceId" value="14">德国</li>
                    <li><input type="radio" name="sourceId" value="15">波兰</li>
                    <li><input type="radio" name="sourceId" value="16">澳大利亚</li>
                    <li><input type="radio" name="sourceId" value="17">伊朗</li>
                    <li><input type="radio" name="sourceId" value="18">其他</li>

                </ul>
            </li>
            <li>
                <div class="type-item">时间:</div>
                <ul class="type-movie-item year">
                    <li class="movie-type-active">
                        <input type="radio" name="yearId" value="0" checked>全部
                    </li>
                    <li><input type="radio" name="yearId" value="1">2021</li>
                    <li><input type="radio" name="yearId" value="2">2020</li>
                    <li><input type="radio" name="yearId" value="3">2019</li>
                    <li><input type="radio" name="yearId" value="4">2018</li>
                    <li><input type="radio" name="yearId" value="5">2017</li>
                    <li><input type="radio" name="yearId" value="6">2016</li>
                    <li><input type="radio" name="yearId" value="7">2015</li>
                    <li><input type="radio" name="yearId" value="8">2014</li>
                    <li><input type="radio" name="yearId" value="9">2013</li>
                    <li><input type="radio" name="yearId" value="10">2012</li>
                    <li><input type="radio" name="yearId" value="11">2011</li>
                    <li><input type="radio" name="yearId" value="12">2000-2010</li>
                    <li><input type="radio" name="yearId" value="13">90年代</li>
                    <li><input type="radio" name="yearId" value="14">80年代</li>
                    <li><input type="radio" name="yearId" value="15">70年代</li>
                    <li><input type="radio" name="yearId" value="16">更早</li>
                </ul>
            </li>
        </ul>
    </section>


<section class="movie-list w">
    <div class="movie-check">
<!--        <form action="#" id="sort">-->
            <ul>
                <li>

                    <input style="outline: none" class="radio_type" type="radio" name="sortId" value="0" id="radio1"
                           checked="checked"/>
                    <label for="radio1">按评分排序</label>
                </li>
                <li>
                    <input style="outline: none" class="radio_type" type="radio" name="sortId" value="1" id="radio2"/>
                    <label for="radio2">按上映时间排序</label>
                </li>
                <!-- <li>
                     <input style="outline: none" class="radio_type" type="radio" name="typeId" value="3" id="radio3"/>
                     <label for="radio3">按热度排序</label>
                 </li>-->
            </ul>
<!--        </form>-->
    </div>
    <hr style="border-color: #999">
    <div class="movie-box clearfix">
        <ul></ul>
    </div>
    <div class="movie-page" id="page_nav" style="text-align: center">
    </div>

</section>
</form>

<!--底部 开始-->
<%@ include file="/WEB-INF/views/jsp/common/footer.jsp" %>
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
        return this.getFullYear() + "-" + addZero(this.getMonth() + 1) + "-" + addZero(this.getDate());
    };


    //种类catId=3&区域sourceId=2&年份yearId=16
    function showMovie(catId, sourceId, yearId) {

    }

    //电影分类查询
    $(function () {
        $(".type li").click(function () {
            $(this).addClass("movie-type-active");
            $(this).siblings("li").removeClass("movie-type-active");
            console.log("typeId>>"+$(this).children().val())
            $(this).children().attr("checked",true);
            $(this).children().siblings("[name=typeId]").attr("checked",false);

            //获取表单信息
            console.log("发送Ajax>>>>")
            toPage(1);
        });
        $(".source li").click(function () {
            $(this).addClass("movie-type-active");
            $(this).siblings("li").removeClass("movie-type-active");
            console.log("sourceId>>"+$(this).children().val())
            $(this).children().attr("checked",true);
            $(this).children().siblings("[name=sourceId]").attr("checked",false);
            //获取表单信息
            console.log("发送Ajax>>>>")
            toPage(1);
        });
        $(".year li").click(function () {
            $(this).addClass("movie-type-active");
            $(this).siblings("li").removeClass("movie-type-active");
            console.log("yearId>>"+$(this).children().val())
            $(this).children().attr("checked",true);
            $(this).children().siblings("[name=yearId]").attr("checked",false);
            //获取表单信息
            console.log("发送Ajax>>>>")
            toPage(1);
        });
        $(".movie-check li").click(function () {
            console.log("sortId>>"+$(this).children("input").val())
            //获取表单信息
            console.log("发送Ajax>>>>")
            toPage(1);
        });

    })

    //电影排序
    $(function () {
        $("#sort input").click(function () {
            console.log($(this).val())
            $.ajax({
                url: "",
                type: "GET",
                success: function (res) {
                    console.log(res)
                }
            });
        });
    })


    //电影信息全部展示
    /*
            <li>
                <a href="#">
                    <p>
                        <span>哥斯拉大战金刚</span>
                        <br>
                        <br>
                        类型: 爱情/喜剧

                        <br>
                        主演:
                        哥斯拉/金刚

                        <br>
                        上映时间: 2021-04-12
                    </p>
                    <img src="static/images/movie/1.jpg" alt="">
                </a>
                <p class="text-center">哥斯拉大战金刚</p>
                <p class="text-center">9.1</p>
            </li>
    * */
    function build_movie_table(res) {

        $(".movie-box ul").empty();

        let moviesList = res.extend.movieList.list;
        $.each(moviesList, function (index, item) {
            let li = $("<li></li>")
            let a = $("<a href='movie/movieDetails?movieId=" + item.movieId + "'></a>")
            let ap = $("<p></p>")
                .append("<span>" + item.movieCnName + "</span>")
                .append("<br>")
                .append("<br>")
                .append("类型: " + item.movieType)
                .append("<br>")
                .append("上映时间: " + item.movieReleasedateStr);
            let img = $("<img src='" + item.moviePicture + "' alt=\"\">")
            let pname = $("<p class=\"text-center\" style=\"overflow: hidden;text-overflow:ellipsis;white-space: nowrap;\">" + item.movieCnName + "</p>");
            let pscore = $("<p class=\"text-center\">" + item.movieScore + "</p>");
            a.append(ap).append(img);
            li.append(a).append(pname).append(pscore);
            li.appendTo($(".movie-box ul"));

        })


    }

    function build_movie_info(res) {

    }

    //生成分页按钮
    function build_movie_nav(res) {
        $("#page_nav").empty();

        var ul = $("<ul></ul>").addClass("pagination pagination-lg");
        var firstLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "JavaScript:;"));
        var prePage = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if (res.extend.movieList.hasPreviousPage == false) {
            firstLi.addClass("disabled");
            prePage.addClass("disabled");
        } else {
            //只有按钮没有禁用的时候才注册事件
            firstLi.click(function () {
                toPage(1);
            });
            prePage.click(function () {
                toPage(res.extend.movieList.pageNum - 1);
            });
        }


        var nextPage = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastLi = $("<li></li>").append($("<a></a>").append("末页").attr("href", "JavaScript:;"));
        if (res.extend.movieList.hasNextPage == false) {
            nextPage.addClass("disabled");
            lastLi.addClass("disabled");
        } else {
            //只有按钮没有禁用的时候才注册事件
            nextPage.click(function () {
                toPage(res.extend.movieList.pageNum + 1);
            });
            lastLi.click(function () {
                toPage(res.extend.movieList.pages)
            });
        }

        ul.append(firstLi).append(prePage);

        //遍历页码
        $.each(res.extend.movieList.navigatepageNums, function (index, item) {
            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if (res.extend.movieList.pageNum == item) {
                numLi.addClass("active");
            }
            numLi.click(function () {
                toPage(item);
            });
            ul.append(numLi);
        });
        ul.append(nextPage).append(lastLi);
        var nav = $("<nav></nav>").append(ul);
        nav.appendTo("#page_nav");
    }

    //获取电影信息
    //pageNum:页码、sortId：排序、typeId：类型、sourceId：区域、yearId：上映年份
    function toPage(pageNum) {
        $('html, body').animate({scrollTop: 0}, 'slow');
        console.log($("#classdiy").serialize())
        let filmParam = $("#classdiy").serialize()+"&"+"pageNum="+pageNum;
        console.log(filmParam);
        $.ajax({
            // url: "movie/findAllTypeMovies",
            url: "movie/movies",
            /*data: {
                "pageNum": pageNum,
                "filmParam":filmParam
            },*/
            // data:$("#classdiy").serialize(),
            data:filmParam,
            type: "get",
            success: function (res) {
                console.log(res)
                /*if (res.code === 100) {
                    //1，展示电影数据
                    build_movie_table(res);
                    //2,解析并显示分页信息
                    build_movie_info(res);
                    //3,解析分页条数据
                    build_movie_nav(res);
                }*/
            }
        });
    }


    $(function () {
        toPage(1);
    })


</script>


</body>
</html>