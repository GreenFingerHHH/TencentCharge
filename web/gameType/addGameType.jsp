<%--
  Created by IntelliJ IDEA.
  User: soft01
  Date: 20-1-15
  Time: 下午3:36

  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<html>
<head>
    <script src="<%=basePath%>js/jquery-2.2.3.min.js"></script>
    <title>添加游戏类型</title>


    <link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
    <script src="<%=basePath%>js/jquery.js"></script>
    <script src="<%=basePath%>js/bootstrap.min.js"></script>
    <style type="text/css">
        #container {
            margin-top: -20px;
            margin-left: 10px;
        }
    </style>

    <script type="text/javascript">
        function addGameType() {

            var typename = $("#typeName").val();
            if (typename.length<3||typename.length>8){
                alert("游戏类型名错误！（3-8位）");
            }else {
                $("#add").submit();
            }
        }
    </script>
</head>
<body>
<script type="text/javascript">
    <c:if test="${isFail}">
        alert("${errorInfo}")
    </c:if>
</script>
<div id="container">
    <div class="page-header text-center">
        <h2>添加游戏类型</h2>
    </div>
    <div class="row">
        <div class="col-xs-6 col-sm-4 col-md-offset-4">
            <form class="form-horizontal" id="add" action="<%=basePath%>gameType/addGameType.do" enctype="multipart/form-data" method="post">
                <table class="table table-bordered table-condensed ">
                    <thead></thead>
                    <tbody>
                    <tr class="text-center" >
                        <td style="width: 100px;">类型名称</td>
                        <td>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="typeName" name="typeName" value="" required="required">

                            </div></td>
                    </tr>
                    <tr class="text-center">
                        <td style="width: 100px;">状态</td>
                        <td>
                            <div class="col-sm-4">
                                <div class="radio">

                                    <label> <input type="radio" name="typeStatus"
                                                   value="1" checked="checked"> 商用 </label>
                                    <label> <input type="radio" name="typeStatus"
                                                   value="2"> 下线</label>
                                </div>
                            </div></td>
                    </tr>
                    <tr class="text-center">
                        <td style="width: 100px;">类型图片</td>
                        <td>
                            <div class="col-sm-4">
                                <input type="file" name="file" required="required">
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <div class="row">
                    <div class="col-xs-6 col-sm-7">
                        <div class="form-group">
                            <div class="col-sm-offset-4 col-sm-4">
                                <input type="button" class="btn btn-primary" value="确认添加" onclick="addGameType()"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-4">
                        <div class="form-group">
                            <div class=" col-sm-11">
                                <button class="btn btn-warning" ><a href="<%=basePath%>gameType/gametype.jsp">返回上一页</a></button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>

        </div>
    </div>
</div>
</body>
</html>
