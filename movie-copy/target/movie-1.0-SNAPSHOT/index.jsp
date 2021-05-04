<%--
  Created by IntelliJ IDEA.
  User: Alishiz
  Date: 2021/4/27/0027
  Time: 14:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<jsp:forward page="index"/>