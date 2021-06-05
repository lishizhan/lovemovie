<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>

<!DOCTYPE html>
<html>

<head>
    <base href="<%=basePath%>">
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>电影售票管理</title>
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">

    <%@include file="common/link.jsp" %>
</head>

<body class="hold-transition skin-purple sidebar-mini">

<div class="wrapper">

    <!-- 页面头部 -->
    <%@ include file="common/pageHead.jsp" %>
    <!-- 页面头部 /-->

    <!-- 导航侧栏 -->
    <%@include file="common/sidebar.jsp" %>
    <!-- 导航侧栏 /-->

    <!--添加模态框-->
    <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         style="top: -100px;">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">添加用户</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label for="addName" class="col-sm-2 control-label">用户名</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="userName" id="addName"
                                       placeholder="6-16位的字符">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="addPwd" class="col-sm-2 control-label">密码</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="userPwd" id="addPwd"
                                       placeholder="6-12个字母、数字、下划线">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="addTrue" class="col-sm-2 control-label">确认密码</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="userPwdTrue" id="addTrue"
                                       placeholder="6-12个字母、数字、下划线">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">性别</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <input type="radio" name="userSex" id="addGender1" value="男" checked> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="userSex" id="addGender2" value="女"> 女
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="addEmail" class="col-sm-2 control-label">邮箱</label>
                            <div class="col-sm-10">
                                <input type="email" class="form-control" name="userEmail" id="addEmail"
                                       placeholder="example@qq.com">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="userBirthday" class="col-sm-2 control-label">生日</label>
                            <div class="col-sm-10">
                                <input type="date" class="form-control" name="userBirthday" id="userBirthday">
                                <span class="help-block"></span>
                            </div>
                        </div>

                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" id="saveBtn" class="btn btn-primary">保存</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 内容区域 -->
    <div class="content-wrapper">

        <!-- 内容头部 -->
        <section class="content-header">
            <h1>
                用户管理
                <small>首页</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="management/index"><i class="fa fa-dashboard"></i> 首页</a></li>
            </ol>
        </section>
        <!-- 内容头部 /-->

        <!-- 正文区域 -->
        <section class="content">

            <!-- .box-body -->
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">用户列表</h3>
                </div>

                <div class="box-body">

                    <!-- 数据表格 -->
                    <div class="table-box">

                        <!--工具栏-->
                        <div class="pull-left">
                            <div class="form-group form-inline">
                                <div class="btn-group">
                                    <button id="addUserBtn" type="button" class="btn btn-default" title="新建">
                                        <i class="fa fa-file-o"></i> 新建
                                    </button>
                                    <button type="button" class="btn btn-default" id="delBtn"><i
                                            class="fa fa-trash-o"></i> 删除
                                    </button>
                                    <button type="button" class="btn btn-default" title="刷新"
                                            onclick="window.location.reload();"><i class="fa fa-refresh"></i> 刷新
                                    </button>
                                </div>
                                <div class="input-group input-group-sm">
                                    <input id="searchMsg" type="text" class="form-control">
                                    <span class="input-group-btn"><button id="searchBtn" type="button"
                                                                          class="btn btn-info btn-flat">搜索</button></span>
                                </div>
                            </div>
                        </div>
                        <!--工具栏/-->

                        <!--数据列表-->
                        <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
                            <thead>
                            <tr>
                                <th class="" style="padding-right:0px;">
                                    <input id="check_all" type="checkbox" class="icheckbox_square-blue">
                                </th>
                                <th class="sorting_asc">ID</th>
                                <th class="sorting">用户名/账号</th>
                                <th class="sorting">邮箱</th>
                                <th class="sorting">性别</th>
                                <th class="sorting">生日</th>
                                <th class="text-center">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                        <!--数据列表/-->
                    </div>
                    <!-- 数据表格 /-->
                </div>
                <!-- /.box-body -->

                <!-- .box-footer-->
                <div class="box-footer">
                    <div class="pull-left">
                        <div id="page_info" class="form-group form-inline">
                            <!--                            总共2 页，共14 条数据。-->
                        </div>
                    </div>

                    <div id="page_nav" class="box-tools pull-right">
                    </div>

                </div>
                <!-- /.box-footer-->


            </div>

        </section>
        <!-- 正文区域 /-->

    </div>
    <!-- 内容区域 /-->

    <!-- 底部导航 -->
    <%@ include file="common/footer.jsp" %>
    <!-- 底部导航 /-->

</div>

