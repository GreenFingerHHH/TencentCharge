<%--
  Created by IntelliJ IDEA.
  User: soft01
  Date: 20-1-15
  Time: 下午4:03
  
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
    <title>游币管理员后台登录页面</title>
    <script src="<%=basePath%>js/jquery-2.2.3.min.js"></script>
    <link rel="stylesheet" href="<%=basePath%>css/style.css">
    <link rel="stylesheet" href="<%=basePath%>css/bootstrap.css">

    <script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
    <!-- MAIN EFFECT -->
    <script type="text/javascript" src="<%=basePath%>js/bootstrap.js"></script>

    <link rel="shortcut icon" href="<%=basePath%>assets/ico/minus.png">

    <style type="text/css">
        #zhong {
            margin-top: 200px;
        }

        #yzmsj {
            display: none;
        }

        #1 {
            color: green;
        }
    </style>

    <script type="text/javascript">

        function banCode() {
            $("#showCode").attr("disabled",false);
            $("#showCode").val("已失效");
        }
        function getCode() {
            var showDiv = $("#showPhone");
            $.ajax({
                type:"POST",
                url:"<%=basePath%>manager/getPhone.do",
                data:({
                    "username":$("#inputUsername").val()
                }),
                success:function (msg) {
                    if(msg == "error"){
                        showDiv.text("该管理员账号不存在！");
                        return
                    }else{
                        showDiv.text("已发送验证码到"+msg+"，有效期五分钟！");
                        var array = new Array('A','B','C','D','E','F','G','H','I','J','K',
                            'L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'
                            ,'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f','g','h','i','j','k','l'
                            ,'l','m','n','o','p','q','r','s','t','u','v','w','x','y','z');
                        var code1 = array[parseInt(Math.random()*50)];
                        var code2 = array[parseInt(Math.random()*50)];
                        var code3 = array[parseInt(Math.random()*50)];
                        var code4 = array[parseInt(Math.random()*50)];
                        var code=code1+code2+code3+code4;
                        $("#showCode").val(code);
                        $("#showCode").attr("disabled",true);
                        setTimeout(banCode,300000);
                    }


                }
            })

        }

        function login() {
            var username = $("#inputUsername").val();
            var password = $("#pwd").val();
            var codeInput = $("#inputverificationcode").val();
            var codeShow = $("#showCode").val();
            if(username == ""){
                alert("用户名不可为空！");
            }else if(password == ""){
                alert("密码不可为空");
            }else if(codeShow.toUpperCase() != codeInput.toUpperCase()||codeInput =="获取验证码"){
                alert("验证码输入错误！请重新输入！");
                getCode();
            }else {
                $("#login").submit();
            }

        }
    </script>
</head>
<body>
<script type="text/javascript">

<c:if test="${isLoginFail}">
        alert("${errorMessage}");
</c:if>
</script>

<div id="preloader" ></div>
<div class="container">
    <div id="zhong" style="border: #0a0a0a solid 1px">
        <div class="" id="login-wrapper">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <div id="logo-login">
                        <h1>游币后台登录页面</h1>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <div class="account-box">
                        <form id="login" action="<%=basePath%>manager/login.do"
                              method="post">

                            <div class="row" >
                                <div class="col-sm-9" style="width: 330px">
                                    <label for="inputUsername">用户名</label>
                                    <div class="row">
                                        <div class="col-xs-8 col-sm-12">
                                            <input type="text" id="inputUsername" name="username"
                                                   required="required" class="form-control">
                                        </div>
                                        <div class="col-xs-3 col-sm-5">
                                            <span id="1"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-9" style="width: 330px">
                                    <label for="pwd">密码</label> <input
                                        id="pwd"
                                        type="password" name="password"
                                                                       required="required"
                                                                       class="form-control">
                                </div>
                            </div>


                            <div class="row">
                                <div class="col-sm-9">
                                    <label for="inputverificationcode">验证码</label>
                                    <div class="row">
                                        <div class="col-xs-8 col-sm-8">
                                            <input id="inputverificationcode" name="verification" type="text" required="required"  class="form-control" >
                                        </div>
                                        <div class="col-xs-2 col-sm-2">
                                            <input style="width: 100px;height: 34px" type="button" class="btn btn-warning" onclick="getCode()" value="获取验证码" id="showCode">
<%--                                            <input style="width: 100px;height: 34px" class="btn btn-warning" type="button"  id="btn"--%>
<%--                                                   value="获取验证码" onclick="getCode()"/>--%>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-9" style="width: 330px">
                                    <span id="showPhone"></span>
                                </div>
                            </div>


                            <div ></div>

                            <div class="row">
                                &nbsp;
                            </div>
                            <button id="start" class="btn btn btn-primary "  type="button" onclick="login()">登 录
                            </button>
                        </form>
                        <a class="forgotLnk" href="index.jsp"></a>
                        <div class="row-block">
                            <div class="row"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
