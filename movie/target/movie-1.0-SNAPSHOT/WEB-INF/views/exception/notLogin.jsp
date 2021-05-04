<%--
  Created by IntelliJ IDEA.
  User: Alishiz
  Date: 2021/5/4/0004
  Time: 18:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<jsp:forward page="/view/goLogin"/>