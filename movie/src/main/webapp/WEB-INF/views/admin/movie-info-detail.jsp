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

        #actorList img {
            width: 75px;
            height: 100px;
            margin-bottom: 15px;
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
                            <h3 class="box-title" style="display: inline-block">电影信息</h3>
                           <!-- <div style="display: inline-block" class="pull-right">
                                <button type="button" class="btn btn-primary pull-right">修改电影信息</button>
                                <button type="button" class="btn btn-primary pull-right">保存修改</button>
                            </div>-->
                        </div>
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
                                                           class="form-control" value="${movie.movieCnName}"
                                                           id="movieCnName" placeholder="请输入电影中文名字">
                                                    <span class="help-block"></span>
                                                </div>
                                                <label for="movieFgName"
                                                       class="col-sm-2 control-label">电影名称（外语）</label>
                                                <div class="col-sm-4">
                                                    <input movie-input type="text" name="movieFgName"
                                                           class="form-control" value="${movie.movieFgName}"
                                                           id="movieFgName" placeholder="请输入电影英文名字">
                                                    <span class="help-block"></span>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="movieDirector"
                                                       class="col-sm-2 control-label">导演</label>
                                                <div class="col-sm-3">
                                                    <input movie-input type="text" name="movieDirector"
                                                           class="form-control" value="${director.actorName}"
                                                           id="movieDirector">
                                                    <span class="help-block"></span>
                                                    <input type="hidden" id="directorImgPath" name="directorImg"
                                                           value="">

                                                </div>
                                                <div class="col-sm-2">
                                                    <img id="directorImg" src="${director.actorHeadImg}" alt=""
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
                                                                      id="movieDetail">${movie.movieDetail}</textarea>
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
                                                    <input type="text" name="movieDuration" value="${movie.movieDuration}"
                                                           class="form-control" id="movieDuration"
                                                           placeholder="请输入电影时长">
                                                    <span class="help-block"></span>
                                                </div>
                                                <label for="movieReleasedate" class="col-sm-2 control-label">上映时间</label>
                                                <div class="col-sm-4">
                                                    <input movie-input type="date" name="movieReleasedate"
                                                           class="form-control" id="movieReleasedate" value="${movie.movieReleasedateStr}"
                                                           placeholder="请输入电影上映时间">
                                                    <span class="help-block"></span>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="movieCountry"
                                                       class="col-sm-2 control-label">制片地区</label>
                                                <div class="col-sm-4">
                                                    <input movie-input type="text" name="movieCountry"
                                                           class="form-control" value="${movie.movieCountry}"
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
                                            <div class="form-group ">
                                                <label for="movieScore" class="col-sm-2 control-label">评分</label>
                                                <div class="col-sm-2">
                                                    <input type="text" name="movieScore" class="form-control"
                                                           value="${movie.movieScore}"
                                                           id="movieScore">
                                                </div>
                                                <label for="movieBoxoffice" class="col-sm-2 control-label">票房</label>
                                                <div class="col-sm-2">
                                                    <input type="text" name="movieBoxoffice"
                                                           value="${movie.movieBoxoffice}" class="form-control"
                                                           id="movieBoxoffice">
                                                </div>
                                                <label for="movieCommentcount"
                                                       class="col-sm-2 control-label">参评人数</label>
                                                <div class="col-sm-2">
                                                    <input type="text" name="movieCommentcount"
                                                           value="${movie.movieCommentcount}" class="form-control"
                                                           id="movieCommentcount">
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
                                             src="${movie.moviePicture}"
                                             alt="User profile picture">
                                        <p class="text-center" style="color: #000;margin-top: 10px">
                                            <button id="uploadMovieImgBtn" class="btn btn-danger">修改电影海报
                                            </button>
                                        </p>
                                    </div>
                                    <!-- /.box-body -->
                                </div>
                                <!-- /.box -->

                            </div>
                        </div>
                        <div>
                            <button type="button" id="saveBtn" class="btn btn-lg btn-primary pull-right">保存修改</button>
                        </div>
                    </section>
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


    /*
    * 修改电影
    * */

    $(function () {
        //展示电影类型
        let test = '${movie.movieType}'.split(",");
        test.pop();
        $("input[type='checkbox']").each(function () {
            for (let i = 0; i < test.length; i++) {
                if (test[i]==$(this).val()){
                    $(this).attr("checked",true);
                }
            }
        });
        //展示演员信息
        let actorHeadImg = '${actors.actorHeadImg}'.split(',');
        let actorName = '${actors.actorName}'.split(',');
        let portray='${actors.portray}'.split(',');
        for (let i = 0; i < actorName.length; i++) {
            clickNum++;
            if (clickNum % 2 !== 0) {
                let label = $("<div class='col-sm-2'></div>");
                let name = $("<div class='col-sm-3'></div>")
                    .append("<input  type='text' class='form-control' name='movieActor' value='"+ actorName[i] +"'>")
                    .append("<p>饰：</p>").append("<input m type='text' class='form-control' name='movieActorPortray' value='"+ portray[i] +"'>");
                let img = $("<img class='actor_img' src='"+ actorHeadImg[i]+"' alt=''>").addClass("img" + clickNum)
                let div = $("<div class='col-sm-2'></div>").append(img).append("<input  type='hidden' class='form-control' name='movieActorImgPath'>");
                $("#actorList").append(label).append(name).append(div);
            } else {
                let name = $("<div class='col-sm-3'></div>")
                    .append("<input m type='text' class='form-control' name='movieActor'  value='"+ actorName[i] +"'>")
                    .append("<p>饰：</p>").append("<input m type='text' class='form-control' name='movieActorPortray' value='"+ portray[i] +"'>");
                let img = $("<img class='actor_img' src='"+ actorHeadImg[i]+"' alt=''>").addClass("img" + clickNum)
                let div = $("<div class='col-sm-2'></div>").append(img).append("<input  type='hidden' class='form-control' name='movieActorImgPath'>");
                $("#actorList").append(name).append(div);
            }
        }


        console.log(actorHeadImg)
        console.log(actorName)
        console.log(portray)


    })



    $("#saveBtn").click(function () {
        console.log("发ajax下后台请求保存修改！！")

    });




</script>
</body>

</html>
<!---->