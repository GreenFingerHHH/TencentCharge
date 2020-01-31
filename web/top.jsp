<%--
  Created by IntelliJ IDEA.
  User: soft01
  Date: 20-1-15
  Time: 下午4:05
  
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<html>
<head>
    <base href="<%=basePath%>">
    <script src="<%=basePath%>js/jquery-2.2.3.min.js"></script>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">

    <script src="<%=basePath%>js/bootstrap.min.js"></script>
    <script src="<%=basePath%>js/calendar/calendar.js"></script>

    <script type="text/javascript">

        function showTime() {
            var showTime = $("#showTime")
            var date = new Date();
            // var time = date.getFullYear()+"年"+date.getMonth()+"月"+date.getD

            showTime.text(date.getFullYear()+"年"+date.getMonthFormatted()+"月"+date.getDateFormatted()+"日");
        }
    </script>



    <style type="text/css">
    </style>
    <title>Title</title>
</head>
<body onload="showTime()">
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed"
                    data-toggle="collapse" data-target="#navbar" >
                <span class="icon-bar"></span> <span class="icon-bar"></span> <span
                    class="icon-bar"></span>
            </button>
            <a class="navbar-brand">游币后台管理系统</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse ">
            <ul class="nav navbar-nav ">
                <li><a>${manager.userAccount}</a></li>
                <li><a id="showTime"></a></li>

            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="<%=basePath%>manager/logout.do" target="_top">退出</a></li>
            </ul>
        </div>
    </div>

</nav>


</body>
</html>
