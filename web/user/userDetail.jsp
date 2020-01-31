<%--
  Created by IntelliJ IDEA.
  User: soft01
  Date: 20-1-15
  Time: 下午3:50
  
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<html>
<head>
    <script src="<%=basePath%>js/jquery-2.2.3.min.js"></script>
    <title>游币游戏详情</title>
    <link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>css/index.css" />
    <script src="<%=basePath%>js/bootstrap.min.js"></script>


</head>
<body>

<div class="container">
    <nav class="navbar navbar-default" >
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#example-navbar-collapse">
                <span class="sr-only">切换导航</span> <span class="icon-bar"></span> <span
                    class="icon-bar"></span> <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="portal.html">游币手机下载门户网站</a>
        </div>
        <div class="collapse navbar-collapse" id="example-navbar-collapse">
            <ul class="nav navbar-nav">

            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown"><a href="#">欢迎XXX</a>
                </li>

                <li class="dropdown"><a href="login.html" >登录</a>
                </li>
                <li class="dropdown"><a href="register.html" >注册</a>
                </li>

                <li class="dropdown"><a href="#" class="dropdown-toggle "
                                        data-toggle="dropdown">个人中心<b class="caret"></b> </a>
                    <ul class="dropdown-menu">
                        <li><a data-toggle="modal"
                               data-target="#myModal">密保卡充值</a></li>
                        <li><a href="prepaid.html">充值记录</a></li>
                        <li><a href="userDetail.html">账户信息</a></li>
                        <li><a href="expense.html">消费记录</a></li>
                        <li class="divider"></li>
                        <li><a href="login.html">退出</a></li>
                    </ul>
                </li>

            </ul>
        </div>
    </nav>
</div>
<div class="modal fade" id="myModal" tabindex="-1" >
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                >&times;</button>
                <h4 class="modal-title" id="myModalLabel">密保卡充值</h4>
            </div>
        </div>
    </div>
</div>

<div class="row" style="background-color:#CCC; 
	overflow:hidden;" onLoad="init()">
    <div class="col-md-12">
        <ul class="nav nav-pills col-md-offset-3" >
            <li class=><a href="portal.html" class="btn btn-primary">首页</a></li>

            <li><a href="" class="btn btn-primary">棋牌游戏</a></li>
            <li><a href="" class="btn btn-primary">棋牌游戏</a></li>
            <li><a href="" class="btn btn-primary">棋牌游戏</a></li>
            <li><a href="" class="btn btn-primary">棋牌游戏</a></li>
            <li><a href="" class="btn btn-primary">棋牌游戏</a></li>


        </ul>
    </div>
</div>


<div class="row">&nbsp;</div>
<div class="container">
    <div class="row">
        <div class="col-md-6">
            <div class="table-responsive">
                <table class="table table-striped table-hover">
                    <caption>账户详情</caption>
                    <tbody>
                    <tr>
                        <td><strong>用户名:</strong>lufei</td>
                    </tr>
                    <tr>
                        <td><strong>密码:</strong>123456</td>
                    </tr>
                    <tr>
                        <td><strong>性别:</strong>男</td>
                    </tr>
                    <tr>
                        <td><strong>生日:</strong>
                            2017-05-01 12:16:19
                        </td>
                    </tr>
                    <tr>
                        <td><strong>手机号码:</strong>17726824589</td>
                    </tr>
                    <tr>
                        <td><strong>话费余额:</strong>5</td>
                    </tr>
                    <tr>
                        <td><strong>游币余额:</strong>68</td>
                    </tr>
                    <tr>
                        <td><strong>密保额度:</strong>100</td>
                    </tr>

                    <tr>
                        <td><strong>密保额度有效结束时间:</strong>
                            2017-06-01 12:16:19
                        </td>
                    </tr>

                    </tbody>
                </table>

                <a class="btn btn-warning" >返回上页</a>
                <a class="btn btn-primary" >修改密码</a>
            </div>
        </div>
    </div>
</div><div class="row">
    <div class="container">
        <hr/>
        <div class="col-md-4 col-md-offset-5">
            &copy;2016-2017 portal.com 版权所有
        </div>
    </div>
</div>
</body>

</html>
