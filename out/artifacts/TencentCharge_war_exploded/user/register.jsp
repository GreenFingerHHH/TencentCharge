<%--
  Created by IntelliJ IDEA.
  User: soft01
  Date: 20-1-15
  Time: 下午3:48
  
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>--%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<html>
<head>
    <script src="<%=basePath%>js/jquery-2.2.3.min.js"></script>
    <title>注册界面</title>
    <link rel="stylesheet" href="<%=basePath%>css/jq22.css">
    <link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>css/bootstrap.css">
    <script src="<%=basePath%>js/laydate/laydate.js"></script>
    <script src="<%=basePath%>js/jquery-1.7.2.min.js"></script>
    <style type="text/css">
        .red{
            color:red;
        }
        .green{
            color:green;
        }
    </style>
    <script type="text/javascript">

        var nameFlag = false;
        var pwdFlag = false;
        var phoneFlag = false;
        var birthdayFlag = false;
        var provinceFlag = false;

        var sumFlag = false;

        function confirmUsername() {
            var reg = /[A,z]([A,z]|[0,9]){5,11}/
            var username = $("#userName").val();
            var result = $("#resultImg");
            var resultNews = $("#resultInfo");
            if(username == ''){
                result.attr("src","<%=basePath%>usedimg/chacha.ico");
                result.attr("style","width:16px;height:16px")
                resultNews.attr("style","color:red")
                resultNews.text("用户名不可为空！");
                nameFlag = false;
            } else if(username.length<6||username.length>12){
                result.attr("src","<%=basePath%>usedimg/chacha.ico");
                result.attr("style","width:16px;height:16px")
                resultNews.attr("style","color:red")
                resultNews.text("用户名长度为6~12位！");
                nameFlag = false;
            }else if(reg.test(username)){
                result.attr("src","<%=basePath%>usedimg/chacha.ico");
                result.attr("style","width:16px;height:16px")
                resultNews.attr("style","color:red")
                resultNews.text("用户名不可包含特殊字符");
                nameFlag = false;
            } else {
               $.ajax({
                   type:"POST",
                   url:"<%=basePath%>user/getUser.do",
                   data:({
                      "username":username
                   }),
                   success:function (msg) {
                       if (msg=="true"){
                           result.attr("src","<%=basePath%>usedimg/chacha.ico");
                           result.attr("style","width:16px;height:16px")
                           resultNews.attr("style","color:red")
                           resultNews.text("该用户名已存在！");
                           nameFlag = false;
                       }else{
                           result.attr("src","<%=basePath%>usedimg/duigou.ico");
                           result.attr("style","width:20px;height:16px")
                           resultNews.attr("style","color:green")
                           resultNews.text("该用户名可以使用！");
                           nameFlag = true;
                       }
                   }
               })
            }
        }

        function passwordConfirm() {
            conPasswordConfirm();
            var passwordInput = $("#userPwd").val();
            var result = $("#pwdImg");
            var resultNews = $("#pwdInfo");
            if(passwordInput.length<6||passwordInput.length>16){
                result.attr("src","<%=basePath%>usedimg/chacha.ico");
                result.attr("style","width:16px;height:16px")
                resultNews.attr("style","color:red")
                resultNews.text("密码长度为6~16位！");
                pwdFlag = false;
            }else{
                result.attr("src","<%=basePath%>usedimg/duigou.ico");
                result.attr("style","width:20px;height:16px")
                resultNews.attr("style","color:green")
                resultNews.text("密码可以使用！");
                pwdFlag = true;
            }
        }

        function conPasswordConfirm() {
            var oldPwd = $("#userPwd").val();
            var passwordInput = $("#userPwd2").val();
            var result = $("#confirmImg");
            var resultNews = $("#confirmPwdInfo")
            if(oldPwd!=passwordInput){
                result.attr("src","<%=basePath%>usedimg/chacha.ico");
                result.attr("style","width:16px;height:16px")
                resultNews.attr("style","color:red")
                resultNews.text("两次密码输入不一致");
                pwdFlag = false;
            }else if(passwordInput==""){
                result.attr("src","<%=basePath%>usedimg/chacha.ico");
                result.attr("style","width:16px;height:16px")
                resultNews.attr("style","color:red")
                resultNews.text("密码不可为空！");
                pwdFlag = false;
            } else {
                result.attr("src","<%=basePath%>usedimg/duigou.ico");
                result.attr("style","width:20px;height:16px")
                resultNews.attr("style","color:green")
                resultNews.text("密码可以使用！");
                pwdFlag = true;
            }
        }

        function phoneConfirm() {

            var phoneNumber = $("#Number").val();
            var regExp = /1\d{10}/;
            var result = $("#phoneImg");
            var resultNews = $("#phoneInfo");
            if(regExp.test(phoneNumber)){
                if (phoneNumber.length!=11){
                    result.attr("src","<%=basePath%>usedimg/chacha.ico");
                    result.attr("style","width:16px;height:16px")
                    resultNews.attr("style","color:red")
                    resultNews.text("手机号格式错误！");
                    phoneFlag = false;
                }else {
                    $.ajax({
                        type:"POST",
                        url: "<%=basePath%>user/getUserByPhone.do",
                        data: ({
                            "phoneNumber":phoneNumber
                        }),
                        success:function (msg) {
                            if (msg == "true"){
                                result.attr("src","<%=basePath%>usedimg/chacha.ico");
                                result.attr("style","width:16px;height:16px")
                                resultNews.attr("style","color:red")
                                resultNews.text("该手机号已被注册！");
                                phoneFlag = false;
                            }else {
                                result.attr("src","<%=basePath%>usedimg/duigou.ico");
                                result.attr("style","width:20px;height:16px")
                                resultNews.attr("style","color:green")
                                resultNews.text("该手机号可以使用！");
                                phoneFlag = true;
                            }

                        }
                    })
                }

            }else {
                result.attr("src","<%=basePath%>usedimg/chacha.ico");
                result.attr("style","width:16px;height:16px")
                resultNews.attr("style","color:red")
                resultNews.text("手机号格式错误！");
                phoneFlag = false;
            }
        }

        function birthdayInput() {

            var birthday = $("#birthday").val();
            var result = $("#birthdayImg");
            var resultNews = $("#birthdayInfo");
            var birthdayDate = new Date(birthday).getTime();
            var today = new Date().getTime();
            if (birthday == ""){
                result.attr("src","<%=basePath%>usedimg/chacha.ico");
                result.attr("style","width:16px;height:16px")
                resultNews.attr("style","color:red")
                resultNews.text("未输入生日！");
                birthdayFlag = false;
            }else if(birthdayDate-today>=0){
                result.attr("src","<%=basePath%>usedimg/chacha.ico");
                result.attr("style","width:16px;height:16px")
                resultNews.attr("style","color:red")
                resultNews.text("日期选择错误!");
                birthdayFlag = false;
            } else{
                result.attr("src","<%=basePath%>usedimg/duigou.ico");
                result.attr("style","width:20px;height:16px")
                resultNews.attr("style","color:green")
                resultNews.text("已正确输入！");
                birthdayFlag = true;
            }

        }
        function provinceInput() {

            var province = $("#provinceSelect").val();
            var result = $("#provinceImg");
            var resultNews = $("#provinceInfo");
            if (province == "-1"){
                result.attr("src","<%=basePath%>usedimg/chacha.ico");
                result.attr("style","width:16px;height:16px")
                resultNews.attr("style","color:red")
                resultNews.text("未选择所在省份！");
                provinceFlag = false;
            }else {
                result.attr("src","<%=basePath%>usedimg/duigou.ico");
                result.attr("style","width:20px;height:16px")
                resultNews.attr("style","color:green")
                resultNews.text("已选择省份！");
                provinceFlag = true;
            }

        }
        function register() {

            confirmUsername();
            passwordConfirm();
            phoneConfirm();
            birthdayInput();
            provinceInput();
            if (nameFlag&&pwdFlag&&phoneFlag&&birthdayFlag&&provinceFlag){
                // console.log(nameFlag)
                // console.log(pwdFlag)
                // console.log(phoneFlag)
                // console.log(birthdayFlag)
                // console.log(provinceFlag)
                $("#userRegister").submit();
            }
            // else {
            //     console.log(nameFlag)
            //     console.log(pwdFlag)
            //     console.log(phoneFlag)
            //     console.log(birthdayFlag)
            //     console.log(provinceFlag)
            // }

        }

    </script>
