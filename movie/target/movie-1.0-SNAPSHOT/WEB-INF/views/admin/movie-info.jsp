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

    <!-- 内容区域 -->
    <div class="content-wrapper">

        <!-- 内容头部 -->
        <section class="content-header">
            <h1>
                电影管理
                <small>首页</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="management/index"><i class="fa fa-dashboard"></i> 首页</a></li>
            </ol>
        </section>
        <!-- 内容头部 /-->

        <!-- 正文区域 -->
        <section class="content">

            <div class="row">
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="info-box">
                        <span class="info-box-icon bg-aqua"><i class="fa fa-plus"></i></span>

                        <div class="info-box-content">
                            <h3>添加电影</h3>
                            <!--                            <span class="info-box-number">1,410</span>-->
                        </div>
                        <!-- /.info-box-content -->
                    </div>
                    <!-- /.info-box -->
                </div>
            </div>
            <!--添加电影模态窗口-->
            <div class="tab-pane" id="tab-model">
                <div class="modal fade in" id="addMovieModal">
                    <div class="modal-dialog modal-lg" style="top: 0">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">添加电影</h4>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-8">
                                        <div>
                                            <!-- form start -->
                                            <form class="form-horizontal">
                                                <div class="box-body">
                                                    <div class="form-group">
                                                        <label for="movieCnName" class="col-sm-2 control-label">电影名称（中文）</label>
                                                        <div class="col-sm-4">
                                                            <input type="text" name="movieCnName" class="form-control" id="movieCnName">
                                                        </div>
                                                        <label for="movieFgName" class="col-sm-2 control-label">电影名称（外语）</label>
                                                        <div class="col-sm-4">
                                                            <input type="text" name="movieFgName" class="form-control" id="movieFgName">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="movieActor" class="col-sm-2 control-label">演员</label>
                                                        <div class="col-sm-10">
                                                            <input type="text" name="movieActor" class="form-control" id="movieActor">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="movieDirector" class="col-sm-2 control-label">导演</label>
                                                        <div class="col-sm-10">
                                                            <input type="text" name="movieDirector" class="form-control" id="movieDirector">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="movieDetail" class="col-sm-2 control-label">介绍</label>
                                                        <div class="col-sm-10">
                                                            <textarea style="resize:none;" class="form-control" rows="4" name="movieDetail" id="movieDetail"></textarea>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">类型</label>
                                                        <div class="col-sm-2">
                                                            <div class="checkbox">
                                                                <label>
                                                                    <input type="checkbox"> 爱情
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-2">
                                                            <div class="checkbox">
                                                                <label>
                                                                    <input type="checkbox"> 战争
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-2">
                                                            <div class="checkbox">
                                                                <label>
                                                                    <input type="checkbox"> 喜剧
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-2">
                                                            <div class="checkbox">
                                                                <label>
                                                                    <input type="checkbox">动画
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-2">
                                                            <div class="checkbox">
                                                                <label>
                                                                    <input type="checkbox">冒险
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-2 pull-right">
                                                            <div class="checkbox">
                                                                <label>
                                                                    <input type="checkbox"> 爱情
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-2 pull-right">
                                                            <div class="checkbox">
                                                                <label>
                                                                    <input type="checkbox"> 战争
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-2 pull-right">
                                                            <div class="checkbox">
                                                                <label>
                                                                    <input type="checkbox"> 喜剧
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-2 pull-right">
                                                            <div class="checkbox">
                                                                <label>
                                                                    <input type="checkbox">动画
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-2 pull-right">
                                                            <div class="checkbox">
                                                                <label>
                                                                    <input type="checkbox">冒险
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="movieDuration" class="col-sm-2 control-label">时长</label>
                                                        <div class="col-sm-4">
                                                            <input type="text" name="movieDuration" class="form-control" id="movieDuration">
                                                        </div>
                                                        <label for="movieReleasedate" class="col-sm-2 control-label">上映时间</label>
                                                        <div class="col-sm-4">
                                                            <input type="text" name="movieReleasedate" class="form-control" id="movieReleasedate">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="movieCountry" class="col-sm-2 control-label">制片地区</label>
                                                        <div class="col-sm-4">
                                                            <input type="text" name="movieCountry" class="form-control" id="movieCountry">
                                                        </div>
                                                        <label for="movieState" class="col-sm-2 control-label">状态</label>
                                                        <div class="col-sm-4">
                                                            <input type="text" name="movieState" class="form-control" id="movieState">
                                                        </div>
                                                    </div>

                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <!-- Profile Image -->
                                        <div>
                                            <div class="box-body box-profile">
                                                <img id="headimg" style="width: 187px;height: 255px;border-radius: 0px"
                                                     class="profile-user-img img-responsive img-circle" src="${user.userHeadimg}"
                                                     alt="User profile picture">
                                                <p class="text-center" style="color: #000;margin-top: 10px">
                                                    <button id="uploadBtn" class="btn btn-danger">添加电影海报</button>
                                                </p>
                                            </div>
                                            <!-- /.box-body -->
                                        </div>
                                        <!-- /.box -->

                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                <button type="button" class="btn btn-primary">保存</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">电影信息列表</h3>
                </div>

                <div class="box-body">

                    <!-- 数据表格 -->
                    <div class="table-box">

                        <!--工具栏-->
                        <div class="pull-left">
                            <div class="form-group form-inline">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-default" title="删除"
                                            onclick='confirm("你确认要删除吗？")'><i class="fa fa-trash-o"></i> 删除
                                    </button>
                                    <button type="button" class="btn btn-default" title="刷新"
                                            onclick="window.location.reload();"><i class="fa fa-refresh"></i> 刷新
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="box-tools pull-right">
                            <div class="has-feedback">
                                <input type="text" class="form-control input-sm" placeholder="搜索">
                                <span class="glyphicon glyphicon-search form-control-feedback"></span>
                            </div>
                        </div>
                        <!--工具栏/-->

                        <!--数据列表-->
                        <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
                            <thead>
                            <tr>
                                <th class="" style="padding-right:0px;">
                                    <input id="selall" type="checkbox" class="icheckbox_square-blue">
                                </th>
                                <th class="sorting_asc">电影编号</th>
                                <th class="sorting">电影名称</th>
                                <th class="sorting">电影导演</th>
                                <th class="sorting">电影时长</th>
                                <th class="sorting">电影类型</th>
                                <th class="sorting">电影评分</th>
                                <th class="sorting">电影票房</th>
                                <th class="sorting">上映时间</th>
                                <th class="sorting">制片地区</th>
                                <th class="sorting">电影状态</th>
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

