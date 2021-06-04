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
        .movie-type label{
            color: #fff;
            cursor: pointer;
        }
        label {
            line-height: 20px;
            display: inline-block;
            margin-left: 15px;
            margin-right: 15px;
            color: #777;
        }
        label {
            display: inline-block;
            max-width: 100%;
            /* margin-bottom: 5px; */
            font-weight: 700;
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
                        <label for="type0">全部</label>
                        <input type="radio" checked id="type0" name="typeId" value="0">
                    </li>
                    <li>
                        <label for="type1">爱情</label>
                        <input type="radio" id="type1" name="typeId" value="1">
                    </li>
                    <li>
                        <label for="type2">惊悚</label>
                        <input type="radio" id="type2" name="typeId" value="2">
                    </li>
                    <li>
                        <label for="type3">科幻</label>
                        <input type="radio" id="type3" name="typeId" value="3">
                    </li>
                    <li>
                        <label for="type4">动作</label>
                        <input type="radio" id="type4" name="typeId" value="4">
                    </li>
                    <li>
                        <label for="type5">悬疑</label>
                        <input type="radio" id="type5" name="typeId" value="5">
                    </li>
                    <li>
                        <label for="type6">犯罪</label>
                        <input type="radio" id="type6" name="typeId" value="6">
                    </li>
                    <li>
                        <label for="type7">冒险</label>
                        <input type="radio" id="type7" name="typeId" value="7">
                    </li>
                    <li>
                        <label for="type8">战争</label>
                        <input type="radio" id="type8" name="typeId" value="8">
                    </li>
                    <li>
                        <label for="type9">奇幻</label>
                        <input type="radio" id="type9" name="typeId" value="9">
                    </li>
                    <li>
                        <label for="type10">运动</label>
                        <input type="radio" id="type10" name="typeId" value="10">
                    </li>
                    <li>
                        <label for="type11">家庭</label>
                        <input type="radio" id="type11" name="typeId" value="11">
                    </li>
                    <li>
                        <label for="type12">古装</label>
                        <input type="radio" id="type12" name="typeId" value="12">
                    </li>
                    <li>
                        <label for="type13">武侠</label>
                        <input type="radio" id="type13" name="typeId" value="13">
                    </li>
                    <li>
                        <label for="type14">其他</label>
                        <input type="radio" id="type14" name="typeId" value="14">
                    </li>
                </ul>
            </li>
            <li>
                <div class="type-item">区域:</div>
                <ul class="type-movie-item source">
                    <li class="movie-type-active">
                        <label for="source0">全部</label>
                        <input type="radio" id="source0" name="sourceId" checked value="0">
                    </li>
                    <li><label for="source1">大陆</label><input type="radio" id="source1" name="sourceId" value="1"></li>
                    <li><label for="source2">美国</label><input type="radio" id="source2" name="sourceId" value="2"></li>
                    <li><label for="source3">韩国</label><input type="radio" id="source3" name="sourceId" value="3"></li>
                    <li><label for="source4">日本</label><input type="radio" id="source4" name="sourceId" value="4"></li>
                    <li><label for="source5">中国香港</label><input type="radio" id="source5" name="sourceId" value="5"></li>
                    <li><label for="source6">中国台湾</label><input type="radio" id="source6" name="sourceId" value="6"></li>
                    <li><label for="source7">泰国</label><input type="radio" id="source7" name="sourceId" value="7"></li>
                    <li><label for="source8">印度</label><input type="radio" id="source8" name="sourceId" value="8"></li>
                    <li><label for="source9">法国</label><input type="radio" id="source9" name="sourceId" value="9"></li>
                    <li><label for="source10">英国</label><input type="radio" id="source10" name="sourceId" value="10"></li>
                    <li><label for="source11">俄罗斯</label><input type="radio" id="source11" name="sourceId" value="11"></li>
                    <li><label for="source12">意大利</label><input type="radio" id="source12" name="sourceId" value="12"></li>
                    <li><label for="source13">西班牙</label><input type="radio" id="source13" name="sourceId" value="13"></li>
                    <li><label for="source14">德国</label><input type="radio" id="source14" name="sourceId" value="14"></li>
                    <li><label for="source15">波兰</label><input type="radio" id="source15" name="sourceId" value="15"></li>
                    <li><label for="source16">澳大利亚</label><input type="radio" id="source16" name="sourceId" value="16"></li>
                    <li><label for="source17">伊朗</label><input type="radio" id="source17" name="sourceId" value="17"></li>
                    <li><label for="source18">其他</label><input type="radio" id="source18" name="sourceId" value="18"></li>

                </ul>
            </li>
            <li>
                <div class="type-item">时间:</div>
                <ul class="type-movie-item year">
                    <li class="movie-type-active">
                        <label for="year0">全部</label>
                        <input type="radio" id="year0" name="yearId" value="0" checked>
                    </li>
                    <li><label for="year1">2021</label><input type="radio" id="year1" name="yearId" value="1"></li>
                    <li><label for="year2">2020</label><input type="radio" id="year2" name="yearId" value="2"></li>
                    <li><label for="year3">2019</label><input type="radio" id="year3" name="yearId" value="3"></li>
                    <li><label for="year4">2018</label><input type="radio" id="year4" name="yearId" value="4"></li>
                    <li><label for="year5">2017</label><input type="radio" id="year5" name="yearId" value="5"></li>
                    <li><label for="year6">2016</label><input type="radio" id="year6" name="yearId" value="6"></li>
                    <li><label for="year7">2015</label><input type="radio" id="year7" name="yearId" value="7"></li>
                    <li><label for="year8">2014</label><input type="radio" id="year8" name="yearId" value="8"></li>
                    <li><label for="year9">2013</label><input type="radio" id="year9" name="yearId" value="9"></li>
                    <li><label for="year10">2012</label><input type="radio" id="year10" name="yearId" value="10"></li>
                    <li><label for="year11">2011</label><input type="radio" id="year11" name="yearId" value="11"></li>
                    <li><label for="year12">2000-2010</label><input type="radio" id="year12" name="yearId" value="12"></li>
                    <li><label for="year13">90年代</label><input type="radio" id="year13" name="yearId" value="13"></li>
                    <li><label for="year14">80年代</label><input type="radio" id="year14" name="yearId" value="14"></li>
                    <li><label for="year15">70年代</label><input type="radio" id="year15" name="yearId" value="15"></li>
                    <li><label for="year16">更早</label><input type="radio" id="year16" name="yearId" value="16"></li>
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


    //电影分类查询
    $(function () {
        $(".type li label").click(function () {
            $(this).siblings("input").attr("checked",true);
            $(this).parent().siblings("li").children("[name=typeId]").attr("checked",false);

            $(this).parent().addClass("movie-type-active");
            $(this).parent().siblings("li").removeClass("movie-type-active");
            console.log("typeId>>"+$(this).children().val())

            //获取表单信息
            console.log("发送Ajax>>>>")
            toPage(1);
        });
        $(".source li label").click(function () {
            $(this).siblings("input").attr("checked",true);
            $(this).parent().siblings("li").children("[name=sourceId]").attr("checked",false);

            $(this).parent().addClass("movie-type-active");
            $(this).parent().siblings("li").removeClass("movie-type-active");
            console.log("sourceId>>"+$(this).children().val())
            //获取表单信息
            console.log("发送Ajax>>>>")
            toPage(1);
        });
        $(".year li label").click(function () {


            $(this).siblings("input").attr("checked",true);
            $(this).parent().siblings("li").children("[name=yearId]").attr("checked",false);

            $(this).parent().addClass("movie-type-active");
            $(this).parent().siblings("li").removeClass("movie-type-active");
            //获取表单信息
            console.log("发送Ajax>>>>")
            toPage(1);
        });
        $(".movie-check li").click(function () {
            console.log("sortId>>"+$(this).children("input").val())
            // 获取表单信息
            console.log("发送Ajax>>>>")
            toPage(1);
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
                if (res.code === 100) {
                    //1，展示电影数据
                    build_movie_table(res);
                    //2,解析分页条数据
                    build_movie_nav(res);
                }
            }
        });
    }


    $(function () {
        toPage(1);
    })


</script>


</body>
</html>