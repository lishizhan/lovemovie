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
            height: 600px;
        }

        .left-box {
            position: absolute;
            left: 150px;
            width: 440px;
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
            <form>


                <ul style="padding-left: 28px">
                    <li>1
                        <input type="checkbox" value="1-1">
                        <input type="checkbox" value="1-2">
                        <input type="checkbox" value="1-3">
                        <input type="checkbox" value="1-4">
                        <input type="checkbox" value="1-5">
                        <input type="checkbox" value="1-6">
                        <input type="checkbox" value="1-7">
                        <input type="checkbox" value="1-8">
                        <input type="checkbox" value="1-9">
                        <input type="checkbox" value="1-10">
                        <input type="checkbox" value="1-11">
                        <input type="checkbox" value="1-12">
                    </li>
                    <li>2
                        <input type="checkbox" value="2-1">
                        <input type="checkbox" value="2-2">
                        <input type="checkbox" value="2-3">
                        <input type="checkbox" value="2-4">
                        <input type="checkbox" value="2-5">
                        <input type="checkbox" value="2-6">
                        <input type="checkbox" value="2-7">
                        <input type="checkbox" value="2-8">
                        <input type="checkbox" value="2-9">
                        <input type="checkbox" value="2-10">
                        <input type="checkbox" value="2-11">
                        <input type="checkbox" value="2-12">
                    </li>
                    <li>3
                        <input type="checkbox" value="3-1">
                        <input type="checkbox" value="3-2">
                        <input type="checkbox" value="3-3">
                        <input type="checkbox" value="3-4">
                        <input type="checkbox" value="3-5">
                        <input type="checkbox" value="3-6">
                        <input type="checkbox" value="3-7">
                        <input type="checkbox" value="3-8">
                        <input type="checkbox" value="3-9">
                        <input type="checkbox" value="3-10">
                        <input type="checkbox" value="3-11">
                        <input type="checkbox" value="3-12">
                    </li>
                    <li>4
                        <input type="checkbox" value="4-1">
                        <input type="checkbox" value="4-2">
                        <input type="checkbox" value="4-3">
                        <input type="checkbox" value="4-4">
                        <input type="checkbox" value="4-5">
                        <input type="checkbox" value="4-6">
                        <input type="checkbox" value="4-7">
                        <input type="checkbox" value="4-8">
                        <input type="checkbox" value="4-9">
                        <input type="checkbox" value="4-10">
                        <input type="checkbox" value="4-11">
                        <input type="checkbox" value="4-12">
                    </li>
                    <li>5
                        <input type="checkbox" value="5-1">
                        <input type="checkbox" value="5-2">
                        <input type="checkbox" value="5-3">
                        <input type="checkbox" value="5-4">
                        <input type="checkbox" value="5-5">
                        <input type="checkbox" value="5-6">
                        <input type="checkbox" value="5-7">
                        <input type="checkbox" value="5-8">
                        <input type="checkbox" value="5-9">
                        <input type="checkbox" value="5-10">
                        <input type="checkbox" value="5-11">
                        <input type="checkbox" value="5-12">
                    </li>
                    <li>6
                        <input type="checkbox" value="6-1">
                        <input type="checkbox" value="6-2">
                        <input type="checkbox" value="6-3">
                        <input type="checkbox" value="6-4">
                        <input type="checkbox" value="6-5">
                        <input type="checkbox" value="6-6">
                        <input type="checkbox" value="6-7">
                        <input type="checkbox" value="6-8">
                        <input type="checkbox" value="6-9">
                        <input type="checkbox" value="6-10">
                        <input type="checkbox" value="6-11">
                        <input type="checkbox" value="6-12">
                    </li>
                    <li>7
                        <input type="checkbox" value="7-1">
                        <input type="checkbox" value="7-2">
                        <input type="checkbox" value="7-3">
                        <input type="checkbox" value="7-4">
                        <input type="checkbox" value="7-5">
                        <input type="checkbox" value="7-6">
                        <input type="checkbox" value="7-7">
                        <input type="checkbox" value="7-8">
                        <input type="checkbox" value="7-9">
                        <input type="checkbox" value="7-10">
                        <input type="checkbox" value="7-11">
                        <input type="checkbox" value="7-12">
                    </li>
                </ul>
            </form>
        </div>
        <div class="right-box">
            <div>
                <img src="${schedule.scheduleMovie.moviePicture}"
                     style="width: 100px;margin-right:10px;float: left;border:3px solid #fff;border: 3px solid #FF7E00 ">
                <h4>${schedule.scheduleMovie.movieCnName}</h4>
                <p>类型：${schedule.scheduleMovie.movieType}</p>
                <p>时长：${schedule.scheduleMovie.movieDuration} 分钟</p>
            </div>
            <br>
            <br>
            <hr>
            <div style="font-weight: 800">
                <p><span style="font-weight: 400">影院：</span>${schedule.scheduleHall.hallCinema.cinemaName}</p>
                <p><span style="font-weight: 400">影厅：</span>${schedule.scheduleHall.hallName}</p>
                <p><span style="font-weight: 400">版本：</span>${schedule.scheduleMovie.movieCountry}</p>
                <p><span style="font-weight: 400">场次：</span>${schedule.scheduleStarttime}</p>
                <p><span style="font-weight: 400">票价：</span>￥ ${schedule.schedulePrice} 元/张 </p>
            </div>
            <div>
                <hr style="padding: 0;margin: 0;">
                <p>座位：一次最多选择3个座位</p>
                <br>
                <div id="ticke">

                </div>
                <br>
                <p>总价：￥</p>
                <hr style="padding: 0;margin: 0;">
            </div>
            <div class="center">
                <p>邮箱：${user.userEmail}</p>
                <button id="trueBtn" class="btn btn-danger">确认选座</button>
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

    $(function () {
        $("form input[type='checkbox']").click(function () {
            if ($("form input[type='checkbox']:checked").length > 3) {
                console.log($(this).prop("checked", false))
                alert("一次最多选择3个座位");
                return false;
            }
            let ticketNum = $(this).val().split('-');
            console.log(ticketNum)
            console.log(ticketNum+"="+$(this).prop("checked"))
            if ($(this).prop("checked")){
                let ticket = $("<span style=\"border: 1px solid red;padding: 6px 12px\"></span>")
                    .append(ticketNum[0] + "排" + ticketNum[1] + "座")
                    .attr("ticket-num",$(this).val());
                ticket.appendTo("#ticke");
            }else {
                $("[ticket-num="+$(this).val()+"]").remove();
            }
        });

        //点击确认选座
        $("#trueBtn").click(function () {
            //循环遍历座位信息
            let seat='';
            $("#ticke span").each(function () {
                seat+=$(this).text()+"-";
            });
            if (seat.length==0){
                alert("请选择座位！！！")
                return false;
            }
            console.log(seat);
            $.ajax({
                url:"order/buyTickets",
                type:"POST",
                data:{
                    "scheduleId":'${schedule.scheduleId}',
                    "seat":seat,
                    "orderPrice":'${schedule.schedulePrice}'
                },
                success:function (res) {
                    if (res.code===100){
                        alert("购票成功~~")
                        window.location.href="user/userMain";
                    }
                }

            });

        });

    })


</script>
</body>

</html>
