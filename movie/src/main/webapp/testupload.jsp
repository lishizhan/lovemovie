<%--
  Created by IntelliJ IDEA.
  User: Alishiz
  Date: 2021/5/14/0014
  Time: 23:50
  To change this template use File | Settings | File Templates.
--%>
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

    <link rel="stylesheet" href="static/bootstrap/bootstrap-fileinput/css/fileinput.css">
    <script src="static/bootstrap/Jquery/jquery.min.js"></script>
    <script src="static/bootstrap/bootstrap-fileinput/js/fileinput.min.js"></script>
    <script src="static/bootstrap/bootstrap-fileinput/js/locales/zh.js"></script>
    <title>Document</title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-4">

            <form id="perForm" class="add_form" enctype="multipart/form-data">
                <input type="text" id="name" name="name"  maxlength="20">
                <input type="text" id="age" name="age"  maxlength="20">
                <input type="file" class="file-loading" name="file" id="upload_img_input" multiple/>
                <input type="button" value="保存" onclick="save()">
            </form>

        </div>
        <div class="col-md-4"></div>
        <div class="col-md-4"></div>
    </div>
</div>
</body>
</html>
<script>
    var commId;

    //点击保存按钮
    function save() {
        if ($('#upload_img_input').fileinput("getFilesCount") <= 0) {//获取文件个数
            alert("请上传图片")
            return;
        }
        var formData = new FormData($('#perForm')[0]);
        $.ajax({
            url: 'movie/fileUpload',
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
                if (result.status == 1) {
                    var id = result.data.id;
                    commId = id;
                    $('#upload_img_input').fileinput('upload');//出发开始上传文件
                } else {

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
            uploadUrl: 'file/imgSave',  //上传路径
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
            uploadExtraData: function (previewId, index) {
                return {
                    'id': commId
                };
            }//上传时携带的额外的参数
        }).on("filebatchuploadsuccess", function (event, data) {
            if (data.response.status == 1) {
                alert('上传成功');
            }
        });


    });


</script>