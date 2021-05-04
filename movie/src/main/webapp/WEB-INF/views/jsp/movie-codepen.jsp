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


    <script src="static/bootstrap/Jquery/jquery.min.js"></script>
    <script src="static/bootstrap/js/bootstrap.min.js"></script>
    <title>Title</title>
</head>

<body>
<!--页面头部 开始-->
<jsp:include page="common/head.jsp"/>
<!--页面头部 结束-->

<section class="movie-type w">
    <ul>
        <li>
            <div class="type-item">类型:</div>
            <ul class="type-movie-item">
                <li class="movie-type-active">全部</li>
                <li>爱情</li>
                <li>惊悚</li>
                <li>科幻</li>
                <li>动作</li>
                <li>悬疑</li>
                <li>犯罪</li>
                <li>冒险</li>
                <li>战争</li>
                <li>奇幻</li>
                <li>运动</li>
                <li>家庭</li>
                <li>古装</li>
                <li>武侠</li>
                <li>其他</li>
            </ul>
        </li>
        <li>
            <div class="type-item">区域:</div>
            <ul class="type-movie-item">
                <li class="movie-type-active">全部</li>
                <li>大陆</li>
                <li>美国</li>
                <li>韩国</li>
                <li>日本</li>
                <li>中国香港</li>
                <li>中国台湾</li>
                <li>泰国</li>
                <li>印度</li>
                <li>法国</li>
                <li>英国</li>
                <li>俄罗斯</li>
                <li>意大利</li>
                <li>西班牙</li>
                <li>德国</li>
                <li>波兰</li>
                <li>澳大利亚</li>
                <li>伊朗</li>
                <li>其他</li>

            </ul>
        </li>
        <li>
            <div class="type-item">时间:</div>
            <ul class="type-movie-item">
                <li class="movie-type-active">全部</li>
                <li>2021</li>
                <li>2020</li>
                <li>2019</li>
                <li>2018</li>
                <li>2017</li>
                <li>2016</li>
                <li>2015</li>
                <li>2014</li>
                <li>2013</li>
                <li>2012</li>
                <li>2011</li>
                <li>2000-2010</li>
                <li>90年代</li>
                <li>80年代</li>
                <li>70年代</li>
                <li>更早</li>

            </ul>
        </li>
    </ul>
</section>

<section class="movie-list w">
    <div class="movie-check">
        <form action="#">
            <ul>
                <li>

                    <input style="outline: none" class="radio_type" type="radio" name="type" id="radio1"
                           checked="checked"/>
                    <label for="radio1">按评分排序</label>
                </li>
                <li>
                    <input style="outline: none" class="radio_type" type="radio" name="type" id="radio2"/>
                    <label for="radio2">按时间排序</label>
                </li>
                <li>
                    <input style="outline: none" class="radio_type" type="radio" name="type" id="radio3"/>
                    <label for="radio3">按热度排序</label>
                </li>


            </ul>
        </form>
    </div>
    <hr style="border-color: #999">
    <div class="movie-box clearfix">
        <ul>
            <li>
                <a href="#">
                    <h2 class="center">哥斯拉大战金刚<br>上映时间: 2021</h2>
                    <img src="static/images/movie/1.jpg" alt="">
                </a>
            </li>
            <li>
                <a href="#">
                    <h2 class="center">指环王<br>上映时间: 2021</h2>
                    <img src="static/images/movie/2.png" alt="">
                </a>
            </li>
            <li>
                <a href="#">
                    <h2 class="center">哥斯拉大战金刚<br>上映时间: 2021</h2>
                    <img src="static/images/movie/3.jpg" alt="">
                </a>
            </li>
            <li>
                <a href="#">
                    <h2 class="center">一起走过<br>上映时间: 2021</h2>
                    <img src="static/images/movie/4.jpg" alt="">
                </a>
            </li>
            <li>
                <a href="#">
                    <h2 class="center">哥斯拉大战金刚<br>上映时间: 2021</h2>
                    <img src="static/images/movie/5.jpg" alt="">
                </a>
            </li>
            <li>
                <a href="#">
                    <h2 class="center">哥斯拉大战金刚<br>上映时间: 2021</h2>
                    <img src="static/images/movie/5.jpg" alt="">
                </a>
            </li>
            <li>
                <a href="#">
                    <h2 class="center">哥斯拉大战金刚<br>上映时间: 2021</h2>
                    <img src="static/images/movie/5.jpg" alt="">
                </a>
            </li>
            <li>
                <a href="#">
                    <h2 class="center">哥斯拉大战金刚<br>上映时间: 2021</h2>
                    <img src="static/images/movie/5.jpg" alt="">
                </a>
            </li>
            <li>
                <a href="#">
                    <h2 class="center">哥斯拉大战金刚<br>上映时间: 2021</h2>
                    <img src="static/images/movie/1.jpg" alt="">
                </a>
            </li>
            <li>
                <a href="#">
                    <h2 class="center">指环王<br>上映时间: 2021</h2>
                    <img src="static/images/movie/2.png" alt="">
                </a>
            </li>
            <li>
                <a href="#">
                    <h2 class="center">哥斯拉大战金刚<br>上映时间: 2021</h2>
                    <img src="static/images/movie/3.jpg" alt="">
                </a>
            </li>
            <li>
                <a href="#">
                    <h2 class="center">一起走过<br>上映时间: 2021</h2>
                    <img src="static/images/movie/4.jpg" alt="">
                </a>
            </li>
            <li>
                <a href="#">
                    <h2 class="center">哥斯拉大战金刚<br>上映时间: 2021</h2>
                    <img src="static/images/movie/5.jpg" alt="">
                </a>
            </li>
            <li>
                <a href="#">
                    <h2 class="center">哥斯拉大战金刚<br>上映时间: 2021</h2>
                    <img src="static/images/movie/5.jpg" alt="">
                </a>
            </li>
            <li>
                <a href="#">
                    <h2 class="center">哥斯拉大战金刚<br>上映时间: 2021</h2>
                    <img src="static/images/movie/5.jpg" alt="">
                </a>
            </li>

        </ul>
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


<!--底部 开始-->
<%@ include file="/WEB-INF/views/jsp/common/footer.jsp"%>
<!--底部 结束-->


<script>



</script>


</body>
</html>