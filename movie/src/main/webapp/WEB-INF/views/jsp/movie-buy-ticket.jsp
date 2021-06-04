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
            /*height:260px;*/
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


        /*    */
        .box {
            position: relative;
            background-color: #fff;
            height: 550px;
        }

        .left-box {
            position: absolute;
            left: 150px;
            width: 385px;
        }

        .right-box {
            position: absolute;
            right: 100px;
            margin-left: 10px;
            padding: 15px;
            width: 310px;
            background-color: #fff;
        }

        input[type="checkbox"] {
            margin-bottom: -8px;
            width: 30px;
            height: 26px;
            background: url("static/images/order/seat-white.png");
            -webkit-appearance: none;
            border-radius: 2px;
            outline: none;
        }

        input[type="checkbox"]:checked {
            background: url("static/images/order/seat-green.png") no-repeat center;
            background-size: 100% 100%;
        }

        button {
            border: none;
            color: white;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            border-radius: 20px;
            width: 70%;
            padding: 10px;
            background-color: darkgrey;
        }

        li {
            margin-bottom: 20px;
            list-style: none;
        }

        img {
            width: 100%;
        }

        .center {
            text-align: center;
        }


    </style>
    <title>love movie</title>
</head>

<body style="background-color: #f2f2f2">
<!--页面头部 开始-->
<%@include file="common/head.jsp" %>
<!--页面头部 结束-->


<div class="cinema w">
    <div class="box">
        <div class="left-box">
            <div class="top center" style="margin-top: 20px">
                <span><img src="static/images/order/seat-white.png"
                           style="margin-bottom: -8px; width: 28px;">可选座位</span>
                <span><img src="static/images/order/seat-red.png" style="margin-bottom: -8px;width: 28px;">已售座位</span>
                <span><img src="static/images/order/seat-green.png" style="margin-bottom: -6px;width: 28px;">已选座位</span>
                <p style="margin-top: 20px"><img src="static/images/order/screen.png"></p>
                <p>荧幕中央</p>
            </div>
            <ul style="padding-left: 28px">
                <li>1 <input type="checkbox"><input type="checkbox"><input type="checkbox">
                    <input type="checkbox"><input type="checkbox"><input type="checkbox">
                    <input type="checkbox"><input type="checkbox"><input type="checkbox">
                    <input type="checkbox">
                </li>
                <li>2 <input type="checkbox"><input type="checkbox"><input type="checkbox">
                    <input type="checkbox"><input type="checkbox"><input type="checkbox">
                    <input type="checkbox"><input type="checkbox"><input type="checkbox">
                    <input type="checkbox">
                </li>
                <li>3 <input type="checkbox"><input type="checkbox"><input type="checkbox">
                    <input type="checkbox"><input type="checkbox"><input type="checkbox">
                    <input type="checkbox"><input type="checkbox"><input type="checkbox">
                    <input type="checkbox">
                </li>
                <li>4 <input type="checkbox"><input type="checkbox"><input type="checkbox">
                    <input type="checkbox"><input type="checkbox"><input type="checkbox">
                    <input type="checkbox"><input type="checkbox"><input type="checkbox">
                    <input type="checkbox">
                </li>
                <li>5 <input type="checkbox"><input type="checkbox"><input type="checkbox">
                    <input type="checkbox"><input type="checkbox"><input type="checkbox">
                    <input type="checkbox"><input type="checkbox"><input type="checkbox">
                    <input type="checkbox">
                </li>
                <li>6 <input type="checkbox"><input type="checkbox"><input type="checkbox">
                    <input type="checkbox"><input type="checkbox"><input type="checkbox">
                    <input type="checkbox"><input type="checkbox"><input type="checkbox">
                    <input type="checkbox">
                </li>
                <li>7 <input type="checkbox"><input type="checkbox"><input type="checkbox">
                    <input type="checkbox"><input type="checkbox"><input type="checkbox">
                    <input type="checkbox"><input type="checkbox"><input type="checkbox">
                    <input type="checkbox">
                </li>
            </ul>
        </div>
        <div class="right-box">
            <div>
                <img src="static/images/movie/4.jpg"
                     style="width: 100px;margin-right:10px;float: left;border:3px solid #fff;">
                <h3>片名</h3>
                <p>类型：</p>
                <p>时长：</p>
            </div>
            <div>
                <p>影院：</p>
                <p>影厅：</p>
                <p>版本：</p>
                <p>场次：</p>
                <p>票价：</p>
            </div>
            <div>
                <p>———————————————————————</p>
                <p>座位：一次最多选择六个座位</p>
                <br>
                <p class="center">请点击左侧座位图选择座位</p>
                <br>
                <p>总价：￥</p>
                <p>———————————————————————</p>
            </div>
            <div class="center">
                <p>手机号：</p>
                <button>确认选择</button>
            </div>
        </div>
    </div>
</div>

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