<%@include file="common/script.jsp" %>

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


    let pageNum = 1;
    let pageSize = 10;
    //全局定义总记录数,和当前页
    let totalRecord, thisPageNum,lastPageNum;

    //搜索名字
    let userName = "";


    $(document).ready(function () {
        // 选择框
        $(".select2").select2();

        // WYSIHTML5编辑器
        $(".textarea").wysihtml5({
            locale: 'zh-CN'
        });
    });


    // 设置激活菜单
    function setSidebarActive(tagUri) {
        var liObj = $("#" + tagUri);
        if (liObj.length > 0) {
            liObj.parent().parent().addClass("active");
            liObj.addClass("active");
        }
    }


    $(document).ready(function () {
        // 激活导航位置
        setSidebarActive("user-info");
    });

    $(function () {
        toPage(pageNum, pageSize, userName);
    })


    //显示页码，总页码等
    function build_user_page_info(res) {
        $("#page_info").empty();
        $("<p></p>").append("当前页：" + res.extend.pageInfo.pageNum + "，总页码：" + res.extend.pageInfo.pages + "，总记录数：" + res.extend.pageInfo.total).appendTo("#page_info");
        totalRecord = res.extend.pageInfo.total;
        thisPageNum = res.extend.pageInfo.pageNum;
        lastPageNum = res.extend.pageInfo.pages;


    }


    function build_user_info_table(res) {
        //清空表格
        $("#dataList tbody").empty();

        let users = res.extend.pageInfo.list;
        $.each(users, function (index, item) {
            /*console.log(item);
            console.log(index);*/
            let checkBox = $("<td></td>").append("<input type='checkbox' class='check_item'>");
            let userIdTd = $("<td></td>").append(item.userId);
            let userName = $("<td></td>").append(item.userName);
            let userEmail = $("<td></td>").append(item.userEmail);
            let userSex = $("<td></td>").append(item.userSexStr);


            let date = new Date(item.userBirthday);
            let time = "";
            if (date.toLocaleString() === "1970-01-01") {
                time = "暂无";
            } else {
                time = date.toLocaleString()
            }
            let userBirthday = $("<td></td>").append(time);
            var deleteBtn = $("<button></button>")
                .css("marginLeft", "20px")
                .addClass("btn bg-red btn-xs delete_btn").text("删除");
            deleteBtn.attr("del-id", item.userId);

            var edit = $("<td></td>").addClass("text-center").append(deleteBtn);
            $("<tr></tr>").append(checkBox)
                .append(userIdTd)
                .append(userName)
                .append(userEmail)
                .append(userSex)
                .append(userBirthday).append(edit).appendTo("#dataList tbody");
        })
    }

    //请求获取用户信息
    function toPage(pageNum, pageSize, userName) {
        $.ajax({
            url: "management/getAllUser",
            data: {
                "pageNo": pageNum,
                "pageSize": pageSize,
                "userName": userName
            },
            type: "GET",
            success: function (res) {

                console.log(res);
                //1，展示用户数据
                build_user_info_table(res);
                //2,解析并显示分页信息
                build_user_page_info(res);
                //3,解析分页条数据
                build_user_nav(res);

            }
        });
    }

    //生成分页按钮
    function build_user_nav(res) {
        $("#page_nav").empty();

        let ul = $("<ul></ul>").addClass("pagination");
        let firstLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "JavaScript:;"));
        let prePage = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if (res.extend.pageInfo.hasPreviousPage == false) {
            firstLi.addClass("disabled");
            prePage.addClass("disabled");
        } else {
            //只有按钮没有禁用的时候才注册事件
            firstLi.click(function () {
                toPage(pageNum, pageSize, userName);
            });
            prePage.click(function () {
                toPage(res.extend.pageInfo.pageNum - 1, pageSize, userName);
            });
        }


        let nextPage = $("<li></li>").append($("<a></a>").append("&raquo;"));
        let lastLi = $("<li></li>").append($("<a></a>").append("末页").attr("href", "JavaScript:;"));
        if (res.extend.pageInfo.hasNextPage == false) {
            nextPage.addClass("disabled");
            lastLi.addClass("disabled");
        } else {
            //只有按钮没有禁用的时候才注册事件
            nextPage.click(function () {
                toPage(res.extend.pageInfo.pageNum + 1, pageSize, userName);
            });
            lastLi.click(function () {
                toPage(res.extend.pageInfo.pages, pageSize, userName)
            });
        }

        ul.append(firstLi).append(prePage);

        //遍历页码
        $.each(res.extend.pageInfo.navigatepageNums, function (index, item) {
            let numLi = $("<li></li>").append($("<a></a>").append(item));
            if (res.extend.pageInfo.pageNum == item) {
                numLi.addClass("active");
            }
            numLi.click(function () {
                toPage(item, pageSize, userName);
            });
            ul.append(numLi);
        });
        ul.append(nextPage).append(lastLi);
        let nav = $("<nav></nav>").append(ul);
        nav.appendTo("#page_nav");
    }

    // ------------------------------------------添加用户-----------------------------------------------------------------------
    function queryUserName() {
        let flag = false;
        let userName = $("[name=userName]").val();
        $.ajax({
            url: "user/checkUserName",
            data: {
                "userName": userName
            },
            type: "POST",
            async: false,
            success: function (res) {
                console.log(res)
                if (res.code !== 100) {
                    // $("#show_msg").text(res.msg);
                    show_msg("[name=userName]", "error", res.msg);
                    flag = false;
                } else {
                    show_msg("[name=userName]", "success", "");
                    flag = true;
                }
            }
        });
        return flag;
    }

    function checkEmail(ele) {
        let userMail = $(ele).val();
        let regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!regEmail.test(userMail)) {
            show_msg(ele, "error", "邮箱格式错误");
            return false;
        }
        show_msg(ele, "success", "");
        return true;
    }

    function checkPwd(ele) {
        let userPwd = $(ele).val();

        let patrn = /^(\w){6,12}$/;
        if (!patrn.exec(userPwd)) {
            show_msg(ele, "error", "密码只能是6-12个字母、数字、下划线");
            return false
        }
        show_msg(ele, "success", "");
        return true
    }

    function checkPwdTrue(oldPwd, newPwd) {
        let userPwd = $(oldPwd).val();
        let userPwdTrue = $(newPwd).val();
        if (userPwd !== userPwdTrue) {
            show_msg(newPwd, "error", "两次密码输入不一致");
            return false;

        }
        show_msg(newPwd, "success", "");
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


    //添加用户
    $("#addUserBtn").click(function () {
        //显示模态框
        $('#addModal').modal({
            //点击背景模态框不消失
            backdrop: "static"
        })

    });

    $("[name=userName]").change(function () {
        console.log($(this).val());
        //判断用户名是否已经存在
        let flag = queryUserName();
        console.log("用户名是否存在？" + flag);

    });
    $("[name=userPwd]").change(function () {
        console.log($(this).val());
        let flag = checkPwd("[name=userPwd]");
        console.log("密码" + flag);

    });
    $("[name=userPwdTrue]").change(function () {
        console.log($(this).val());
        let flag = checkPwd("[name=userPwdTrue]");
        console.log("确认密码" + flag);
    });
    $("[name=userEmail]").change(function () {
        console.log($(this).val());
        let flag = checkEmail("[name=userEmail]");
        console.log("验证邮箱" + flag);
    });

    //点击保存用户
    $("#saveBtn").click(function () {
        console.log("添加用户！！！")
        //验证用户名
        if (!queryUserName()) return false;

        if (!checkPwd("[name=userPwd]")) return false;
        if (!checkPwd("[name=userPwdTrue]")) return false;

        //验证两次密码是否相同
        if (!checkPwdTrue("[name=userPwd]", "[name=userPwdTrue]")) return false;

        //验证邮箱
        if (!checkEmail("[name=userEmail]")) return false;

        console.log($("#addModal form").serialize());

        $.ajax({
            url: "management/addUser",
            data: $("#addModal form").serialize(),
            success: function (res) {
                if (res.code == 100) {
                    //显示模态框
                    $('#addModal').modal("hide");
                    toPage(lastPageNum,pageSize,userName)
                }else {
                    alert("保存失败："+res.msg);
                }
            }
        });

    });


    /*删除和批量*/
    /*点击删除按钮*/
    $(document).on("click", ".delete_btn", function () {
        let id = $(this).parents("tr").find("td:eq(2)").text();
        let userId = $(this).attr("del-id");
        if (confirm("是否删除用户：" + id + "？")) {
            //请求后台删除
            $.ajax({
                url: "management/deleteUser/" + userId,
                type: "delete",
                success: function (res) {
                    console.log(res);
                    if (res.code === 100) {
                        toPage(thisPageNum, pageSize, userName);
                    } else {
                        alert("删除失败：" + res.msg);
                    }
                }
            });
        }
    })
    //删除按钮全选与全不选
    $("#check_all").click(function () {
        //我们这些dom原生的属性; attr获取自定义属性的值;
        // prop修改和读取dom原生属性的值
        $(this).prop("checked");
        $(".check_item").prop("checked", $(this).prop("checked"));
    });
    //为每个checked绑定点击事件
    $(document).on("click", ".check_item", function () {
        //判断选中的个数是否等于item的个数
        let flag = $(".check_item:checked").length == $(".check_item").length;
        $("#check_all").prop("checked", flag);

    });

    //点击批量删除
    $("#delBtn").click(function () {
        if ($(".check_item:checked").length == 0) {
            alert("请选中要删除的的用户！！")
            return false;
        }
        let empNames = "";
        let commentId = "";
        $.each($(".check_item:checked"), function () {
            //获取批量删除的员工姓名
            // console.log($(this).parents("tr").find("td:eq(2)").text());
            empNames += $(this).parents("tr").find("td:eq(2)").text() + ",";
            commentId += $(this).parents("tr").find("td:eq(1)").text() + "-"
        });
        empNames = empNames.substring(0, empNames.length - 1);
        userId = commentId.substring(0, commentId.length - 1);
        if (confirm("是否删除【" + empNames + "】等用户？")) {
            /*console.log(empNames);
            console.log(del_idstr);*/
            //执行Ajax请求删除员工
            $.ajax({
                url: "management/deleteUser/" + userId,
                type: "DELETE",
                success: function (res) {
                    // console.log(res);
                    //回到当前页面
                    $("#check_all").prop("checked", false);
                    toPage(thisPageNum, pageSize, userName);
                }
            });
        } else {
            return false;
        }
    });

    /*评论搜索*/
    $("#searchBtn").click(function () {

        if ($("#searchMsg").val().trim() === '') return false;
        userName = $("#searchMsg").val().trim();
        console.log(userName)
        toPage(1, 10, userName);
    });


</script>
</body>

</html>
<!---->