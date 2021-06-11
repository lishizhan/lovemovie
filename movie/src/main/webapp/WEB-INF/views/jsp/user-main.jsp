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

    <link rel="stylesheet" href="admin/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="admin/plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="admin/plugins/adminLTE/css/AdminLTE.min.css">
    <link rel="stylesheet" href="admin/plugins/adminLTE/css/skins/_all-skins.min.css">
    <!-- 引入网页图标 -->
    <link rel="shortcut icon" href="static/images/logo/bitbug_favicon.ico" type="image/x-icon">
    <!-- Google Font -->
    <!--    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">-->

    <link rel="stylesheet" href="static/css/base.css">
    <link rel="stylesheet" href="static/css/index.css">
    <link rel="stylesheet" href="static/css/user-main.css">

    <script src="static/bootstrap/Jquery/jquery.min.js"></script>
    <script src="static/bootstrap/js/bootstrap.min.js"></script>

    <!--    <script src="admin/plugins/fastclick/fastclick.js"></script>-->
    <!--    <script src="admin/plugins/adminLTE/js/app.min.js"></script>-->
    <!--    <script src="admin/plugins/adminLTE/js/demo.js"></script>-->

    <link rel="stylesheet" href="static/bootstrap/bootstrap-fileinput/css/fileinput.css">
    <script src="static/bootstrap/bootstrap-fileinput/js/fileinput.min.js"></script>
    <script src="static/bootstrap/bootstrap-fileinput/js/locales/zh.js"></script>

    <script src="static/js/logout.js"></script>
    <style>
        #order .order-title {

            height: 47px;
            width: 100%;
            line-height: 47px;
            background-color: #f4f3f4;
        }

        #order ul li {
            position: relative;
            border: 1px solid #cccccc;
            margin-bottom: 15px;
        }

        .order-column {
            height: 100%;
        }

        .order-de {
            position: absolute;
            top: 50px;
            left: 120px;
        }

        .order-test {
            position: absolute;
            top: 100px;
            right: 84px;

        }
        #order{
            height: 412px;
            overflow-y:auto;max-height:412px;
        }
    </style>

    <title>love movie</title>
</head>

<body style="background-color: #ecf0f5;">
<!--页面头部 开始-->
<%--<jsp:include page="common/head.jsp"/>--%>
<%@include file="common/head.jsp" %>
<!--页面头部 结束-->


<!--个人中心开始-->
<section class="user-main w">

    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            个人中心
        </h1>
    </section>

    <!-- Main content -->
    <section class="content">

        <div class="row">
            <div class="col-md-3">

                <!-- Profile Image -->
                <div class="box box-primary">
                    <div class="box-body box-profile">
                        <img id="headimg" style="width: 150px;height: 150px;"
                             class="profile-user-img img-responsive img-circle" src="${user.userHeadimg}"
                             alt="User profile picture">
                        <p class="text-center" style="color: #000;margin-top: 10px">
                            <button id="uploadBtn" class="btn btn-danger">修改头像</button>
                        </p>

                        <ul class="list-group list-group-unbordered">
                            <li class="list-group-item">
                                <b>用户名：</b>${user.userName}
                            </li>
                            <li class="list-group-item">
                                <b>性别：</b> <span id="usex"></span>
                            </li>
                            <li class="list-group-item">
                                <b>邮箱：</b> <span id="uemail"></span>
                            </li>
                            <li class="list-group-item">
                                <b>生日：</b> <span id="ubirthday"></span>
                            </li>
                            <li class="list-group-item">
                                <b>爱好：</b> <span id="uhobby"></span>
                            </li>
                        </ul>

                        <button id="updateBtn" class="btn btn-primary btn-block"><b>修改信息</b></button>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->

            </div>
            <!-- /.col -->
            <div class="col-md-9">
                <div class="nav-tabs-custom">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#order" data-toggle="tab">我的订单</a></li>
                        <li><a href="#settings" data-toggle="tab">修改密码</a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="order">
                            <ul>


                            </ul>
                        </div>
                        <div class="tab-pane" id="settings">
                            <form class="form-horizontal">
                                <div class="form-group">
                                    <label for="oldPwd" class="col-sm-2 control-label">旧密码</label>

                                    <div class="col-sm-10">
                                        <input type="password" class="form-control" id="oldPwd">
                                        <span class="help-block"></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="newPwd" class="col-sm-2 control-label">新密码</label>

                                    <div class="col-sm-10">
                                        <input type="password" class="form-control" id="newPwd">
                                        <span class="help-block"></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="truePwd" class="col-sm-2 control-label">确认密码</label>
                                    <div class="col-sm-10">
                                        <input type="password" class="form-control" id="truePwd">
                                        <span class="help-block"></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <button type="button" id="updatePwdBtn1" class="btn btn-danger">保存</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <!-- /.tab-pane -->
                    </div>
                    <!-- /.tab-content -->
                </div>
                <!-- /.nav-tabs-custom -->
            </div>
            <!-- /.col -->
        </div>
        <!-- /.row -->

    </section>
    <!-- /.content -->
