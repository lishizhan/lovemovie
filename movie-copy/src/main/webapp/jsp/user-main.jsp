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
    <link rel="stylesheet" href="static/css/user-main.css">

    <script src="static/bootstrap/Jquery/jquery.min.js"></script>
    <script src="static/bootstrap/js/bootstrap.min.js"></script>
    <script src="static/js/logout.js"></script>
    <title>Title</title>
</head>

<body>
<!--页面头部 开始-->
<jsp:include page="common/head.jsp"/>
<!--页面头部 结束-->

<!--个人中心开始-->
<section class="user-main w">
    <div class="user-box">
        <div class="user-con">
            <h3>个人中心</h3>
            <!-- Nav tabs -->
            <ul class="nav" role="tablist">
                <li role="presentation">
                    <a href="#user-info" aria-controls="user-info" role="tab" data-toggle="tab">基本信息</a>
                </li>
                <li role="presentation">
                    <a href="#movie-cart" aria-controls="movie-cart" role="tab" data-toggle="tab">我的订单</a>
                </li>
                <li role="presentation">
                    <a href="#update-pwd" aria-controls="update-pwd" role="tab" data-toggle="tab">修改密码</a>
                </li>
            </ul>
        </div>
        <div class="user-content">
            <div class="tab-content">

                <div role="tabpanel" class="tab-pane active" id="user-info">
                    <h4>基本信息</h4>
                    <div class="user-info">
                        <form action="#">
                            <table class="table">
                                <tr>
                                    <td>昵称:</td>
                                    <td>
                                        <input class="form-control" type="text">
                                    </td>
                                </tr>
                                <tr>
                                    <td>性别:</td>
                                    <td>
                                        <input  type="radio" name="sex">男
                                        <input type="radio" name="sex">女
                                    </td>
                                </tr>
                                <tr>
                                    <td>生日</td>
                                    <td>
                                        <input class="form-control" type="date">
                                    </td>
                                </tr>
                                <tr>
                                    <td>兴趣</td>
                                    <td>
                                        <input type="checkbox">美食
                                        <input type="checkbox">动漫
                                        <input type="checkbox">摄影
                                        <input type="checkbox">电影
                                        <input type="checkbox">体育
                                        <br>
                                        <input type="checkbox">财经
                                        <input type="checkbox">音乐
                                        <input type="checkbox">游戏
                                        <input type="checkbox">旅游
                                        <input type="checkbox">科技
                                        <br>
                                        <input type="checkbox">文学
                                        <input type="checkbox">公益
                                        <input type="checkbox">汽车
                                        <input type="checkbox">时尚
                                        <input type="checkbox">宠物
                                    </td>
                                </tr>
                                <tr>
                                    <td>个性签名</td>
                                    <td>
                                        <input class="form-control" type="text">
                                    </td>
                                </tr>

                                <tr>
                                    <td>

                                    </td>
                                    <td>
                                        <input class="btn btn-danger" type="submit" value="保存">
                                    </td>
                                </tr>
                            </table>

                        </form>
                    </div>
                    <div class="user-picture ">

                        <a href="#" class="thumbnail">
                            <img data-src="holder.js/100%x180" alt="100%x180"
                                 style="height: 180px; width: 100%; display: block;"
                                 src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iMTcxIiBoZWlnaHQ9IjE4MCIgdmlld0JveD0iMCAwIDE3MSAxODAiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiPjwhLS0KU291cmNlIFVSTDogaG9sZGVyLmpzLzEwMCV4MTgwCkNyZWF0ZWQgd2l0aCBIb2xkZXIuanMgMi42LjAuCkxlYXJuIG1vcmUgYXQgaHR0cDovL2hvbGRlcmpzLmNvbQooYykgMjAxMi0yMDE1IEl2YW4gTWFsb3BpbnNreSAtIGh0dHA6Ly9pbXNreS5jbwotLT48ZGVmcz48c3R5bGUgdHlwZT0idGV4dC9jc3MiPjwhW0NEQVRBWyNob2xkZXJfMTc4ZjgyYzFmZWYgdGV4dCB7IGZpbGw6I0FBQUFBQTtmb250LXdlaWdodDpib2xkO2ZvbnQtZmFtaWx5OkFyaWFsLCBIZWx2ZXRpY2EsIE9wZW4gU2Fucywgc2Fucy1zZXJpZiwgbW9ub3NwYWNlO2ZvbnQtc2l6ZToxMHB0IH0gXV0+PC9zdHlsZT48L2RlZnM+PGcgaWQ9ImhvbGRlcl8xNzhmODJjMWZlZiI+PHJlY3Qgd2lkdGg9IjE3MSIgaGVpZ2h0PSIxODAiIGZpbGw9IiNFRUVFRUUiLz48Zz48dGV4dCB4PSI1OS41NTQ2ODc1IiB5PSI5NC41NjA5Mzc1Ij4xNzF4MTgwPC90ZXh0PjwvZz48L2c+PC9zdmc+"
                                 data-holder-rendered="true">
                        </a>
                        <button type="button" class="btn btn-success">更换头像</button>

                    </div>

                </div>

                <div role="tabpanel" class="tab-pane" id="movie-cart">
                    <h4>我的订单</h4>
                    <div class="panel panel-default">
                        <div class="panel-heading">Panel heading without title</div>
                        <div class="panel-body">
                            Panel content
                        </div>
                    </div>

                </div>
                <div role="tabpanel" id="update-pwd"></div>
            </div>


        </div>
    </div>


</section>


<!--个人中心结束-->


<!--底部 开始-->
<%@ include file="/jsp/common/footer.jsp"%>
<!--底部 结束-->




<script>
    /*$(".user").click(function () {
        window.location.href = 'jsp/user-main.html';
    });*/


</script>
</body>

</html>
