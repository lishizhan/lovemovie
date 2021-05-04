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

    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" href="admin/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="admin/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="admin/plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="admin/plugins/iCheck/square/blue.css">
    <link rel="stylesheet" href="admin/plugins/morris/morris.css">
    <link rel="stylesheet" href="admin/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
    <link rel="stylesheet" href="admin/plugins/datepicker/datepicker3.css">
    <link rel="stylesheet" href="admin/plugins/daterangepicker/daterangepicker.css">
    <link rel="stylesheet" href="admin/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
    <link rel="stylesheet" href="admin/plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="admin/plugins/treeTable/jquery.treetable.css">
    <link rel="stylesheet" href="admin/plugins/treeTable/jquery.treetable.theme.default.css">
    <link rel="stylesheet" href="admin/plugins/select2/select2.css">
    <link rel="stylesheet" href="admin/plugins/colorpicker/bootstrap-colorpicker.min.css">
    <link rel="stylesheet" href="admin/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
    <link rel="stylesheet" href="admin/plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="admin/plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="admin/css/style.css">
    <link rel="stylesheet" href="admin/plugins/ionslider/ion.rangeSlider.css">
    <link rel="stylesheet" href="admin/plugins/ionslider/ion.rangeSlider.skinNice.css">
    <link rel="stylesheet" href="admin/plugins/bootstrap-slider/slider.css">
    <link rel="stylesheet" href="admin/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css">
</head>

<body class="hold-transition skin-purple sidebar-mini">