</head>
<body >
<!-- begin -->
<div id="login">
    <div class="wrapper">
        <div class="login">
            <form id="userRegister" action="<%=basePath%>user/registerUser.do" method="post" class="container offset1 loginform" >
                <div id="owl-login">
                    <div class="hand"></div>
                    <div class="hand hand-r"></div>
                    <div class="arms">
                        <div class="arm"></div>
                        <div class="arm arm-r"></div>
                    </div>
                </div>
                <div class="pad" style="width: 365px;">
                    <div class="control-group">
                        <div class="controls text-center">
                            <h4>游币用户注册</h4>
                        </div>
                    </div>
                    <div class="control-group">
                        &nbsp;
                    </div>

                    <div class="control-group" style="width: 400px" >
                        <div class="controls" >
                            <label for="userName" id="userNameMsg" class="glyphicon glyphicon-user"></label>
                            <input id="userName" type="text" name="userName"  placeholder="姓名(6—12个字符)" autofocus="autofocus" required="required" tabindex="1"  class="form-control input-medium" style="width: 306px" oninput="confirmUsername()">
                            <div id="nameResult">
                                <img id="resultImg">
                                <span id="resultInfo" ></span>
                            </div>
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <label for="userPwd"  id="userPwdMsg" class="glyphicon glyphicon-th"></label>
                            <input id="userPwd" type="password" name="userPwd" placeholder="密码(6-16个字符)" required="required" tabindex="2" class="form-control input-medium" oninput="passwordConfirm()">

                            <div >
                                <img id="pwdImg">
                                <span id="pwdInfo" ></span>
                            </div>
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <label for="userPwd2" id="userPwdMsg2"  class="glyphicon glyphicon-th"></label>
                            <input id="userPwd2" type="password"  placeholder="确认密码" required="required" tabindex="3" class="form-control input-medium" oninput="conPasswordConfirm()">
                            <div >
                                <img id="confirmImg">
                                <span id="confirmPwdInfo" ></span>
                            </div>
                        </div>
                    </div>

                    <div class="control-group">
                        <div class="controls">
                            <label for="Number"  class="glyphicon glyphicon-user"></label>
                            <input id="Number" type="text" name="phone" placeholder="手机号码 " required="required"  tabindex="4"  class="form-control input-medium" oninput="phoneConfirm()">
                            <div >
                                <img id="phoneImg">
                                <span id="phoneInfo" ></span>
                            </div>
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <input type="radio" name="sex" value="男"  tabindex="5" checked="checked"/>男
                            <input type="radio" name="sex" value="女"  tabindex="6"/>女
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <label for="birthday" id="birthdayMsg" class="glyphicon glyphicon-user"></label>
                            <input id="birthday" type="text" name="birthday"  placeholder="生日 " required="required"  tabindex="7"  class="form-control input-medium" onclick="laydate()">
                            <div >
                                <img id="birthdayImg">
                                <span id="birthdayInfo" ></span>
                            </div>
                        </div>
                    </div><div class="control-group">
                        <div class="controls">
                                <select id="provinceSelect" name="province" class="form-control input-medium">
                                    <option value="-1">请选择所在省份</option>
                                    <c:forEach items="${provinces}" var="province">
                                        <option value="${province.provId}">${province.provName}</option>
                                    </c:forEach>
                                </select>
                            <div >
                                <img id="provinceImg">
                                <span id="provinceInfo" ></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-actions">
                    <a href="<%=basePath%>user/login.jsp" tabindex="9" class="btn btn-link text-muted " style="color:red">返回登录</a>
                    <button type="button" tabindex="8" class="btn btn-primary" onclick="register()">点击注册</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script type="text/javascript" src="<%=basePath%>js/canvas-particle.js"></script>
<script src="<%=basePath%>js/jquery.min.js"></script>
<script type="text/javascript" >
    $(function() {

        $('#login #userPwd,#login #userPwd2').focus(function() {
            $('#owl-login').addClass('password');
        }).blur(function() {
            $('#owl-login').removeClass('password');
        });
        var config = {
            vx: 4,
            vy:  4,
            height: 2,
            width: 2,
            count: 300,
            color: "121, 162, 185",
            stroke: "100,200,180",
            dist: 8000,
            e_dist: 60000,
            max_conn: 10
        };
        CanvasParticle(config);

    });
</script>

<!-- end -->
</body>
</html>
