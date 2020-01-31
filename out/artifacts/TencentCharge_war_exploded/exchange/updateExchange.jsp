<%--
  Created by IntelliJ IDEA.
  User: soft01
  Date: 20-1-15
  Time: 下午3:25
  
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<html>
<head>
    <title>修改游戏类型</title>
    <script src="<%=basePath%>js/jquery-2.2.3.min.js"></script>
    <link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
    <script src="<%=basePath%>js/jquery.js"></script>
    <script src="<%=basePath%>js/bootstrap.min.js"></script>
    <style type="text/css">
        #container {
            margin-top: -20px;
            margin-left: 10px;
        }
    </style>
</head>
<body>
<div id="container">
    <div class="page-header text-center">
        <h2>修改对应省份游币兑换比例</h2>
    </div>
    <div class="row">
        <div class="col-xs-6 col-sm-4 col-md-offset-4">
            <form class="form-horizontal" action="" >
                <table class="table table-bordered table-condensed ">
                    <thead></thead>
                    <tbody>
                    <tr class="text-center">
                        <td>省份名</td>
                        <td>
                            <div class="col-sm-4">
                                <div class="radio">
                                    <input type="text" disabled="disabled" value="北京"/>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr class="text-center">
                        <td>兑换状态</td>
                        <td>
                            <div class="col-sm-4">
                                <div class="radio">

                                    <label>
                                        <input type="radio" name="exchangeStatus" value="1" checked> 商用
                                    </label>
                                    <label>
                                        <input type="radio" name="exchangeStatus" value="2"> 下线
                                    </label>

                                </div>
                            </div></td>
                    </tr>
                    <tr class="text-center">
                        <td>兑换比例</td>
                        <td>
                            <div class="col-sm-4">
                                <div class="radio">
                                    <input type="text" value="5" />
                                </div>
                            </div></td>
                    </tr>
                    </tbody>
                </table>
                <div class="row">
                    <div class="col-xs-6 col-sm-7">
                        <div class="form-group">
                            <div class="col-sm-offset-4 col-sm-4">
                                <input  class="btn btn-primary" value="确认修改" />
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-4">
                        <div class="form-group">
                            <div class=" col-sm-11">
                                <button class="btn btn-warning" >返回上一页</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>

        </div>
    </div>
</div>
</body>
<style>
    td {
        vertical-align: middle !important;
    }
</style>
</html>