</section>
<!--信息修改模态框-->
<div class="modal fade" id="updateUserInfoModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">信息修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <input type="hidden" name="userId" value="${user.userId}">
                    <div class="form-group">
                        <label for="userName" class="col-sm-2 control-label">用户名</label>

                        <div class="col-sm-10">
                            <input type="text" readonly class="form-control" disabled="disabled" value="" id="userName">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="userEmail" class="col-sm-2 control-label">邮箱</label>

                        <div class="col-sm-10">
                            <input type="email" name="userEmail" value="" class="form-control" id="userEmail">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>

                        <div class="col-sm-10">
                            <input type="radio" name="userSex" value="1">男
                            <input type="radio" name="userSex" value="0">女
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">爱好</label>

                        <div class="col-sm-10">
                            <input type="checkbox" name="userHobby" value="0">美食
                            <input type="checkbox" name="userHobby" value="1">动漫
                            <input type="checkbox" name="userHobby" value="2">摄影
                            <input type="checkbox" name="userHobby" value="3">电影
                            <input type="checkbox" name="userHobby" value="4">体育
                            <br>
                            <input type="checkbox" name="userHobby" value="5">财经
                            <input type="checkbox" name="userHobby" value="6">音乐
                            <input type="checkbox" name="userHobby" value="7">游戏
                            <input type="checkbox" name="userHobby" value="8">旅游
                            <input type="checkbox" name="userHobby" value="9">科技
                            <br>
                            <input type="checkbox" name="userHobby" value="10">文学
                            <input type="checkbox" name="userHobby" value="11">公益
                            <input type="checkbox" name="userHobby" value="12">汽车
                            <input type="checkbox" name="userHobby" value="13">时尚
                            <input type="checkbox" name="userHobby" value="14">宠物
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="userBirthday" class="col-sm-2 control-label">生日</label>

                        <div class="col-sm-10">
                            <input class="form-control" name="userBirthday" id="userBirthday" type="date">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" id="updateUserInfoBtn" class="btn btn-primary">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!--头像上传-->
