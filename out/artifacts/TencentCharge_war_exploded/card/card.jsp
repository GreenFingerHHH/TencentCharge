<%--
  Created by IntelliJ IDEA.
  User: soft01
  Date: 20-1-15
  Time: 下午2:55
  
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<html>
<head>


    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/bootstrap-select.css">
    <link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="<%=basePath%>js/jquery-2.2.3.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/bootstrap-select.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/laydate/laydate.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
    <style type="text/css">
        #container {
            margin-top: -20px;
            margin-left: 10px;
        }
    </style>

</head>
<body>
<div>
    <div id="container">
        <div class="page-header ">
            <h2>密保卡管理</h2>
        </div>
        <form action="<%=basePath%>card/getAllCard.do" method="post">
            <div class="row">
                <div class="col-xs-4 col-sm-12 ">
                    <div class="row">
                        <div class="col-xs-8 col-sm-2">
                            <span class="btn btn-default">卡号 <input name="cardNumber" type="text" /> </span>
                        </div>
                        <div class="col-xs-4 col-sm-3 ">
                            <div class="row">
                                <div class="col-xs-6 col-sm-4 ">
										<span class="btn btn-default">有效期开始时间 <input name="cardStartTime" readonly="readonly" placeholder="点此选取日期"
                                                type="text"  onclick="laydate()"/> <img
                                                src="<%=basePath%>js/My97DatePicker/skin/datePicker.gif" width="16"
                                                height="22" /> </span>
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-4 col-sm-3 ">
                            <div class="row">
                                <div class="col-xs-8 col-sm-4">
										<span class="btn btn-default">有效期结束时间 <input name="cardEndTime" readonly="readonly" placeholder="点此选取日期"
                                                type="text" onclick="laydate()"/> <img
                                                src="<%=basePath%>js/My97DatePicker/skin/datePicker.gif" width="16"
                                                height="22" /> </span>
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-4 col-sm-2 ">
                            <div class="row">
                                <div class="col-xs-8 col-sm-3">
										<span class="btn btn-default"> 省份<select name="provId">

                                            <option name="provId" value="">请选择省份</option>
                                            <c:forEach items="${provinces}" var="province">
                                                <option name="provId" value="${province.provId}">${province.provName}</option>
                                            </c:forEach>

										</select> </span>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-4 col-sm-1 ">
                            <div class="row">
                                <div class="col-xs-6 col-sm-4 ">
                                    <input type="submit" class="btn btn-primary" id="search"
                                           value="查询" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <div class="row">&nbsp;</div>
        <div class="row">
            <div class="col-xs-6 col-sm-4">
                <a href="<%=basePath%>card/addCard.jsp" class="btn btn-primary">批量生成密保卡</a>

            </div>
        </div>
        <div class="row">&nbsp;</div>
        <div class="row">
            <div class="col-xs-6 col-sm-11">
                <div class="table-responsive"
                     style="vertical-align: middle;text-align: center;">
                    <table id="searchTable"
                           class="table table-bordered table-hover table-condensed  ">
                        <tr>
                            <td><input type="checkbox" id="all" value="全选"
                            /> 全选</td>
                            <td>ID</td>
                            <td>卡号</td>
                            <td>密码</td>
                            <td>金额</td>
                            <td>省份</td>
                            <td>有效期开始时间</td>
                            <td>有效期结束时间</td>
                            <td>使用状态</td>
                            <td>创建时间</td>
                        </tr>
                        <c:forEach items="${cards}" var="card">
                            <tr>
                                <td><input type='checkbox'
                                           name='opt' value='' /></td>
                                <td>${card.cardId}</td>
                                <td>${card.cardNumber}</td>
                                <td>${card.cardPwd}</td>
                                <td>${card.cardAmount}</td>
                                <td>${card.provName}</td>
                                <td><fmt:formatDate value="${card.cardStartTime}" pattern="yyyy-MM-dd hh:mm:ss"></fmt:formatDate> </td>
                                <td><fmt:formatDate value="${card.cardEndTime}" pattern="yyyy-MM-dd hh:mm:ss"></fmt:formatDate></td>

                                <c:choose>
                                    <c:when test="${card.cardStatus == 1}">
                                        <td>未生效</td>
                                    </c:when>
                                    <c:when test="${card.cardStatus == 2}">
                                        <td>可用</td>
                                    </c:when>
                                    <c:when test="${card.cardStatus == 3}">
                                        <td>已使用</td>
                                    </c:when>
                                    <c:when test="${card.cardStatus == 4}">
                                        <td>已过期</td>
                                    </c:when>
                                </c:choose>
                                <td><fmt:formatDate value="${card.cardCreateTime}" pattern="yyyy-MM-dd hh:mm:ss"></fmt:formatDate></td>
                            </tr>
                        </c:forEach>

                    </table>

                </div>
            </div>
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
