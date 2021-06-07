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

    <script src="static/bootstrap/Jquery/jquery.min.js"></script>
    <script src="static/bootstrap/js/bootstrap.min.js"></script>

    <!--    <script src="admin/plugins/fastclick/fastclick.js"></script>-->
    <!--    <script src="admin/plugins/adminLTE/js/app.min.js"></script>-->
    <!--    <script src="admin/plugins/adminLTE/js/demo.js"></script>-->

    <link rel="stylesheet" href="static/bootstrap/bootstrap-fileinput/css/fileinput.css">

    <style>
        .thumbnail .caption {
            /*padding: 0px;*/

        }

        #dataList tbody td:nth-child(4) {
            display: inline-block;
            padding-left: 10px;
            width: 100px; /*要显示文字的宽度*/
            text-overflow: ellipsis; /*让截断的文字显示为点点。还有一个值是clip意截断不显示点点*/
            white-space: nowrap; /*让文字不换行*/
            overflow: hidden; /*超出要隐藏*/
        }

        #dataList tbody tr:hover {
            cursor: pointer;
        }

        #actorList img {
            width: 75px;
            height: 100px;
            margin-bottom: 15px;
        }

        #addMovieModal .modal-body {
            height: 575px;
            overflow: auto
        }
        #dataList tbody td:nth-child(4) {
            width: 200px;
        }
        #dataList tbody td:nth-child(7) {
            width: 123px;
        }


    </style>
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
                    <h4 class="modal-title">添加场次</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label for="movieCnName" class="col-sm-2 control-label">电影</label>
                            <div class="col-sm-10">
                                <select class="form-control" name="movieName" id="movieCnName">

                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="cinemaName" class="col-sm-2 control-label">影院</label>
                            <div class="col-sm-10">
                                <select class="form-control selectpicker" name="cinemaName" id="cinemaName">

                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="hallName" class="col-sm-2 control-label">放映厅</label>
                            <div class="col-sm-10">
                                <select class="form-control selectpicker" name="hallName" id="hallName">
                                    <option value="" selected="selected">---请选择影厅---</option>
                                    <option value="1号厅">1号厅</option>
                                    <option value="2号厅">2号厅</option>
                                    <option value="3号厅">3号厅</option>
                                    <option value="IMAX厅">IMAX厅</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="scheduleStartTime" class="col-sm-2 control-label">场次时间</label>
                            <div class="col-sm-10">
                                <input type="datetime-local" class="form-control" name="scheduleStartTime" id="scheduleStartTime">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="schedulePrice" class="col-sm-2 control-label">价格</label>
                            <div class="col-sm-10">
                                <input type="number" class="form-control" name="schedulePrice" id="schedulePrice">
                                <span class="help-block"></span>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" id="saveScheduleBtn" class="btn btn-primary">保存</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 内容区域 -->
    <div class="content-wrapper">

        <!-- 内容头部 -->
        <section class="content-header">
            <h1>
                电影场次管理
                <small>首页</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="management/index"><i class="fa fa-dashboard"></i> 首页</a></li>
            </ol>
        </section>
        <!-- 内容头部 /-->

        <!-- 正文区域 -->
        <section class="content">
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">电影场次信息列表</h3>
                </div>

                <div class="box-body">

                    <!-- 数据表格 -->
                    <div class="table-box">

                        <!--工具栏-->
                        <div class="pull-left">
                            <div class="form-group form-inline">
                                <div class="btn-group">
                                    <button type="button" id="addScheduleModal" class="btn btn-info" ><i
                                            class="fa fa-plus"></i> 添加场次
                                    </button>
                                    <button type="button" id="delBtn" class="btn btn-danger"><i
                                            class="fa fa-trash-o"></i> 删除
                                    </button>
                                    <button type="button" class="btn btn-primary" title="刷新"
                                            onclick="window.location.reload();"><i class="fa fa-refresh"></i> 刷新
                                    </button>
                                </div>
                                <div class="input-group input-group-sm">
                                    <input id="searchMsg" type="text" class="form-control" placeholder="请输入电影名称">
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
                                <th>场次编号</th>
                                <th>影院</th>
                                <th>影院地址</th>
                                <th>影厅</th>
                                <th>电影</th>
                                <th>放映时间</th>
                                <th>价格</th>
                                <th>订单数量</th>
                                <th>剩余票数</th>
                                <th>场次收入</th>
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
                        </div>
                    </div>

                    <div class="box-tools pull-right" id="page_nav">

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