<div class="wrapper">

    <!-- 页面头部 -->
    <header class="main-header">


        <!-- Logo -->
        <a href="admin/index.jsp" class="logo">
            <!-- mini logo for sidebar mini 50x50 pixels -->
            <span class="logo-mini"><b>后台</b></span>
            <!-- logo for regular state and mobile devices -->
            <span class="logo-lg"><b>爱电影</b>后台管理</span>
        </a>


        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top">
            <!-- Sidebar toggle button-->
            <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                <span class="sr-only">Toggle navigation</span>
            </a>

            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <li class="dropdown user user-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <img src="admin/img/user2-160x160.jpg" class="user-image" alt="User Image">
                            <span class="hidden-xs">张猿猿</span>
                        </a>
                        <ul class="dropdown-menu">
                            <!-- User image -->
                            <li class="user-header">
                                <img src="admin/img/user2-160x160.jpg" class="img-circle" alt="User Image">

                                <p>
                                    张猿猿 - 数据管理员
                                    <small>最后登录 11:20AM</small>
                                </p>
                            </li>

                            <!-- Menu Footer-->
                            <li class="user-footer">
                                <div class="pull-left">
                                    <a href="#" class="btn btn-default btn-flat">修改密码</a>
                                </div>
                                <div class="pull-right">
                                    <a href="#" class="btn btn-default btn-flat">注销</a>
                                </div>
                            </li>
                        </ul>
                    </li>

                </ul>
            </div>
        </nav>
    </header>
    <!-- 页面头部 /-->

    <!-- 导航侧栏 -->
    <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
            <!-- sidebar menu: : style can be found in sidebar.less -->
            <ul class="sidebar-menu">
                <li class="header">菜单</li>

                <li id="admin-index">
                    <a href="admin/index.jsp">
                        <i class="fa fa-dashboard"></i>
                        <span>首页</span>
                    </a>
                </li>
                <li id="admin-info">
                    <a href="admin/admin-info.jsp">
                        <i class="fa  fa-user"></i>
                        <span>管理员信息管理</span>

                    </a>
                </li>
                <li id="user-info">
                    <a href="admin/user-info.jsp">
                        <i class="fa fa-users"></i>
                        <span>用户信息管理</span>

                    </a>
                </li>
                <li id="movie-type-info">
                    <a href="admin/movie-type-info.jsp">
                        <i class="fa fa-video-camera"></i> <span>电影类型管理</span>
                    </a>
                </li>
                <li id="city-info">
                    <a href="admin/city-info.jsp">
                        <i class="fa fa-building-o "></i> <span>城市信息管理</span>
                    </a>
                </li>
                <li id="cinema-info">
                    <a href="admin/cinema-info.jsp">
                        <i class="fa fa-institution "></i> <span>影院信息管理</span>
                    </a>
                </li>
                <li id="movie-info">
                    <a href="admin/movie-info.jsp">
                        <i class="fa  fa-film"></i> <span>电影信息管理</span>
                    </a>
                </li>
                <li id="order-info">
                    <a href="admin/order-info.jsp">
                        <i class="fa fa-cart-arrow-down"></i> <span>订单信息管理</span>
                    </a>
                </li>
                <li id="movie-appraise">
                    <a href="admin/movie-appraise.jsp">
                        <i class="fa fa-keyboard-o"></i> <span>电影评价管理</span>
                    </a>
                </li>
                <li id="admin-blank">
                    <a href="admin/all-admin-blank.jsp">
                        <i class="fa fa-circle-o"></i> <span>空白页</span>
                    </a>
                </li>

            </ul>
        </section>
        <!-- /.sidebar -->
    </aside>
    <!-- 导航侧栏 /-->

    <!-- 内容区域 -->
    <div class="content-wrapper">

        <!-- 内容头部 -->
        <section class="content-header">
            <h1>
                控制面板
                <small>首页</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="admin/index.jsp"><i class="fa fa-dashboard"></i> 首页</a></li>
            </ol>
        </section>
        <!-- 内容头部 /-->

        <!-- 正文区域 -->
        <section class="content">


            <!-- 统计数值 -->
            <div class="row">
                <div class="col-lg-3 col-xs-6">
                    <!-- small box -->
                    <div class="small-box bg-aqua">
                        <div class="inner">
                            <h3>150</h3>

                            <p>新订单</p>
                        </div>
                        <div class="icon">
                            <i class="ion ion-bag"></i>
                        </div>
                        <a href="all-order-manage-list.html" class="small-box-footer">详细 <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
                <!-- ./col -->
                <div class="col-lg-3 col-xs-6">
                    <!-- small box -->
                    <div class="small-box bg-green">
                        <div class="inner">
                            <h3>53<sup style="font-size: 20px">%</sup></h3>

                            <p>转化率</p>
                        </div>
                        <div class="icon">
                            <i class="ion ion-stats-bars"></i>
                        </div>
                        <a href="all-ad-statistics-list.html" class="small-box-footer">详细 <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
                <!-- ./col -->
                <div class="col-lg-3 col-xs-6">
                    <!-- small box -->
                    <div class="small-box bg-yellow">
                        <div class="inner">
                            <h3>44</h3>

                            <p>新注册用户</p>
                        </div>
                        <div class="icon">
                            <i class="ion ion-person-add"></i>
                        </div>
                        <a href="all-member-manage-list.html" class="small-box-footer">详细 <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
                <!-- ./col -->
                <div class="col-lg-3 col-xs-6">
                    <!-- small box -->
                    <div class="small-box bg-red">
                        <div class="inner">
                            <h3>65</h3>

                            <p>日PV</p>
                        </div>
                        <div class="icon">
                            <i class="ion ion-pie-graph"></i>
                        </div>
                        <a href="all-ad-statistics-list.html" class="small-box-footer">详细 <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
                <!-- ./col -->
            </div>
            <!-- /.row -->


            <!-- 待处理订单 -->
            <div class="box box-primary">
                <div class="box-header with-border">
                    <i class="fa fa-cube"></i>
                    <h3 class="box-title">待处理订单</h3>
                </div>

                <div class="box-body">

                    <!-- 数据表格 -->
                    <div class="table-box">

                        <!--数据列表-->
                        <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
                            <thead>
                            <tr>
                                <th class="">订单号</th>
                                <th class="">产品名称</th>
                                <th class="">会员</th>
                                <th class="">价格</th>
                                <th class="">状态</th>
                                <th class="text-center">操作</th>
                            </tr>
                            </thead>
                            <tbody>

                            <tr>
                                <td>2017020200001</td>
                                <td>西安3日自由行·超级自由行</td>
                                <td>bi'peng0405</td>
                                <td>￥500</td>
                                <td>已取消</td>
                                <td class="text-center">
                                    <button type="button" class="btn bg-olive btn-xs" onclick='location.href="all-product-line-edit.html"'>编辑</button>
                                </td>
                            </tr>

                            <tr>
                                <td>2017020200001</td>
                                <td>西安3日自由行·超级自由行</td>
                                <td>bi'peng0405</td>
                                <td>￥500</td>
                                <td>已出团(待点评)</td>
                                <td class="text-center">
                                    <button type="button" class="btn bg-olive btn-xs" onclick='location.href="all-product-line-edit.html"'>编辑</button>
                                </td>
                            </tr>

                            <tr>
                                <td>2017020200001</td>
                                <td>西安3日自由行·超级自由行</td>
                                <td>bi'peng0405</td>
                                <td>￥500</td>
                                <td>已处理(待付款)</td>
                                <td class="text-center">
                                    <button type="button" class="btn bg-olive btn-xs" onclick='location.href="all-product-line-edit.html"'>编辑</button>
                                </td>
                            </tr>

                            <tr>
                                <td>2017020200001</td>
                                <td>西安3日自由行·超级自由行</td>
                                <td>bi'peng0405</td>
                                <td>￥500</td>
                                <td>已处理(待出团)</td>
                                <td class="text-center">
                                    <button type="button" class="btn bg-olive btn-xs" onclick='location.href="all-product-line-edit.html"'>编辑</button>
                                </td>
                            </tr>

                            <tr>
                                <td>2017020200001</td>
                                <td>西安3日自由行·超级自由行</td>
                                <td>bi'peng0405</td>
                                <td>￥500</td>
                                <td>已取消</td>
                                <td class="text-center">
                                    <button type="button" class="btn bg-olive btn-xs" onclick='location.href="all-product-line-edit.html"'>编辑</button>
                                </td>
                            </tr>

                            <tr>
                                <td>2017020200001</td>
                                <td>西安3日自由行·超级自由行</td>
                                <td>bi'peng0405</td>
                                <td>￥500</td>
                                <td>已取消</td>
                                <td class="text-center">
                                    <button type="button" class="btn bg-olive btn-xs" onclick='location.href="all-product-line-edit.html"'>编辑</button>
                                </td>
                            </tr>

                            </tbody>
                        </table>
                        <!--数据列表/-->

                    </div>
                    <!-- 数据表格 /-->

                </div>
                <!-- /.box-body -->

            </div>
            <!-- 待处理订单 /-->

        </section>
        <!-- 正文区域 /-->

    </div>
    <!-- 内容区域 /-->

    <!-- 底部导航 -->
    <footer class="main-footer">
        <div class="pull-right hidden-xs">
            <b>Version</b> 1.0.0
        </div>
        <strong>Copyright &copy; 2020-2021 <a href="#">卧龙凤雏·爱电影</a>.</strong> All rights reserved.
    </footer>
    <!-- 底部导航 /-->

