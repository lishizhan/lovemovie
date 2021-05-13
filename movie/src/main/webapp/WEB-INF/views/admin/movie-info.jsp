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
                <div class="modal fade in" id="addMovieModal">
                    <div class="modal-dialog modal-lg" style="top: 0">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">添加电影</h4>
                            </div>
                            <div class="modal-body">
                                <p>One fine body&hellip;</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary">Save changes</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--模态窗口/-->

            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">列表</h3>
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
                                <th class="sorting_asc">ID</th>
                                <th class="sorting">订单编号</th>
                                <th class="sorting">订单名称</th>
                                <th class="sorting">金额</th>
                                <th class="sorting">下单时间</th>
                                <th class="sorting">订单状态</th>

                                <th class="text-center">操作</th>
                            </tr>
                            </thead>
                            <tbody>


                            <tr>
                                <td><input name="ids" type="checkbox"></td>
                                <td>
                                    1
                                </td>
                                <td>71837383</td>
                                <td>北京一日游</td>
                                <td>￥1000</td>
                                <td>2017-03-09 13:51:26</td>
                                <td>已付款(待出行)</td>

                                <td class="text-center">
                                    <button type="button" class="btn bg-olive btn-xs"
                                            onclick='location.href="all-order-manage-edit.html"'>订单
                                    </button>
                                    <button type="button" class="btn bg-olive btn-xs"
                                            onclick='location.href="all-order-manage-edit.html"'>详情
                                    </button>
                                    <button type="button" class="btn bg-olive btn-xs"
                                            onclick='location.href="all-order-manage-edit.html"'>编辑
                                    </button>
                                </td>
                            </tr>


                            <tr>
                                <td><input name="ids" type="checkbox"></td>
                                <td>
                                    2
                                </td>
                                <td>71837383</td>
                                <td>北京一日游</td>
                                <td>￥1000</td>
                                <td>2017-03-09 13:51:26</td>
                                <td>已付款(待出行)</td>

                                <td class="text-center">
                                    <button type="button" class="btn bg-olive btn-xs"
                                            onclick='location.href="all-order-manage-edit.html"'>订单
                                    </button>
                                    <button type="button" class="btn bg-olive btn-xs"
                                            onclick='location.href="all-order-manage-edit.html"'>详情
                                    </button>
                                    <button type="button" class="btn bg-olive btn-xs"
                                            onclick='location.href="all-order-manage-edit.html"'>编辑
                                    </button>
                                </td>
                            </tr>


                            <tr>
                                <td><input name="ids" type="checkbox"></td>
                                <td>
                                    3
                                </td>
                                <td>71837383</td>
                                <td>北京一日游</td>
                                <td>￥1000</td>
                                <td>2017-03-09 13:51:26</td>
                                <td>已付款(待出行)</td>

                                <td class="text-center">
                                    <button type="button" class="btn bg-olive btn-xs"
                                            onclick='location.href="all-order-manage-edit.html"'>订单
                                    </button>
                                    <button type="button" class="btn bg-olive btn-xs"
                                            onclick='location.href="all-order-manage-edit.html"'>详情
                                    </button>
                                    <button type="button" class="btn bg-olive btn-xs"
                                            onclick='location.href="all-order-manage-edit.html"'>编辑
                                    </button>
                                </td>
                            </tr>


                            <tr>
                                <td><input name="ids" type="checkbox"></td>
                                <td>
                                    4
                                </td>
                                <td>71837383</td>
                                <td>北京一日游</td>
                                <td>￥1000</td>
                                <td>2017-03-09 13:51:26</td>
                                <td>已付款(待出行)</td>

                                <td class="text-center">
                                    <button type="button" class="btn bg-olive btn-xs"
                                            onclick='location.href="all-order-manage-edit.html"'>订单
                                    </button>
                                    <button type="button" class="btn bg-olive btn-xs"
                                            onclick='location.href="all-order-manage-edit.html"'>详情
                                    </button>
                                    <button type="button" class="btn bg-olive btn-xs"
                                            onclick='location.href="all-order-manage-edit.html"'>编辑
                                    </button>
                                </td>
                            </tr>


                            <tr>
                                <td><input name="ids" type="checkbox"></td>
                                <td>
                                    5
                                </td>
                                <td>71837383</td>
                                <td>北京一日游</td>
                                <td>￥1000</td>
                                <td>2017-03-09 13:51:26</td>
                                <td>已付款(待出行)</td>

                                <td class="text-center">
                                    <button type="button" class="btn bg-olive btn-xs"
                                            onclick='location.href="all-order-manage-edit.html"'>订单
                                    </button>
                                    <button type="button" class="btn bg-olive btn-xs"
                                            onclick='location.href="all-order-manage-edit.html"'>详情
                                    </button>
                                    <button type="button" class="btn bg-olive btn-xs"
                                            onclick='location.href="all-order-manage-edit.html"'>编辑
                                    </button>
                                </td>
                            </tr>


                            <tr>
                                <td><input name="ids" type="checkbox"></td>
                                <td>
                                    6
                                </td>
                                <td>71837383</td>
                                <td>北京一日游</td>
                                <td>￥1000</td>
                                <td>2017-03-09 13:51:26</td>
                                <td>已付款(待出行)</td>

                                <td class="text-center">
                                    <button type="button" class="btn bg-olive btn-xs"
                                            onclick='location.href="all-order-manage-edit.html"'>订单
                                    </button>
                                    <button type="button" class="btn bg-olive btn-xs"
                                            onclick='location.href="all-order-manage-edit.html"'>详情
                                    </button>
                                    <button type="button" class="btn bg-olive btn-xs"
                                            onclick='location.href="all-order-manage-edit.html"'>编辑
                                    </button>
                                </td>
                            </tr>


                            <tr>
                                <td><input name="ids" type="checkbox"></td>
                                <td>
                                    7
                                </td>
                                <td>71837383</td>
                                <td>北京一日游</td>
                                <td>￥1000</td>
                                <td>2017-03-09 13:51:26</td>
                                <td>已付款(待出行)</td>

                                <td class="text-center">
                                    <button type="button" class="btn bg-olive btn-xs"
                                            onclick='location.href="all-order-manage-edit.html"'>订单
                                    </button>
                                    <button type="button" class="btn bg-olive btn-xs"
                                            onclick='location.href="all-order-manage-edit.html"'>详情
                                    </button>
                                    <button type="button" class="btn bg-olive btn-xs"
                                            onclick='location.href="all-order-manage-edit.html"'>编辑
                                    </button>
                                </td>
                            </tr>


                            <tr>
                                <td><input name="ids" type="checkbox"></td>
                                <td>
                                    8
                                </td>
                                <td>71837383</td>
                                <td>北京一日游</td>
                                <td>￥1000</td>
                                <td>2017-03-09 13:51:26</td>
                                <td>已付款(待出行)</td>

                                <td class="text-center">
                                    <button type="button" class="btn bg-olive btn-xs"
                                            onclick='location.href="all-order-manage-edit.html"'>订单
                                    </button>
                                    <button type="button" class="btn bg-olive btn-xs"
                                            onclick='location.href="all-order-manage-edit.html"'>详情
                                    </button>
                                    <button type="button" class="btn bg-olive btn-xs"
                                            onclick='location.href="all-order-manage-edit.html"'>编辑
                                    </button>
                                </td>
                            </tr>
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
                        <div class="form-group form-inline">
                            总共2 页，共14 条数据。 每页
                            <select class="form-control">
                                <option>10</option>
                                <option>15</option>
                                <option>20</option>
                                <option>50</option>
                                <option>80</option>
                            </select> 条
                        </div>
                    </div>

                    <div class="box-tools pull-right">
                        <ul class="pagination">
                            <li>
                                <a href="#" aria-label="Previous">首页</a>
                            </li>
                            <li><a href="#">上一页</a></li>
                            <li><a href="#">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                            <li><a href="#">下一页</a></li>
                            <li>
                                <a href="#" aria-label="Next">尾页</a>
                            </li>
                        </ul>
                    </div>

                </div>
                <!-- /.box-footer-->


            </div>


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
                <!-- .box-footer-->
                <div class="box-footer">
                    <div class="pull-left">
                        <div class="form-group form-inline">
                            总共2 页，共14 条数据。 每页
                            <select class="form-control">
                                <option>10</option>
                                <option>15</option>
                                <option>20</option>
                                <option>50</option>
                                <option>80</option>
                            </select> 条
                        </div>
                    </div>

                    <div class="box-tools pull-right">
                        <ul class="pagination">
                            <li>
                                <a href="#" aria-label="Previous">首页</a>
                            </li>
                            <li><a href="#">上一页</a></li>
                            <li><a href="#">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                            <li><a href="#">下一页</a></li>
                            <li>
                                <a href="#" aria-label="Next">尾页</a>
                            </li>
                        </ul>
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