<div class="modal fade" id="uploadModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">上传头像</h4>
            </div>
            <div class="modal-body">
                <form id="perForm" class="add_form" enctype="multipart/form-data">
                    <input type="file" class="file-loading" name="upload" id="upload_img_input" multiple/>
                </form>


            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="save()">上传</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<!--个人中心结束-->


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
        return this.getFullYear() + "-" + addZero(this.getMonth() + 1) + "-" + addZero(this.getDate()) + " " +
            addZero(this.getHours()) + ":" + addZero(this.getMinutes()) + ":" + addZero(this.getSeconds());
    };
    /*$(".user").click(function () {
        window.location.href = 'jsp/user-main.html';
    });*/
    $(function () {
        //展示用户信息
        showUserInfo();
        //点击修改按钮
        $("#updateBtn").click(function () {
            //回显示用户信息
            $.ajax({
                url: "user/getUserById",
                data: {
                    "userId":${user.userId}
                },
                type: "POST",
                success: function (res) {
                    console.log(res);
                    //展示修改表单信息
                    $("#userName").val(res.extend.user.userName);
                    $("#userEmail").val(res.extend.user.userEmail);
                    $("input[name=userSex]").val([res.extend.user.userSex]);

                    // 根据毫秒数构建 Date 对象
                    let date = new Date(res.extend.user.userBirthday);
                    // 按重写的自定义格式，格式化日期
                    dateTime = date.toLocaleString();

                    $("#userBirthday").val(dateTime);
                    let str = res.extend.user.userHobby.split("-");
                    $("input[type=checkbox]").each(function (index, item) {
                        // console.log($(this).val());
                        // console.log(index);
                        for (let i = 0; i < str.length; i++) {
                            if (index === parseInt(str[i])) {
                                $(this).prop("checked", true);
                            }
                        }


                    })


                }
            });

            //显示修改模态框
            $('#updateUserInfoModal').modal({
                //点击背景模态框不消失
                backdrop: "static"
            })
        });
        //点击头像上传
        $("#uploadBtn").click(function () {
            //显示头像上传模态框
            $('#uploadModal').modal({
                //点击背景模态框不消失
                backdrop: "static"
            })
        });
    })
    var commId;

    //点击保存按钮
    function save() {
        if ($('#upload_img_input').fileinput("getFilesCount") <= 0) {//获取文件个数
            alert("请上传图片")
            return false;
        }
        var formData = new FormData($('#perForm')[0]);
        $.ajax({
            url: 'user/uploadHeadImg',
            type: 'post',
            dataType: "json",
            cache: false,//上传文件不需要缓存
            data: formData,
            processData: false,//data是FormData对象，不需要对数据进行处理
            contentType: false,
            /* beforeSend: function () {
                 if (!$('#perForm').check()) {
                     return false;
                 }
             },*/
            success: function (result) {
                console.log(result);
                if (result.code === 100) {
                    $("#headimg").attr("src", result.extend.headImg);
                    $('#uploadModal').modal("hide")

                }
                //$('#upload_img_input').fileinput('upload');//出发开始上传文件
                /*if (result.status == 1) {
                    var id = result.data.id;
                    commId = id;
                    $('#upload_img_input').fileinput('upload');//出发开始上传文件
                } else {

                }*/
            }
        });
    }

    // 初始化
    $(document).ready(function () {
        $('#upload_img_input').fileinput({
            language: 'zh',     //设置语言
            dropZoneEnabled: true,      //是否显示拖拽区域
            dropZoneTitle: "上传头像",    //拖拽区域显示文字
            uploadUrl: '',  //上传路径user/uploadHeadImg
            showCaption: false,//是否显示标题
            showUpload: false,//是否显示上传按钮
            allowedFileExtensions: ['jpg', 'png', 'jpeg'],   //指定上传文件类型
            maxFileSize: 2048,   //上传文件最大值，单位kb
            uploadAsync: true,  //异步上传
            maxFileCount: 1,  //上传文件最大个数。
            autoReplace: true,
            showRemove: false,
            fileActionSettings: {
                showUpload: false,
            },
            mainClass: "input-group-lg",
            /*uploadExtraData: function (previewId, index) {
                return {
                    'id': commId
                };
            }*///上传时携带的额外的参数
        }).on("filebatchuploadsuccess", function (event, data) {

            console.log(data);

            /*if (data.response.status == 1) {
                alert('上传成功');
            }*/
        });


    });

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

    //展示用户信息
    function showUserInfo() {
        $.ajax({
            url: "user/getUserById",
            data: {
                "userId":${user.userId}
            },
            type: "POST",
            success: function (res) {
                if (res.code === 100) {
                    $("#headimg").attr("src", res.extend.headImg);
                    $("#usex").text(res.extend.user.userSexStr);
                    $("#uemail").text(res.extend.user.userEmail);

                    // 根据毫秒数构建 Date 对象
                    let date = new Date(res.extend.user.userBirthday);
                    // 按重写的自定义格式，格式化日期
                    dateTime = date.toLocaleString();
                    $("#ubirthday").text(dateTime);
                    $("#uhobby").text(returnHobby(res));
                }
            }
        });
    }

    function returnHobby(res) {
        let hobbyStr = ["美食", "动漫", "摄影", "电影", "体育", "财经", "音乐", "游戏", "旅游", "科技", "文学", "公益", "汽车", "时尚", "宠物"];
        let userHobby = res.extend.user.userHobby.split("-");
        let str = "";
        for (let i = 0; i < userHobby.length; i++) {
            let j = parseInt(userHobby[i]);
            str += hobbyStr[j] + "、";
        }
        return str.substring(0, str.length - 1);
    }


    //修改密码
    let flag = true;
    $("#oldPwd").change(function () {
        checkPwd("#oldPwd");
    })
    $("#newPwd").change(function () {
        if (!checkPwd("#newPwd")) {
            return false;
        }
        if (($("#oldPwd").val() === $("#newPwd").val())) {
            show_msg("#newPwd", "error", "旧密码和新密码不能一致");
            flag = false;
            return false;
        }
        flag = true;
    })
    $("#truePwd").change(function () {

        if (!checkPwd("#truePwd")) {
            return false;
        }

        if (!($("#newPwd").val() === $("#truePwd").val())) {
            console.log("新密码和确认密码不匹配")
            show_msg("#truePwd", "error", "新密码和确认密码不匹配");
            flag = false;
        }
        flag = true;

    })

    $("#updatePwdBtn1").click(function () {
        let oldPwd = $("#oldPwd").val();
        let newPwd = $("#newPwd").val();
        let truePwd = $("#truePwd").val();

        if (oldPwd === "" || newPwd === "" || truePwd === "") {
            alert("请填写信息！！")
            return false;
        }

        if (!flag) {
            return false;
        } else {
            $.ajax({
                url: "user/updatePwd",
                data: {
                    "oldPwd": oldPwd,
                    "newPwd": newPwd,
                    "truePwd": truePwd
                },
                type: 'post',
                dataType: 'json',
                success: function (res) {
                    if (res.code === 100) {
                        alert("修改成功！！！");
                        window.location.href = "view/goLogin"
                    } else {
                        alert("修改失败" + res.msg);
                    }
                }
            });
        }
    });

    function checkPwd(ele) {
        let patrn = /^(\w){6,12}$/;
        if (!patrn.exec($(ele).val())) {
            show_msg(ele, "error", "密码只能是6-12个字母、数字、下划线");
            falg = false;
            return false;
        }
        show_msg(ele, "success", "");
        return true;
    }

    //修改用户信息
    $("#updateUserInfoBtn").click(function () {
        console.log($("#updateUserInfoModal form").serialize())
        //邮箱校验
        if (!checkEmail()) {
            return false;
        }

        $.ajax({
            url: "user/updateUserInfo",
            data: $("#updateUserInfoModal form").serialize(),
            type: "POST",
            success: function (res) {
                console.log(res)
                if (res.code === 100) {
                    $('#updateUserInfoModal').modal("hide");
                    showUserInfo();
                } else {
                    alert("修改失败：" + res.msg);
                }
            }
        });
    });

    function checkEmail() {
        let userMail = $("#userEmail").val();
        let regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!regEmail.test(userMail)) {
            show_msg("#userEmail", "error", "邮箱格式错误");
            return false;
        }
        show_msg("#userEmail", "success", "");
        return true;
    }

    //生成订单列表
    $(function () {
        /*
        * <ul>
            <li>
                <div class="order-title">
                    <span>2020-9-09 13:13:00</span>
                    <span>订单号：124132451324512354</span>
                </div>
                <div class="order-column">
                    <div class="order-img">
                        <img style="width: 100px" src="static/images/movie/1.jpg" alt="">
                    </div>
                    <div class="order-de">
                        <p>追龙</p>
                        <p>广州港撒大噶撒大噶</p>
                        <p>1号厅 5排5座</p>
                        <p>2020-10-1 12:12</p>
                    </div>
                    <div class="order-test">
                        <span style="padding-right: 20px">￥30</span>
                        <button class="btn btn-default">申请退票</button>
                    </div>
                </div>
            </li>
        </ul>
        * */

        $.ajax({
            url:"order/findAllOrderInfoByUser",
            type:"POST",
            success:function (res) {
                console.log(res);
                if (res.code==100){
                    budil_order_list(res);
                }
            }
        });
    })
    function budil_order_list(res) {
        let orderInfoList = res.extend.orderInfoList;

        $.each(orderInfoList,function () {
            let li = $("<li></li>")
            let lidiv1 = $("<div class=\"order-title\"></div>");

            // 根据毫秒数构建 Date 对象
            let date = new Date(this.orderTime);
            // 按重写的自定义格式，格式化日期
            let span2=$("<span style='margin-left: 20px;'>订票时间："+date.toLocaleString()+"</span>")
            let span1=$("<span style='margin-left: 10px;'>订单号："+this.orderId+"</span>")
            lidiv1.append(span1).append(span2);

            let lidiv2 = $("<div class=\"order-column\"></div>");
            let lidiv21=$("<div class=\"order-img\"></div>");
            let img = $("<img style=\"width: 100px\" src="+this.orderSchedule.scheduleMovie.moviePicture+" alt=\"\">");
            lidiv21.append(img);
            let lidiv22=$("<div class=\"order-de\"></div>");
            let p1 = $("<p style='font-size:18px'>"+this.orderSchedule.scheduleMovie.movieCnName+"</p>");
            let p2 = $("<p>"+this.orderSchedule.scheduleHall.hallCinema.cinemaName+"</p>");
            let p3 = $("<p>"+this.orderSchedule.scheduleHall.hallName+"、"+this.orderPosition+"</p>");
            let p4 = $("<p style='color:red;'>场次时间："+this.orderSchedule.scheduleStarttime+"</p>");
            lidiv22.append(p1).append(p2).append(p3).append(p4);

            let lidiv23=$("<div class=\"order-test\"></div>");
            let span231=$("<span style=\"padding-right: 20px\">￥ "+this.orderPrice+"</span>");
            let button=$("<button class=\"btn btn-primary\">申请退票</button>");
            lidiv23.append(span231).append(button);
            lidiv2.append(lidiv21).append(lidiv22).append(lidiv23);
            li.append(lidiv1).append(lidiv2).appendTo("#order ul");
        })
    }
    /*

<li>
    <div class="order-title">
        <span>2020-9-09 13:13:00</span>
        <span>订单号：124132451324512354</span>
    </div>
    <div class="order-column">
        <div class="order-img">
            <img style="width: 100px" src="static/images/movie/1.jpg" alt="">
        </div>
        <div class="order-de">
            <p>追龙</p>
            <p>广州港撒大噶撒大噶</p>
            <p>1号厅 5排5座</p>
            <p>2020-10-1 12:12</p>
        </div>
        <div class="order-test">
            <span style="padding-right: 20px">￥30</span>
            <button class="btn btn-default">申请退票</button>
        </div>
    </div>
</li>
* */

</script>
</body>

</html>
