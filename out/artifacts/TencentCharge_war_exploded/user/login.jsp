<%--
  Created by IntelliJ IDEA.
  User: soft01
  Date: 20-1-15
  Time: 下午3:43
  
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<html>
<head>
    <script src="<%=basePath%>js/jquery-2.2.3.min.js"></script>
    <title>登录界面</title>
    <link rel="stylesheet" href="<%=basePath%>css/jq22.css">
    <link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>css/bootstrap.css">
    <style type="text/css">
        #msg2{
            color:red;
        }
    </style>
    <!-- 控制粒子 -->
    <script type="text/javascript">
        getProvince();
        function login() {
            var username = $("#name").val();
            var password = $("#userPwd").val();
            if(username == ''){
                alert("用户名不可为空！")
            }else if(password == ''){
                alert("密码不可为空！")
            }else {
                $("#loginForm").submit();
            }
        }

        function getProvince() {
            $.ajax({
                type:"POST",
                url:"<%=basePath%>province/getAll.do",
                async:false
            })
        }
    </script>
</head>
<!-- begin -->

<body>
<script type="text/javascript">

    <c:if test="${isLoginFail}">
    alert("${errorMessage}");
    </c:if>

    <c:if test="${registSuccess}">
        alert("${successInfo}")
    </c:if>
</script>
<div id="login">
    <div class="wrapper">
        <div class="login">
            <form id="loginForm" action="<%=basePath%>user/login.do" method="post" class="container offset1 loginform">
                <div id="owl-login">
                    <div class="hand"></div>
                    <div class="hand hand-r"></div>
                    <div class="arms">
                        <div class="arm"></div>
                        <div class="arm arm-r"></div>
                    </div>
                </div>
                <div class="pad">
                    <div class="control-group">
                        <div class="controls text-center">
                            <h4>游币客户登录</h4>
                        </div>
                    </div>
                    <div class="control-group">
                        &nbsp;
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <label for="name" id="nameMsg" class="glyphicon glyphicon-user"></label>
                            <input id="name" type="text" name="username" placeholder="用户名" required="required"  tabindex="1" autofocus="autofocus" class="form-control input-medium">
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <label for="userPwd" id="userPwdMsg" class="glyphicon glyphicon-th"></label>
                            <input id="userPwd" type="password" name="pwd" required="required" placeholder="密码(6-16个字符)" tabindex="2" class="form-control input-medium">
                        </div>
                    </div>

                </div>
                <div class="form-actions"><a href="#" tabindex="5" class="btn pull-left btn-link text-muted"  style="color:red">忘记密码?</a><a href="<%=basePath%>/user/register.jsp" tabindex="4" class="btn btn-link text-muted"  style="color:red">新用户注册</a>
                    <button type="button" tabindex="3"  class="btn btn-primary" onclick="login()">登录</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript" src="<%=basePath%>js/canvas-particle.js"></script>
<script src="<%=basePath%>js/jquery.min.js"></script>

<script type="text/javascript">
    window.onload = function(){
        var config = {
            vx: 4,
            vy:  4,
            height: 2,
            width: 2,
            count: 300,
            color: "121, 162, 185",
            stroke: "100,200,180",
            dist: 6000,
            e_dist: 20000,
            max_conn: 10
        };
        CanvasParticle(config);
    };




</script>
<script>
    $(function() {

        $('#login #userPwd').focus(function() {
            $('#owl-login').addClass('password');
        }).blur(function() {
            $('#owl-login').removeClass('password');
        });
    });
</script>
<!-- end -->
</body>
</html>
