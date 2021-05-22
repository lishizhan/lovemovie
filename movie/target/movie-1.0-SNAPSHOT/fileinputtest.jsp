<%--
  Created by IntelliJ IDEA.
  User: Alishiz
  Date: 2021/5/14/0014
  Time: 18:10
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
            <form enctype="multipart/form-data">
                <input type="file" name="file" class="file" id="txt_file" data-min-file-count="1">
            </form>


        </div>
        <div class="col-md-4">
            <form enctype="multipart/form-data">
                <input type="text" class="form-control" name="userName" placeholder="姓名">
                <input type="file" name="file" id="file" data-min-file-count="1">
            </form>
        </div>
        <div class="col-md-4">

            <div>
                <img src="" id="imgs">
            </div>

            <input type="file" id="imgInput">


        </div>
    </div>
</div>

</body>
</html>
<script type="text/javascript">
    $("#imgInput").change(function () {
        $("#imgs").attr("src", URL.createObjectURL($(this)[0].files[0]));
    });

    // 初始化
    $(document).ready(function () {
        $('#file').fileinput({
            language: 'zh',     //设置语言
            dropZoneEnabled: true,      //是否显示拖拽区域
            dropZoneTitle: "上传头像",    //拖拽区域显示文字
            uploadUrl: 'file/imgSave',  //上传路径
            showCaption: false,//是否显示标题
            showUpload : false,//是否显示上传按钮
            allowedFileExtensions: ['jpg', 'png', 'jpeg'],   //指定上传文件类型
            maxFileSize: 2048,   //上传文件最大值，单位kb
            uploadAsync: true,  //异步上传
            maxFileCount: 1,  //上传文件最大个数。
            autoReplace: true,
            showRemove:false,
            fileActionSettings: {
                showUpload: false,
            },
        }).on("fileuploaded", function (event, data) { //异步上传成功后回调
            console.log(data);		//data为返回的数据
        });




    });


</script>
<!--
/**
* 初始设置
* language指定语言
* uploadURl指定文件上传的后台路径
* allowedPreviewTypes允许文件上传的类型
*/
$("#myfileupload").fileinput({
language:'zh',
uploadUrl: "",
allowedPreviewTypes:['jpg','png']
});
/**
* 上传文件失败后调用方法（回调函数）
*/
$("#myfileupload").on('fileuploaderror',function (event,data,previewId,index) {
var form =data.form,
files = data.files,
extra = data.extra,
response=data.response,
reader = data.reader;
console.log(data);
console.log("File upload error");
})
/**
* 文件错误，比如文件类型错误 调用方法（回调函数）
*/
$("#myfileupload").on('fileerror',function (event,data) {
console.log(data.id);
console.log(data.index);
console.log(data.file);
console.log(data.reader);
console.log(data.files);

})
/**
* 文件上传成功后 调用方法（回调函数）
*/
$("#myfileupload").on('fileuploaded',function (event,data,previewId,index) {

var form = data.form,
files = data.files,
extra = data.extra,
response = data.response,
reader = data.reader;
//服务器文件地址
alert(data.response.fileUrl);
console.log("File upload trigered");


})-->
