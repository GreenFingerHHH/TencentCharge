<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: soft01
  Date: 20-1-15
  Time: 下午3:36
  
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
    <title>修改游戏类型</title>


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
<script type="text/javascript">
    <c:if test="${isFail}">
    alert("${errorInfo}")
    </c:if>
</script>
<div id="container">
    <div class="page-header text-center">
        <h2>修改游戏类型</h2>
    </div>
    <div class="row">
        <div class="col-xs-6 col-sm-4 col-md-offset-4">
            <form class="form-horizontal" action="<%=basePath%>gameType/updateGameType.do" method="post">
                <table class="table table-bordered table-condensed ">
                    <thead></thead>
                    <tbody>
                    <tr class="text-center">
                        <td>类型名称</td>
                        <td>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="typeName" value="${gameType.typeName}" required="required">

                            </div></td>
                    </tr>
                    <tr class="text-center">
                        <td>状态</td>
                        <td>
                            <div class="col-sm-4">
                                <div class="radio">

                                    <label> <input id="c1" type="radio" name="typeStatus"
                                                   value="1" > 商用 </label>
                                    <label> <input id="c2" type="radio" name="typeStatus"
                                                   value="2"> 下线</label>
                                    <script type="text/javascript">
                                        <c:if test="${gameType.typeStatus==1}">
                                        $("#c1").attr("checked",true)
                                        </c:if>
                                        <c:if test="${gameType.typeStatus==2}">
                                        $("#c2").attr("checked",true)
                                        </c:if>
                                    </script>
                                </div>
                            </div></td>
                    </tr>
                    </tbody>
                </table>
                <div class="row">
                    <div class="col-xs-6 col-sm-7">
                        <div class="form-group">
                            <div class="col-sm-offset-4 col-sm-4">
                                <input type="hidden" name="typeId" value="${gameType.typeId}">
                                <input type="submit" class="btn btn-primary" value="确认修改" />
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
