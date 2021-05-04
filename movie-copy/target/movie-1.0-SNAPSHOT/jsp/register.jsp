<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<!doctype html>
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="static/css/index.css">
    <link rel="stylesheet" href="static/css/register.css">

    <script src="static/bootstrap/Jquery/jquery.min.js"></script>
    <script src="static/bootstrap/js/bootstrap.min.js"></script>

    <title>注册</title>
</head>

<body>
<div class="lr-box w">
    <div class="box-l">
        <h3 style="padding-top: 180px; font-size: 54px; color: #fff; font-weight: 800;">爱电影</h3>
        <p style=" font-size: 32px; color: #fff; ">让生活充满乐趣！！！</p>
    </div>
    <div class="box-r">
        <form action="user/register">
            <h2>欢迎注册电影售票系统</h2>
            <!--            <p class="text-success">...</p>-->
            <p class="text-danger">用户名已经有小伙伴在用了</p>
            <div>
                <input type="text" name="userName" class="form-control"  placeholder="请设置用户名">
            </div>
            <div>
                <input type="text" name="userEmail" class="form-control"  placeholder="邮箱">
            </div>
            <div>
                <input type="password" name="userPwd" class="form-control"  placeholder="请输入6~12数字字母密码">
            </div>
            <div>
                <input type="password" name="userPwdTrue" class="form-control"  placeholder="确认密码">
            </div>
            <div class="verify-code">
                <input type="text" name="code" class="form-control"  placeholder="输入验证码">
                <a href="#"><img src="verification" width="100%" alt=""></a>
            </div>
            <button type="submit" id="btnSubmit" class="btn btn-danger">注&nbsp;&nbsp;册</button>
            <p class="text-right" style="margin-top: 20px">
                <span>已有账号？</span>
                <a href="jsp/login.jsp">去登陆</a>
            </p>
        </form>


    </div>


    <script >
        $(function () {
            $("#btnSubmit").click(function () {
                //进行表单数据可法校验
                //用户名手机号、邮箱
                //密码
                //确认密码

                return false;
            });
        });




    </script>

</div>


</body>

</html>


