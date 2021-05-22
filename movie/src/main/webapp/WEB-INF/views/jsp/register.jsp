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
        <form>
            <h2>欢迎注册电影售票系统</h2>
            <!--            <p class="text-success">...</p>-->
            <p class="text-danger" id="show_msg"></p>
            <div>
                <input id="userName" type="text" name="userName" class="form-control" placeholder="请设置用户名">
                <span class="help-block"></span>
            </div>
            <div>
                <input id="userEmail" type="text" name="userEmail" class="form-control" placeholder="邮箱">
                <span class="help-block"></span>
            </div>
            <div>
                <input id="userPwd" type="password" name="userPwd" class="form-control" placeholder="请输入6~12数字字母密码">
                <span class="help-block"></span>
            </div>
            <div>
                <input id="userPwdTrue" type="password" name="userPwdTrue" class="form-control" placeholder="确认密码">
                <span class="help-block"></span>
            </div>
            <div class="verify-code">
                <input id="code" type="text" name="code" class="form-control" placeholder="输入验证码">
                <span class="help-block"></span>
                <a href="JavaScript:;"><img src="verification" width="100%" alt=""></a>

            </div>

            <button type="button" id="btnSubmit" class="btn btn-danger"
                    style="width: 100%;height: 50px;font-size: 18px;">注&nbsp;&nbsp;册
            </button>
            <p class="text-right" style="margin-top: 20px">
                <span>已有账号？</span>
                <a href="view/goLogin">去登陆</a>
            </p>
        </form>

    </div>
    <!-- 登陆成功消息提示框 -->
    <div class="modal fade" id="toLogin" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">注册成功！！</h4>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <a href="view/goLogin" type="button" class="btn btn-primary">登陆</a>
                </div>
            </div>
        </div>
    </div>

    <script>
        var falg = true;
        function queryUserName() {
            let userName = $("#userName").val();
            $.ajax({
                url: "user/checkUserName",
                data: {
                    "userName": userName
                },
                type: "POST",
                success: function (res) {
                    if (res.code !== 100) {
                        // $("#show_msg").text(res.msg);
                        show_msg("#userName", "error", res.msg);
                        falg=false;
                        return false;
                    }
                    falg=true;
                    show_msg("#userName", "success", "");
                    return true;
                }
            });
        }

        function checkEmail() {
            let userMail = $("#userEmail").val();
            let regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
            if (!regEmail.test(userMail)) {
                show_msg("#userEmail", "error", "邮箱格式错误");
                falg=false;
                return false;
            }
            falg=true;
            show_msg("#userEmail", "success", "");
            return true;
        }

        function checkPwd() {
            let userPwd = $("#userPwd").val();

            let patrn = /^(\w){6,12}$/;
            if (!patrn.exec(userPwd)) {
                show_msg("#userPwd", "error", "密码只能是6-12个字母、数字、下划线");
                falg=false;
                return false
            }
            falg=true;
            show_msg("#userPwd", "success", "");
            return true
        }

        function checkPwdTrue() {
            let userPwd = $("#userPwd").val();
            let userPwdTrue = $("#userPwdTrue").val();
            if (userPwd !== userPwdTrue) {
                show_msg("#userPwdTrue", "error", "两次密码输入不一致");
                falg=false;
                return false;

            }
            show_msg("#userPwdTrue", "success", "");
            falg=true;
            return true;
        }

        //展示错误信息
        function show_msg(ele, status, msg) {
            //清除校验状态
            $(ele).parent().removeClass("has-success has-error")
            if ("success" == status) {
                $(ele).parent().addClass("has-success");
                $(ele).next("span").text(msg);
                return true;
            } else if ("error" == status) {
                $(ele).parent().addClass("has-error");
                $(ele).next("span").text(msg);
                return false;
            }
        }

        $(function () {
            $(".verify-code img").click(function () {
                let date = new Date().getTime();
                $(".verify-code img").attr("src", "verification?" + date);
            });
            //鼠标离开判断用户名是否唯一
            $("#userName").change(function () {
                //判断用户名是否唯一
                queryUserName();
            });
            //鼠标离开判断邮箱格式是否合法
            $("#userEmail").change(function () {
                checkEmail();
            })
            $("#userPwd").change(function () {
                checkPwd();
            })
            $("#userPwdTrue").change(function () {
                checkPwdTrue();
            })

            $("#btnSubmit").click(function () {
                console.log("表单校验")
                let userName = $("#userName").val();
                let userMail = $("#userEmail").val();
                let userPwd = $("#userPwd").val();
                let userPwdTrue = $("#userPwdTrue").val();
                let code = $("#code").val();
                if (userName === "" || userMail === "" || userPwd === '' || userPwdTrue === "" || code === '') {
                    alert("请将信息填写完整！！！");
                    return false;
                }

                if (!falg){
                    return false;
                }
                //发送Ajax请求
                $.ajax({
                    url: "user/register",
                    data: $(".box-r form").serialize(),
                    type: "POST",
                    success: function (res) {
                        if (res.code===100){
                            show_msg("#code", "success", "");
                            $("form")[0].reset();
                            $("#toLogin").modal("show");
                        }else if(res.code===300){
                            $("#show_msg").text(res.msg);
                        }else {
                            show_msg("#code", "error", "验证码错误");
                            let date=new Date().getTime();
                            $(".verify-code img").attr("src","verification?"+date);
                        }
                    }
                });

            });
        });

    </script>

</div>


</body>

</html>


