<%--
  Created by IntelliJ IDEA.
  User: Alishiz
  Date: 2021/5/11/0011
  Time: 13:32
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
    <script src="static/bootstrap/Jquery/jquery.min.js"></script>
    <script src="static/bootstrap/js/bootstrap.min.js"></script>

    <style>
        ul{
            list-style: none;
            margin: 0;
            padding: 0;
        }
        li{
            float: left;
            margin-left: 10px;
        }


    </style>
    <title>Document</title>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <img src="upload/movies/5f924d9892aa404f9371b4977238f620.jpg" alt="图片加载失败">
            </div>
            <ul id="imglist">
               <!-- <li>
                    <img src="" alt="" width="180px" height="220px">
                </li>-->
            </ul>
            
        </div>
    </div>
    <script>
        $(function () {
            $.ajax({
                url:"movie/findAllMovies",
                data:{
                    "pageNum":0,
                    "pageSize":5
                },
                type:"get",
                success:function (res) {
                    console.log(res);
                    $.each(res.extend.movieList.list,function (index,item) {
                        let li = $("<li></li>");
                        let img = $("<img alt='图片加载失败' width='180px' height='220px'>")
                        img.attr("src",item.moviePicture);
                        li.append(img);
                        li.appendTo("#imglist")
                    })
                }
            });
        })




    </script>

</body>
</html>