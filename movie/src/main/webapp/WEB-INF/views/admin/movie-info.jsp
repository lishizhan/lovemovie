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
                <div id="addMovieModal" class="modal modal-default" role="dialog">
<!--                    <div class="modal">-->
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title">Default Modal</h4>
                                </div>
                                <div class="modal-body">
                                    <p>One fine body&hellip;</p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary">Save changes</button>
                                </div>
                            </div>
                            <!-- /.modal-content -->
                        </div>
                        <!-- /.modal-dialog -->
<!--                    </div>-->
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->
            </div>
            <!--模态窗口/-->

            <div class="box box-primary">
                <div class="row">
                    <div class="col-xs-6 col-sm-6 col-md-2">
                        <div class="thumbnail">
                            <img src="static/images/movie/1.jpg" style="height: 220px; width: 185px; display: block;">
                            <div class="caption text-center">
                                <a href="#" class="btn   btn-flat" role="button">修改</a>
                                <a href="#" class="btn  btn-flat" role="button">下架</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-2">
                        <div class="thumbnail">
                            <img src="static/images/movie/1.jpg" style="height: 220px; width: 185px; display: block;">
                            <div class="caption text-center">
                                <a href="#" class="btn   btn-flat" role="button">修改</a>
                                <a href="#" class="btn  btn-flat" role="button">下架</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-2">
                        <div class="thumbnail">
                            <img src="static/images/movie/1.jpg" style="height: 220px; width: 185px; display: block;">
                            <div class="caption text-center">
                                <a href="#" class="btn   btn-flat" role="button">修改</a>
                                <a href="#" class="btn  btn-flat" role="button">下架</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-2">
                        <div class="thumbnail">
                            <img src="static/images/movie/1.jpg" style="height: 220px; width: 185px; display: block;">
                            <div class="caption text-center">
                                <a href="#" class="btn   btn-flat" role="button">修改</a>
                                <a href="#" class="btn  btn-flat" role="button">下架</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-2">
                        <div class="thumbnail">
                            <img src="static/images/movie/1.jpg" style="height: 220px; width: 185px; display: block;">
                            <div class="caption text-center">
                                <a href="#" class="btn   btn-flat" role="button">修改</a>
                                <a href="#" class="btn  btn-flat" role="button">下架</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-2">
                        <div class="thumbnail">
                            <img src="static/images/movie/1.jpg" style="height: 220px; width: 185px; display: block;">
                            <div class="caption text-center">
                                <a href="#" class="btn   btn-flat" role="button">修改</a>
                                <a href="#" class="btn  btn-flat" role="button">下架</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-2">
                        <div class="thumbnail">
                            <img src="static/images/movie/1.jpg" style="height: 220px; width: 185px; display: block;">
                            <div class="caption text-center">
                                <a href="#" class="btn   btn-flat" role="button">修改</a>
                                <a href="#" class="btn  btn-flat" role="button">下架</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-2">
                        <div class="thumbnail">
                            <img src="static/images/movie/1.jpg" style="height: 220px; width: 185px; display: block;">
                            <div class="caption text-center">
                                <a href="#" class="btn   btn-flat" role="button">修改</a>
                                <a href="#" class="btn  btn-flat" role="button">下架</a>
                            </div>
                        </div>
                    </div>

                </div>
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
        setSidebarActive("admin-index");
    });

    $(".info-box").click(function () {
        //显示模态框
        $('#addMovieModal').modal({
            //点击背景模态框不消失
            backdrop: "static"
        })
    });

</script>
</body>

</html>
<!---->