<script src="static/bootstrap/bootstrap-fileinput/js/fileinput.min.js"></script>
<script src="static/bootstrap/bootstrap-fileinput/js/locales/zh.js"></script>
<script>

    let pageNum = 1;
    let pageSize = 10;
    //全局定义总记录数,和当前页
    let totalRecord, thisPageNum;
    //最后一页
    let lastPageNum;

    let movieName="";
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


    $(document).ready(function () {
        // 选择框
        $(".select2").select2();

        // WYSIHTML5编辑器
        $(".textarea").wysihtml5({
            locale: 'zh-CN'
        });
        toPage(1, 10,movieName);
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
        setSidebarActive("schedule-info");
    });


    /*展示电影基本信息*/
    //获取电影信息
    function toPage(pageNum, pageSize,movieName) {
        $.ajax({
            url: "schedule/findAllSchedule",
            data: {
                "pageNum": pageNum,
                "pageSize": pageSize,
                "movieName":movieName
            },
            type: "GET",
            success: function (res) {
                console.log(res);
                //1，展示数据
                build_schedule_info_table(res);
                //2,解析并显示分页信息
                build_schedule_info_info(res);
                //3,解析分页条数据
                build_schedule_info_nav(res);

            }
        });
    }

    //显示页码，总页码等
    function build_schedule_info_info(res) {
        $("#page_info").empty();
        $("<p></p>").append("当前页：" + res.extend.allSchedule.pageNum + "，总页码：" + res.extend.allSchedule.pages + "，总记录数：" + res.extend.allSchedule.total).appendTo("#page_info");
        totalRecord = res.extend.allSchedule.total;
        thisPageNum = res.extend.allSchedule.pageNum;
        lastPageNum = res.extend.allSchedule.pages;

    }

    function build_schedule_info_table(res) {
        //清空表格
        $("#dataList tbody").empty();

        let users = res.extend.allSchedule.list;
        // console.log(res)
        $.each(users, function (index, item) {
            let checkBox = $("<td></td>").append("<input type='checkbox' class='check_item'>");
            let scheduleId = $("<td></td>").append(item.scheduleId);
            let cinemaName = $("<td></td>").append(item.scheduleHall.hallCinema.cinemaName);
            let cinemaAddress = $("<td></td>").append(item.scheduleHall.hallCinema.cinemaAddress);
            let hallName = $("<td></td>").append(item.scheduleHall.hallName);
            let movieCnName = $("<td></td>").append(item.scheduleMovie.movieCnName);
            let scheduleStartTime = $("<td></td>").append(item.scheduleStarttime);
            let schedulePrice = $("<td></td>").append(item.schedulePrice);
            let scheduleRemain = $("<td></td>").append(item.scheduleRemain);
            let orderNum =$("<td></td>").append("暂无");
            let income =$("<td></td>").append("暂无");

            /*let editBtn = $("<button></button>")
                .addClass("btn bg-olive btn-xs edit_btn").text("编辑");
            //添加自定义属性，方便员工回显获取id
            editBtn.attr("edit-id", item.movieId);*/
            let deleteBtn = $("<button></button>")
                .css("marginLeft", "20px")
                .addClass("btn bg-red btn-xs delete_btn").text("删除");
            deleteBtn.attr("del-id", item.scheduleId);
            let queryBtn = $("<button></button>")
                .css("marginLeft", "20px")
                .addClass("btn bg-aqua btn-xs query_btn").text("详情/编辑");
            queryBtn.attr("query-id", item.scheduleId);
            let edit = $("<td></td>").addClass("text-center").append(deleteBtn);//.append(queryBtn)
            $("<tr></tr>").append(checkBox)
                .append(scheduleId)
                .append(cinemaName)
                .append(cinemaAddress)
                .append(hallName)
                .append(movieCnName)
                .append(scheduleStartTime)
                .append(schedulePrice)
                .append(scheduleRemain)
                .append(orderNum)
                .append(income)
                .append(edit).appendTo("#dataList tbody");
        })

    }

    //生成分页按钮
    function build_schedule_info_nav(res) {
        $("#page_nav").empty();

        let ul = $("<ul></ul>").addClass("pagination");
        let firstLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "JavaScript:;"));
        let prePage = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if (res.extend.allSchedule.hasPreviousPage == false) {
            firstLi.addClass("disabled");
            prePage.addClass("disabled");
        } else {
            //只有按钮没有禁用的时候才注册事件
            firstLi.click(function () {
                toPage(pageNum, pageSize,movieName);
            });
            prePage.click(function () {
                toPage(res.extend.allSchedule.pageNum - 1, pageSize,movieName);
            });
        }


        let nextPage = $("<li></li>").append($("<a></a>").append("&raquo;"));
        let lastLi = $("<li></li>").append($("<a></a>").append("末页").attr("href", "JavaScript:;"));
        if (res.extend.allSchedule.hasNextPage == false) {
            nextPage.addClass("disabled");
            lastLi.addClass("disabled");
        } else {
            //只有按钮没有禁用的时候才注册事件
            nextPage.click(function () {
                toPage(res.extend.allSchedule.pageNum + 1, pageSize,movieName);
            });
            lastLi.click(function () {
                toPage(res.extend.allSchedule.pages,pageSize,movieName)
            });
        }

        ul.append(firstLi).append(prePage);

        //遍历页码
        $.each(res.extend.allSchedule.navigatepageNums, function (index, item) {
            let numLi = $("<li></li>").append($("<a></a>").append(item));
            if (res.extend.allSchedule.pageNum == item) {
                numLi.addClass("active");
            }
            numLi.click(function () {
                toPage(item, pageSize,movieName);
            });
            ul.append(numLi);
        });
        ul.append(nextPage).append(lastLi);
        let nav = $("<nav></nav>").append(ul);
        nav.appendTo("#page_nav");
    }

    //跳转电影详情页面
    $(document).on("click", ".query_btn", function () {
        window.location.href = "management/detailMovie?movieId=" + $(this).attr("query-id");

    });
    /*$(document).on("click", "#dataList tbody tr", function () {
        window.location.href = "management/detailMovie?movieId=" + $(this).children("td").eq(1).text();
    });*/




    /*点击删除按钮*/
    $(document).on("click", ".delete_btn", function () {
        let name = $(this).parents("tr").find("td:eq(5)").text();
        let scheduleId = $(this).attr("del-id");
        if (confirm("是否删除电影《" + name + "》的场次？")) {
            //请求后台删除
            $.ajax({
                url: "schedule/deleteSchedule/" + scheduleId,
                type: "delete",
                success: function (res) {
                    console.log(res);
                    if (res.code === 100) {
                        toPage(thisPageNum, pageSize,movieName);
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
            alert("请选中要删除的场次！！")
            return false;
        }
        let empNames = "";
        let scheduleId = "";
        $.each($(".check_item:checked"), function () {
            //获取批量删除的员工姓名
            // console.log($(this).parents("tr").find("td:eq(2)").text());
            empNames += $(this).parents("tr").find("td:eq(5)").text() + ",";
            scheduleId += $(this).parents("tr").find("td:eq(1)").text() + "-"
        });
        empNames = empNames.substring(0, empNames.length - 1);
        scheduleId = scheduleId.substring(0, scheduleId.length - 1);
        if (confirm("是否删除【" + empNames + "】等电影的排片？")) {
            /*console.log(empNames);
            console.log(del_idstr);*/
            //执行Ajax请求删除员工
            $.ajax({
                url: "schedule/deleteSchedule/" + scheduleId,
                type: "DELETE",
                success: function (res) {
                    // console.log(res);
                    //回到当前页面
                    $("#check_all").prop("checked", false);
                    toPage(thisPageNum, pageSize,movieName);
                }
            });
        } else {
            return false;
        }
    });

    /*搜索*/
    $("#searchBtn").click(function () {

        if ($("#searchMsg").val().trim() === '') return false;
        movieName = $("#searchMsg").val().trim();
        console.log(movieName)
        toPage(1, 10, movieName,movieName);
    });


    //添加场次
    //显示添加场次模态框
    $("#addScheduleModal").click(function () {

        //查询所有正在上映的电影, 并显示下拉框
        getMovieName();
        //查询所有的影院，并显示下拉框
        getCinema();
        //显示模态框
        $('#addModal').modal({
            //点击背景模态框不消失
            backdrop: "static"
        })
    });
    //点击添加电影场次
    $("#saveScheduleBtn").click(function () {
        console.log($("#addModal form").serialize())
        console.log($("[name=movieName]").val())
        console.log($("[name=cinemaName]").val())
        console.log($("[name=hallName]").val())
        console.log($("[name=scheduleStartTime]").val())
        console.log($("[name=schedulePrice]").val())
        if ($("[name=movieName]").val().trim()==='' || $("[name=cinemaName]").val().trim()=='' || $("[name=hallName]").val().trim()==='' || $("[name=scheduleStartTime]").val().trim()===''|| $("[name=schedulePrice]").val().trim() ===''){
            alert("请填写完整的电影场次信息！！！");
            return false;
        }
        $.ajax({
            url:"schedule/addSchedule",
            type:"POST",
            data: {
                "movieName":$("[name=movieName]").val(),
                "cinemaName":$("[name=cinemaName]").val(),
                "hallName":$("[name=hallName]").val(),
                "scheduleStartTime":$("[name=scheduleStartTime]").val(),
                "schedulePrice":$("[name=schedulePrice]").val()

            },
            success:function (res) {
                if (res.code===100){
                   //关闭模态框
                    $('#addModal').modal("hide");
                    toPage(lastPageNum,pageSize,movieName);
                }else {
                    alert("添加失败："+res.msg)
                }
            }
        });

    });



    function getMovieName() {
        $.ajax({
            url:"schedule/findAllMovieName",
            type:"GET",
            success:function (res) {
                // console.log(res)
                $("#movieCnName").empty();
                $.each(res.extend.movieList,function (index) {
                    if (index===0){
                        let optionEle = $("<option></option>").append("---请选择电影--").attr("value", "");
                        optionEle.appendTo("#movieCnName");
                    }
                    //this代表当前元素
                    let optionEle = $("<option></option>").append(this.movieCnName).attr("value", this.movieId);
                    optionEle.appendTo("#movieCnName");
                })
            }
        });
    }
    function getCinema() {
        $.ajax({
            url:"schedule/findAllCinemaName",
            type:"GET",
            success:function (res) {
                console.log(res)

                $("#cinemaName").empty();
                $.each(res.extend.cinemaList,function (index) {
                    if (index===0){
                        //<option value="" selected="selected">---请选择影厅---</option>
                        let optionEle = $("<option></option>").append("---请选择影院---").attr("value", "");
                        optionEle.appendTo("#cinemaName");
                    }
                    //this代表当前元素
                    let optionEle = $("<option></option>").append(this.cinemaName).attr("value", this.cinemaId);
                    optionEle.appendTo("#cinemaName");
                })
            }
        });
    }


</script>
</body>

</html>
<!---->