<script>
    let pageNum = 1;
    let pageSize = 10;
    //全局定义总记录数,和当前页
    let totalRecord, thisPageNum;
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
        toPage(1, 10);
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
        setSidebarActive("movie-info");
    });

    $(".info-box").click(function () {
        //显示模态框
        $('#addMovieModal').modal({
            //点击背景模态框不消失
            backdrop: "static"
        })
    });


    /*展示电影基本信息*/
    //获取电影信息
    function toPage(pageNum, pageSize) {
        $.ajax({
            url: "management/getAllMovies",
            data: {
                "pageNo": pageNum,
                "pageSize": pageSize
            },
            type: "GET",
            success: function (res) {

                console.log(res);
                //1，展示电影数据
                build_movie_info_table(res);
                //2,解析并显示分页信息
                build_movie_info_info(res);
                //3,解析分页条数据
                build_movie_info_nav(res);

            }
        });
    }

    //显示页码，总页码等
    function build_movie_info_info(res) {
        $("#page_info").empty();
        $("<p></p>").append("当前页：" + res.extend.pageInfo.pageNum + "，总页码：" + res.extend.pageInfo.pages + "，总记录数：" + res.extend.pageInfo.total).appendTo("#page_info");
        totalRecord = res.extend.pageInfo.total;
        thisPageNum = res.extend.pageInfo.pageNum;

    }

    function build_movie_info_table(res) {
        //清空表格
        $("#dataList tbody").empty();

        let users = res.extend.pageInfo.list;
        console.log(res)
        $.each(users, function (index, item) {
            let checkBox = $("<td></td>").append("<input type='checkbox' class='check_item'>");
            let movieId = $("<td></td>").append(item.movieId);
            let movieName = $("<td></td>").append(item.movieCnName);
            let movieDirector = $("<td></td>").append(item.movieDirector);
            let movieDuration = $("<td></td>").append(item.movieDuration);
            let movieType = $("<td></td>").append(item.movieType);
            let movieScore = $("<td></td>").append(item.movieScore);
            let movieBoxoffice = $("<td></td>").append(item.movieBoxoffice);

            // 根据毫秒数构建 Date 对象
            let date = new Date(item.movieReleasedate);
            // 按重写的自定义格式，格式化日期
            dateTime = date.toLocaleString();

            let movieReleasedate = $("<td></td>").append(dateTime);
            let movieCountry = $("<td></td>").append(item.movieCountry);
            let movieState;
            if (item.movieState === 1) {
                movieState = $("<td></td>").append("上映中");
            } else {
                movieState = $("<td></td>").append("已下架");
            }
            /*let editBtn = $("<button></button>")
                .addClass("btn bg-olive btn-xs edit_btn").text("编辑");
            //添加自定义属性，方便员工回显获取id
            editBtn.attr("edit-id", item.movieId);*/
            var deleteBtn = $("<button></button>")
                .css("marginLeft", "20px")
                .addClass("btn bg-red btn-xs delete_btn").text("删除");
            deleteBtn.attr("del-id", item.movieId);
            var queryBtn = $("<button></button>")
                .css("marginLeft", "20px")
                .addClass("btn bg-aqua btn-xs query_btn").text("详情/编辑");
            queryBtn.attr("query-id", item.movieId);

            var edit = $("<td></td>").addClass("text-center").append(deleteBtn).append(queryBtn);
            $("<tr></tr>").append(checkBox)
                .append(movieId)
                .append(movieName)
                .append(movieDirector)
                .append(movieDuration)
                .append(movieType)
                .append(movieScore)
                .append(movieBoxoffice)
                .append(movieReleasedate)
                .append(movieCountry)
                .append(movieState)
                .append(edit).appendTo("#dataList tbody");
        })

    }

    //生成分页按钮
    function build_movie_info_nav(res) {
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
                toPage(pageNum, pageSize);
            });
            prePage.click(function () {
                toPage(res.extend.pageInfo.pageNum - 1, pageSize);
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
                toPage(res.extend.pageInfo.pageNum + 1, pageSize);
            });
            lastLi.click(function () {
                toPage(res.extend.pageInfo.pages, pageSize)
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
                toPage(item, pageSize);
            });
            ul.append(numLi);
        });
        ul.append(nextPage).append(lastLi);
        let nav = $("<nav></nav>").append(ul);
        nav.appendTo("#page_nav");
    }

    //电影详情展示模态窗口
    $(document).on("click", ".query_btn", function () {
        window.location.href = "management/detailMovie?movieId=" + $(this).attr("query-id");
        /*$.ajax({
            url:"management/getMovieByMovieId",
            data: {
                "movieId":$(this).attr("query-id")
            },
            success:function (res) {
                console.log(res)

            }
        });*/

    });


</script>
</body>

</html>
<!---->