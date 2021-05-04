<%--
  Created by IntelliJ IDEA.
  User: Alishiz
  Date: 2021/5/4/0004
  Time: 16:42
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
    <title>Document</title>
</head>
<body>

<div class="jumbotron text-center">
    <h1>${errorMsg}</h1>
    <a href="index" class="btn btn-danger">返回首页首页</a>
</div>
</body>
</html>