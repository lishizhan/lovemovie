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
                <a href="management/movieInfo"><i class="fa fa-chevron-circle-left"></i>返回</a>
            </h1>
            <ol class="breadcrumb">
                <li><a href="management/index"><i class="fa fa-dashboard"></i> 首页</a></li>
            </ol>
        </section>
        <!-- 内容头部 /-->

        <!-- 正文区域 -->
        <section class="content">
            <div class="box box-primary">
                <div class="box-body">
                    <section class="content">
                        <div class="box-header with-border">
                            <h3 class="box-title">电影信息</h3>
                        </div>
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
                                                <label for="movieDetail" class="col-sm-2 control-label">详情</label>
                                                <div class="col-sm-10">
                                                    <input type="text" name="movieDetail" class="form-control" id="movieDetail">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="movieDuration" class="col-sm-2 control-label">时长</label>
                                                <div class="col-sm-10">
                                                    <input type="text" name="movieDuration" class="form-control" id="movieDuration">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="movieType" class="col-sm-2 control-label">类型</label>
                                                <div class="col-sm-10">
                                                    <input type="text" name="movieType" class="form-control" id="movieType">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="movieScore" class="col-sm-2 control-label">评分</label>
                                                <div class="col-sm-4">
                                                    <input type="text" name="movieScore" class="form-control" id="movieScore">
                                                </div>
                                                <label for="movieBoxoffice" class="col-sm-2 control-label">票房</label>
                                                <div class="col-sm-4">
                                                    <input type="text" name="movieBoxoffice" class="form-control" id="movieBoxoffice">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="movieCommentcount" class="col-sm-2 control-label">参评人数</label>
                                                <div class="col-sm-4">
                                                    <input type="text" name="movieCommentcount" class="form-control" id="movieCommentcount">
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
                                        <!-- /.box-body -->
                                        <div class="box-footer">
                                            <button type="button" class="btn btn-info">修改</button>
                                        </div>
                                        <!-- /.box-footer -->
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
                                            <button id="uploadBtn" class="btn btn-danger">修改电影海报</button>
                                        </p>
                                    </div>
                                    <!-- /.box-body -->
                                </div>
                                <!-- /.box -->

                            </div>
                        </div>
                    </section>
                </div>
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


    //电影详情展示模态窗口
    /*
        $(document).on("click", ".query_btn", function () {
            //展示模态框
            $('#detailMovieModal').modal({
                //点击背景模态框不消失
                backdrop: "static"
            })
            $.ajax({
                url: "management/getMovieByMovieId",
                data: {
                    "movieId": $(this).attr("query-id")
                },
                success: function (res) {
                    console.log(res)

                }
            });


        });
    */


</script>
</body>

</html>
<!---->