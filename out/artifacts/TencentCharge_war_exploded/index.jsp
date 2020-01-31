<%--
  Created by IntelliJ IDEA.
  User: soft01
  Date: 20-1-15
  Time: 下午3:59
  
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<html>
<head>
    <title>游币后台管理系统</title>
    <script src="<%=basePath%>js/jquery-2.2.3.min.js"></script>
    <link href="<%=basePath%>css/ie10-viewport-bug-workaround.css" rel="stylesheet">
    <link href="<%=basePath%>css/dashboard.css" rel="stylesheet">
    <script src="<%=basePath%>js/ie-emulation-modes-warning.js"></script>
    <link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">
    <script src="<%=basePath%>js/bootstrap.min.js"></script>
</head>
<frameset rows="5%,*">
    <frame src="<%=basePath%>/top.jsp" noresize="no"></frame>
    <frameset cols="10%,*">
        <frame src="<%=basePath%>left.jsp" noresize="no"></frame>
        <frame src="<%=basePath%>user/user.jsp" name="right"></frame>
    </frameset>
</frameset>
</html>
