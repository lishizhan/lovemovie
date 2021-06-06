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


    </style>
</head>

<body class="hold-transition skin-purple sidebar-mini">

<div class="wrapper">

    <!-- 页面头部 -->
    <%@include file="common/pageHead.jsp" %>
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
                    <div class="modal-dialog modal-lg" role="document" style="top: 0">
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
                                            <form class="form-horizontal" id="movieForm">
                                                <input movie-input type="hidden" id="moviePicture" name="moviePicture">
                                                <div class="box-body">
                                                    <div class="form-group">
                                                        <label for="movieCnName"
                                                               class="col-sm-2 control-label">电影名称（中文）</label>
                                                        <div class="col-sm-4">
                                                            <input type="text" name="movieCnName"
                                                                   class="form-control"
                                                                   id="movieCnName" placeholder="请输入电影中文名字">
                                                            <span class="help-block"></span>
                                                        </div>
                                                        <label for="movieFgName"
                                                               class="col-sm-2 control-label">电影名称（外语）</label>
                                                        <div class="col-sm-4">
                                                            <input movie-input type="text" name="movieFgName"
                                                                   class="form-control"
                                                                   id="movieFgName" placeholder="请输入电影英文名字">
                                                            <span class="help-block"></span>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="movieDirector"
                                                               class="col-sm-2 control-label">导演</label>
                                                        <div class="col-sm-3">
                                                            <input movie-input type="text" name="movieDirector"
                                                                   class="form-control"
                                                                   id="movieDirector">
                                                            <span class="help-block"></span>
                                                            <input type="hidden" id="directorImgPath" name="directorImg"
                                                                   value="">

                                                        </div>
                                                        <div class="col-sm-2">
                                                            <img id="directorImg" src="upload/actor/addimg.jpg" alt=""
                                                                 style="width: 66px;height: 80px;">
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">演员</label>
                                                        <div class="col-sm-6">
                                                            <button id="addActorInfoBtn" type="button"
                                                                    class="btn btn-info"><i
                                                                    class="glyphicon glyphicon-plus"></i></button>
                                                            <button id="delActorInfoBtn" type="button"
                                                                    class="btn btn-info"><i
                                                                    class="glyphicon glyphicon-minus"></i></button>
                                                            <span id="actorMsg" class="help-block"
                                                                  style="display: inline-block;color: #a94442"></span>
                                                        </div>
                                                    </div>
                                                    <div class="form-group" id="actorList">
                                                        <!--                                                        <label class="col-sm-2 control-label"></label>-->
                                                        <!--动态生成-->
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="movieDetail"
                                                               class="col-sm-2 control-label">介绍</label>
                                                        <div class="col-sm-10">
                                                            <textarea style="resize:none;" class="form-control" rows="4"
                                                                      name="movieDetail"
                                                                      id="movieDetail"></textarea>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">类型</label>
                                                        <div class="col-sm-2">
                                                            <div class="checkbox">
                                                                <label>
                                                                    <input type="checkbox" name="movieType"
                                                                           value="0"> 爱情
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-2">
                                                            <div class="checkbox">
                                                                <label>
                                                                    <input type="checkbox" name="movieType" value="1">
                                                                    惊悚
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-2">
                                                            <div class="checkbox">
                                                                <label>
                                                                    <input type="checkbox" name="movieType"
                                                                           value="2"> 科幻
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-2">
                                                            <div class="checkbox">
                                                                <label>
                                                                    <input type="checkbox" name="movieType"
                                                                           value="3">动作
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-2">
                                                            <div class="checkbox">
                                                                <label>
                                                                    <input type="checkbox" name="movieType" value="4">悬疑
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-2 pull-right">
                                                            <div class="checkbox">
                                                                <label>
                                                                    <input type="checkbox" name="movieType" value="5">
                                                                    犯罪
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-2 pull-right">
                                                            <div class="checkbox">
                                                                <label>
                                                                    <input type="checkbox" name="movieType" value="6">
                                                                    冒险
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-2 pull-right">
                                                            <div class="checkbox">
                                                                <label>
                                                                    <input type="checkbox" name="movieType" value="7">
                                                                    战争
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-2 pull-right">
                                                            <div class="checkbox">
                                                                <label>
                                                                    <input type="checkbox" name="movieType" value="8">奇幻
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-2 pull-right">
                                                            <div class="checkbox">
                                                                <label>
                                                                    <input type="checkbox" name="movieType" value="9">运动
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-2 pull-right">
                                                            <div class="checkbox">
                                                                <label>
                                                                    <input type="checkbox" name="movieType" value="10">家庭
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-2 pull-right">
                                                            <div class="checkbox">
                                                                <label>
                                                                    <input type="checkbox" name="movieType" value="11">古装
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-2 pull-right">
                                                            <div class="checkbox">
                                                                <label>
                                                                    <input type="checkbox" name="movieType" value="12">武侠
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-2 pull-right">
                                                            <div class="checkbox">
                                                                <label>
                                                                    <input type="checkbox" name="movieType" value="13">其他
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="movieDuration"
                                                               class="col-sm-2 control-label">时长</label>
                                                        <div class="col-sm-4">
                                                            <input type="text" name="movieDuration"
                                                                   class="form-control" id="movieDuration"
                                                                   placeholder="请输入电影时长">
                                                            <span class="help-block"></span>
                                                        </div>
                                                        <label for="movieReleasedate" class="col-sm-2 control-label">上映时间</label>
                                                        <div class="col-sm-4">
                                                            <input movie-input type="date" name="movieReleasedate"
                                                                   class="form-control" id="movieReleasedate"
                                                                   placeholder="请输入电影上映时间">
                                                            <span class="help-block"></span>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="movieCountry"
                                                               class="col-sm-2 control-label">制片地区</label>
                                                        <div class="col-sm-4">
                                                            <input movie-input type="text" name="movieCountry"
                                                                   class="form-control"
                                                                   id="movieCountry" placeholder="请输入电影制片地区">
                                                            <span class="help-block"></span>
                                                        </div>
                                                        <label class="col-sm-2 control-label">状态</label>
                                                        <div class="col-sm-4">
                                                            <select class="form-control" name="movieState">
                                                                <option value="1">正在上映</option>
                                                                <option value="0">已经下架</option>
                                                            </select>
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
                                                     class="profile-user-img img-responsive img-circle"
                                                     src="upload/actor/addimg.jpg"
                                                     alt="User profile picture">
                                                <p class="text-center" style="color: #000;margin-top: 10px">
                                                    <button id="uploadMovieImgBtn" class="btn btn-danger">添加电影海报
                                                    </button>
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
                                <button type="button" id="saveBtn" class="btn btn-primary">保存</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!--头像上传-->
            <div class="modal fade" id="uploadModal" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span>
                            </button>
                            <h4 class="modal-title">上传电影海报</h4>
                        </div>
                        <div class="modal-body">
                            <form id="perForm" class="add_form" enctype="multipart/form-data">
                                <input type="file" class="file-loading" name="upload" id="upload_img_input" multiple/>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <!--                            <button type="button" id="uploadImg" class="btn btn-primary" onclick="save()">上传</button>-->
                            <button type="button" id="uploadImg" class="btn btn-primary">上传</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->

            <!--头像上传-->
            <div class="modal fade" id="uploadModalActor" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span>
                            </button>
                            <h4 class="modal-title">上传演员头像</h4>
                        </div>
                        <div class="modal-body">
                            <form id="perFormActor" class="add_form" enctype="multipart/form-data">
                                <input type="file" class="file-loading" name="upload" id="upload_img_input_actor"
                                       multiple/>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <!--                            <button type="button" id="uploadImg" class="btn btn-primary" onclick="save()">上传</button>-->
                            <button type="button" id="uploadImgActor" class="btn btn-primary">上传</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
            <!--导演头像上传-->
            <div class="modal fade" id="uploadModalDirector" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span>
                            </button>
                            <h4 class="modal-title">上传导演头像</h4>
                        </div>
                        <div class="modal-body">
                            <form id="perFormDirector" class="add_form" enctype="multipart/form-data">
                                <input type="file" class="file-loading" name="upload" id="upload_img_input_director"
                                       multiple/>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <!--                            <button type="button" id="uploadImg" class="btn btn-primary" onclick="save()">上传</button>-->
                            <button type="button" id="uploadImgDirector" class="btn btn-primary">上传</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->


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

                                    <!--<button type="button" class="btn btn-default" title="按评分排序"><i
                                            class="fa  fa-arrows-v"></i> 按评分排序
                                    </button>
                                    <button type="button" class="btn btn-default" title="按上映时间排序"><i
                                            class="fa  fa-arrows-v"></i> 按上映时间排序
                                    </button>
                                    <button type="button" class="btn btn-default" title="按电影时长排序"><i
                                            class="fa  fa-arrows-v"></i> 按电影时长排序
                                    </button>-->
                                    <button type="button" id="delBtn" class="btn btn-danger" title="删除"><i class="fa fa-trash-o"></i> 删除
                                    </button>
                                    <button type="button" class="btn btn-primary" title="刷新"
                                            onclick="window.location.reload();"><i class="fa fa-refresh"></i> 刷新
                                    </button>

                                </div>
                                <div class="input-group input-group-sm">
                                    <input id="searchMsg" type="text" class="form-control">
                                    <span class="input-group-btn"><button id="searchBtn" type="button" class="btn btn-info btn-flat">搜索</button></span>
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
                                <th>电影编号</th>
                                <th>电影名称</th>
                                <th>电影导演</th>
                                <th>电影时长</th>
                                <th>电影类型</th>
                                <th>电影评分</th>
                                <th>电影票房</th>
                                <th>上映时间</th>
                                <th>制片地区</th>
                                <th>电影状态</th>
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

    //搜索名字
    let movieName = "";

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
        setSidebarActive("movie-info");
    });


    /*展示电影基本信息*/
    //获取电影信息
    function toPage(pageNum, pageSize,movieName) {
        $.ajax({
            url: "management/getAllMovies",
            data: {
                "pageNo": pageNum,
                "pageSize": pageSize,
                "movieName":movieName
            },
            type: "GET",
            success: function (res) {

                // console.log(res);
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
        lastPageNum = res.extend.pageInfo.pages;

    }

    function build_movie_info_table(res) {
        //清空表格
        $("#dataList tbody").empty();

        let users = res.extend.pageInfo.list;

        if (users.length===0){
            let msg = $("<td colspan='12'></td>").append("<h4>查询不到指定的数据，请点击刷新~</h4>");
            $("<tr></tr>").append("<d>").append(msg).appendTo($("#dataList tbody"));
            return;
        }


        // console.log(res)
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
                toPage(pageNum, pageSize,movieName);
            });
            prePage.click(function () {
                toPage(res.extend.pageInfo.pageNum - 1, pageSize,movieName);
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
                toPage(res.extend.pageInfo.pageNum + 1, pageSize,movieName);
            });
            lastLi.click(function () {
                toPage(res.extend.pageInfo.pages, pageSize,movieName)
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


    /*添加电影*/
    $(".info-box").click(function () {
        $('#movieForm')[0].reset()
        $("#actorList").empty();
        $("#perForm")[0].reset();
        $("#headimg").attr("src", "upload/actor/addimg.jpg");
        $("#directorImg").attr("src", "upload/actor/addimg.jpg")

        //显示模态框
        $('#addMovieModal').modal({
            //点击背景模态框不消失
            backdrop: "static"
        })
    });
    /*校验添加电影表单的各项数据*/

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

    //验证字符长度
    function checkCharLen(ele) {
        let charLen = $(ele).val();
        console.log(charLen)
        if (charLen.length > 30 || charLen.length == 0) {
            show_msg(ele, "error", "请输入1~30个字符");
            return false;
        } else {
            show_msg(ele, "success", "");
            return true;
        }
    }

    //判断电影名称是否存在
    function checkMovieName() {
        let trueCheck = false;
        $.ajax({
            url: "management/queryByMovieName",
            data: {
                "movieName": $("#movieCnName").val()
            },
            type: "POST",
            async: false,
            success: function (res) {
                console.log(res)
                if (res.code != 100) {
                    show_msg("#movieCnName", "error", res.msg);
                    trueCheck = false;
                } else {
                    show_msg("#movieCnName", "success", "");
                    trueCheck = true;
                }
            }
        });
        return trueCheck;
    }

    //校验电影名称是否存在
    let movieNameExits = false;
    $("#movieCnName").change(function () {
        console.log($("#movieCnName").val().length);
        if (!checkCharLen("#movieCnName")) {
            movieNameExits = false;
        } else {
            //查看电影名称是否存在
            if (checkMovieName()) {
                movieNameExits = true;
            } else {
                movieNameExits = false;
            }
        }
    });
    $("input[movie-input]").change(function () {
        let ele = "#" + $(this).attr("id");
        let charLen = $(this).val();
        if (charLen.length > 30 || charLen.length == 0) {
            show_msg(ele, "error", "请输入1~30个字符");
        } else {
            show_msg(ele, "success", "");
        }

    });
    $("form input[type='checkbox']").click(function () {
        if ($("form input[type='checkbox']:checked").length > 3) {
            $(this).attr("checked", false);
            alert("电影类型不能超过3个");
        }
    });
    let timeCheck = false;
    $("#movieDuration").change(function () {
        let ele = "#"+$(this).attr("id");
        let reg = /^\+?[1-9]\d*$/;
        if (!reg.test($(this).val())) {
            // 非大于0的正整数，给出提示
            console.log("不是大于0的整数")
            show_msg(ele, "error", "时长只能是数字");
            timeCheck=true;
        }else {
            show_msg(ele, "success", "");
            timeCheck=false;
        }
    });



    $("#saveBtn").click(function () {

        /*let paraList = $("#addMovieModal form").serialize().split("&");
        console.log(paraList)*/
        //参数校验
        //电影名称中文校验
        if (!movieNameExits) return;
        //电影英文检验
        if ($("#movieFgName").val().length === 0) return;
        //导演
        if ($("#movieDirector").val().length === 0) return;
        if ($("#directorImgPath").val().length === 0) {
            alert("请添加导演头像！")
            return;
        }
        //介绍
        if ($("#movieDetail").val().length === 0) return;
        //时长
        if ($("#movieDuration").val().length === 0) return;
        //制片地区
        if ($("#movieCountry").val().length === 0) return;
        //类型
        if ($("input[type='checkbox']:checked").length ==0){
            alert("请选择电影类型！！！");
            return;
        }
        //电影海报
        if ($("#moviePicture").val().length === 0) {
            alert("请添加电影海报！！")
            return;
        }

        //校验演员列表不能为空
        let actorFlag = false;
         $("#actorList input").each(function () {
             let lenActor = $(this).val().trim().length;
             if (lenActor==0){
                 actorFlag=true;
             }
         });
         if (actorFlag){
             alert("演员信息和图片不能为空！！！");
             return;
         }

         if (timeCheck)return;

         if ($("#actorList").children().length==0){
             alert("请至少添加一个演员信息！！！")
             return;
         }

        console.log("发送ajax保存电影信息!!!")
        $.ajax({
            url: "management/saveMovie",
            type: "POST",
            data: $("#addMovieModal form").serialize(),
            success: function (res) {
                console.log(res);
                if (res.code===100){
                    $('#addMovieModal').modal("hide")
                    toPage(lastPageNum,pageSize,movieName);
                }else {
                    alert("添加失败："+res.msg);
                }
            }
        });
    });


    //点击电影上传
    $("#uploadMovieImgBtn").click(function () {
        //显示头像上传模态框
        $('#uploadModal').modal({
            //点击背景模态框不消失
            backdrop: "static"
        })
        $("#uploadImg").click(function () {
            save('management/uploadMovieImg', "#headimg");
        });
    });

    let commId;

    //点击保存按钮
    function save(urlImg, eleImg) {
        if ($('#upload_img_input').fileinput("getFilesCount") <= 0) {//获取文件个数
            alert("请上传图片")
            return false;
        }
        let formData = new FormData($('#perForm')[0]);
        $.ajax({
            url: urlImg,
            type: 'post',
            dataType: "json",
            cache: false,//上传文件不需要缓存
            data: formData,
            processData: false,//data是FormData对象，不需要对数据进行处理
            contentType: false,
            success: function (result) {
                console.log(result);
                if (result.code === 100) {
                    $(eleImg).attr("src", result.extend.movieImg);
                    $("#moviePicture").attr("value", result.extend.movieImg);
                    $('#uploadModal').modal("hide")
                }
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
        }).on("filebatchuploadsuccess", function (event, data) {
            // console.log(data);
        });


    });


    /*动态生成演员节点*/
    /*
    <div class="col-sm-3">
        <input type="text" class="form-control" placeholder="演员姓名">
        <p>饰：</p>
        <input type="text" class="form-control" placeholder="饰演角色">

    </div>
    <div class="col-sm-2">
        <img src="upload/actor/addimg.jpg" alt="">
    </div>
    * */
    let clickNum = 0;
    $("#addActorInfoBtn").click(function () {

        clickNum++;
        console.log(clickNum)
        if (clickNum % 2 !== 0) {
            let label = $("<div class='col-sm-2'></div>");
            let name = $("<div class='col-sm-3'></div>")
                .append("<input  type='text' class='form-control' name='movieActor' placeholder='演员姓名'>")
                .append("<p>饰：</p>").append("<input m type='text' class='form-control' name='movieActorPortray' placeholder='饰演角色'>");
            let img = $("<img class='actor_img' src='upload/actor/addimg.jpg' alt=''>").addClass("img" + clickNum)
            let div = $("<div class='col-sm-2'></div>").append(img).append("<input  type='hidden' class='form-control' name='movieActorImgPath'>");
            $("#actorList").append(label).append(name).append(div);
        } else {
            let name = $("<div class='col-sm-3'></div>")
                .append("<input m type='text' class='form-control' name='movieActor' placeholder='演员姓名'>")
                .append("<p>饰：</p>").append("<input m type='text' class='form-control' name='movieActorPortray' placeholder='饰演角色'>");
            let img = $("<img class='actor_img' src='upload/actor/addimg.jpg' alt=''>").addClass("img" + clickNum)
            let div = $("<div class='col-sm-2'></div>").append(img).append("<input  type='hidden' class='form-control' name='movieActorImgPath'>");
            $("#actorList").append(name).append(div);
        }
    });
    $("#delActorInfoBtn").click(function () {
        if (clickNum % 2 !== 0) {
            $("#actorList div").eq(-3).remove();
            $("#actorList div").eq(-2).remove();
            $("#actorList div").last().remove();
        } else {
            $("#actorList div").eq(-2).remove();
            $("#actorList div").last().remove();
        }
        clickNum--;
    });


    //保存演员信息和图片-------------------------------------------------------------------------------------------------

    //点击保存按钮
    function saveActor(urlImg, eleImg) {
        // console.log($(eleImg).next().attr("value"));
        if ($('#upload_img_input_actor').fileinput("getFilesCount") <= 0) {//获取文件个数
            alert("请上传图片")
            return false;
        }
        let formData = new FormData($('#perFormActor')[0]);
        $.ajax({
            url: urlImg,
            type: 'post',
            dataType: "json",
            cache: false,//上传文件不需要缓存
            data: formData,
            processData: false,//data是FormData对象，不需要对数据进行处理
            contentType: false,
            success: function (result) {
                console.log(result);
                if (result.code === 100) {
                    $(eleImg).attr("src", result.extend.movieImg);
                    $(eleImg).next().attr("value", result.extend.movieImg)
                    $('#uploadModalActor').modal("hide")
                }
            }
        });
    }

    // 初始化
    $(document).ready(function () {
        $('#upload_img_input_actor').fileinput({
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
        }).on("filebatchuploadsuccess", function (event, data) {
            // console.log(data);
        });


    });

    let pathImg = "";
    $(document).on("click", ".actor_img", function () {
        // $(this).attr("src","");
        $("#perFormActor")[0].reset();
        //显示头像上传模态框
        $('#uploadModalActor').modal({
            //点击背景模态框不消失
            backdrop: "static"
        })
        pathImg = "." + $(this).attr("class").split(" ")[1];

    });
    $("#uploadImgActor").click(function () {
        saveActor('management/uploadActorHeadImg', pathImg);
    });


    /*保存导演头像*/
    $("#directorImg").click(function () {
        $("#perFormDirector")[0].reset();
        //显示头像上传模态框
        $('#uploadModalDirector').modal({
            //点击背景模态框不消失
            backdrop: "static"
        })
    });
    $("#uploadImgDirector").click(function () {
        saveDirector("management/uploadActorHeadImg", "#directorImg")
    });

    //点击保存按钮
    function saveDirector(urlImg, eleImg) {
        // console.log($(eleImg).next().attr("value"));
        if ($('#upload_img_input_director').fileinput("getFilesCount") <= 0) {//获取文件个数
            alert("请上传图片")
            return false;
        }
        let formData = new FormData($('#perFormDirector')[0]);
        $.ajax({
            url: urlImg,
            type: 'post',
            dataType: "json",
            cache: false,//上传文件不需要缓存
            data: formData,
            processData: false,//data是FormData对象，不需要对数据进行处理
            contentType: false,
            success: function (result) {
                console.log(result);
                if (result.code === 100) {
                    $(eleImg).attr("src", result.extend.movieImg);
                    $("#directorImgPath").attr("value", result.extend.movieImg)
                    $('#uploadModalDirector').modal("hide")
                }
            }
        });
    }

    // 初始化
    $(document).ready(function () {
        $('#upload_img_input_director').fileinput({
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
        }).on("filebatchuploadsuccess", function (event, data) {
            // console.log(data);
        });
    });



    /*点击删除按钮*/
    $(document).on("click",".delete_btn",function () {
        let name = $(this).parents("tr").find("td:eq(2)").text();
        let movieId = $(this).attr("del-id");
        if (confirm("是否删除电影《"+name+"》？")){
            //请求后台删除
            $.ajax({
                url:"management/deleteMovie/"+movieId,
                type:"delete",
                success:function (res) {
                    console.log(res);
                    if (res.code===100){
                        toPage(thisPageNum,pageSize,movieName);
                    }else {
                        alert("删除失败："+res.msg);
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
        $(".check_item").prop("checked",$(this).prop("checked"));
    });
    //为每个checked绑定点击事件
    $(document).on("click",".check_item",function () {
        //判断选中的个数是否等于item的个数
        let flag=$(".check_item:checked").length==$(".check_item").length;
        $("#check_all").prop("checked",flag);

    });

    //点击批量删除
    $("#delBtn").click(function () {
        if ($(".check_item:checked").length==0){
            alert("请选中要删除的电影！！")
            return false;
        }
        let empNames = "";
        let movieId="";
        $.each($(".check_item:checked"),function () {
            //获取批量删除的员工姓名
            // console.log($(this).parents("tr").find("td:eq(2)").text());
            empNames+=$(this).parents("tr").find("td:eq(2)").text()+",";
            movieId+=$(this).parents("tr").find("td:eq(1)").text()+"-"
        });
        empNames=empNames.substring(0,empNames.length-1);
        movieId=movieId.substring(0,movieId.length-1);
        if (confirm("是否删除【"+empNames+"】等电影？")){
            /*console.log(empNames);
            console.log(del_idstr);*/
            //执行Ajax请求删除员工
            $.ajax({
                url:"management/deleteMovie/"+movieId,
                type:"DELETE",
                success:function (res) {
                    // console.log(res);
                    //回到当前页面
                    $("#check_all").prop("checked",false);
                    toPage(thisPageNum,pageSize,movieName);
                }
            });
        }else {
            return false;
        }
    });

    /*电影搜索*/
    $("#searchBtn").click(function () {

        if ($("#searchMsg").val().trim() === '') return false;
        movieName = $("#searchMsg").val().trim();
        console.log(movieName)
        toPage(1, 10, movieName);
    });



</script>
</body>

</html>
<!---->