</div>


<script src="admin/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="admin/plugins/jQueryUI/jquery-ui.min.js"></script>
<script>
    $.widget.bridge('uibutton', $.ui.button);
</script>
<script src="admin/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="admin/plugins/raphael/raphael-min.js"></script>
<script src="admin/plugins/morris/morris.min.js"></script>
<script src="admin/plugins/sparkline/jquery.sparkline.min.js"></script>
<script src="admin/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="admin/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<script src="admin/plugins/knob/jquery.knob.js"></script>
<script src="admin/plugins/daterangepicker/moment.min.js"></script>
<script src="admin/plugins/daterangepicker/daterangepicker.js"></script>
<script src="admin/plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
<script src="admin/plugins/datepicker/bootstrap-datepicker.js"></script>
<script src="admin/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
<script src="admin/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<script src="admin/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="admin/plugins/fastclick/fastclick.js"></script>
<script src="admin/plugins/iCheck/icheck.min.js"></script>
<script src="admin/plugins/adminLTE/js/app.min.js"></script>
<script src="admin/plugins/treeTable/jquery.treetable.js"></script>
<script src="admin/plugins/select2/select2.full.min.js"></script>
<script src="admin/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
<script src="admin/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
<script src="admin/plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
<script src="admin/plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
<script src="admin/plugins/bootstrap-markdown/js/markdown.js"></script>
<script src="admin/plugins/bootstrap-markdown/js/to-markdown.js"></script>
<script src="admin/plugins/ckeditor/ckeditor.js"></script>
<script src="admin/plugins/input-mask/jquery.inputmask.js"></script>
<script src="admin/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="admin/plugins/input-mask/jquery.inputmask.extensions.js"></script>
<script src="admin/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="admin/plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="admin/plugins/chartjs/Chart.min.js"></script>
<script src="admin/plugins/flot/jquery.flot.min.js"></script>
<script src="admin/plugins/flot/jquery.flot.resize.min.js"></script>
<script src="admin/plugins/flot/jquery.flot.pie.min.js"></script>
<script src="admin/plugins/flot/jquery.flot.categories.min.js"></script>
<script src="admin/plugins/ionslider/ion.rangeSlider.min.js"></script>
<script src="admin/plugins/bootstrap-slider/bootstrap-slider.js"></script>
<script src="admin/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.js"></script>
<script src="admin/plugins/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script>
    $(document).ready(function() {
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


    $(document).ready(function() {
        // 激活导航位置
        setSidebarActive("admin-index");
    });
</script>
</body>

</html>
<!---->