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
    <link rel="stylesheet" href="static/css/login.css">
    <title>登陆</title>
</head>

<body>
<div class="lr-box w">
    <div class="box-l">
        <h3 style="padding-top: 180px; font-size: 54px; color: #fff; font-weight: 800;">爱电影</h3>
        <p style=" font-size: 32px; color: #fff; ">让生活充满乐趣！！！</p>
    </div>
    <div class="box-r">
        <form method="post">
            <h2>欢迎登陆电影售票系统</h2>
            <!--            <p class="text-success">...</p>-->
            <p class="text-danger" id="msg"></p>
            <div>
                <input type="text" name="userName" class="form-control" id="userName" placeholder="用户名">
            </div>
            <div>
                <input type="password" name="userPwd" class="form-control" id="userPwd" placeholder="请输入6~12数字字母密码">
            </div>
            <div class="verify-code">
                <input type="password" name="code" class="form-control"  placeholder="输入验证码">
                <a href="JavaScript:;"><img src="verification" width="100%" alt=""></a>
            </div>
            <button type="button" class="btn btn-danger" style="width: 100%;height: 50px;font-size: 18px;">登 &nbsp;陆</button>
            <p class="text-right" style="margin-top: 20px">
                <span>没有账号？</span>
                <a href="view/goRegister">去注册</a>

            </p>
        </form>
    </div>

</div>

<script src="static/bootstrap/Jquery/jquery.min.js"></script>
<script src="static/bootstrap/js/bootstrap.min.js"></script>
<script>
    $(function () {
        $(".verify-code img").click(function () {
            let date=new Date().getTime();
            $(".verify-code img").attr("src","verification?"+date);
        });


        $("[type=button]").click(function () {
            let userName = $("#userName").val().trim();
            let userPwd = $("#userPwd").val().trim();
            let code = $("[name=code]").val().trim();

            //非空校验
            if (userName==='' || userPwd==='' ||code ===''){
                alert("请输入用户名密码进行登陆！！")
                return false;
            }
            $.ajax({
                url:"user/login",
                data:{
                    "userName":userName,
                    "userPwd":userPwd,
                    "code":code
                },
                type:"POST",
                success:function (res) {
                    console.log(res);
                    //判断用户是否是管理员
                    if (res.code===100 && res.extend.msg==="adminSuccess"){
                        //登陆成功
                        // console.log("登陆成功！！！");
                        window.location.href="management/index";
                        $("#msg").text("");
                        return true ;
                    }else if (res.code===100 && res.extend.msg==="userSuccess"){
                        window.location.href="view/index";
                        $("#msg").text("");
                        return true;
                    }else {
                        //登陆失败
                        $("#msg").text(res.extend.msg);
                        return false;
                    }

                }
            });
        });


    })





</script>



</body>

</html>
