<%--
  Created by IntelliJ IDEA.
  User: soft01
  Date: 20-1-15
  Time: 下午3:30
  
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<html>
<head>
    <title>游戏详情</title>

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
    <script type="text/javascript">

    </script>
</head>
<body>
<div id="container">
    <div class="page-header text-center">
        <h2>游戏详情</h2>
    </div>
    <div class="row">
        <div class="col-xs-6 col-sm-4 col-md-offset-4">
            <form class="form-horizontal text-center" >
                <table class="table table-bordered table-condensed ">
                    <thead></thead>
                    <tbody>
                    <tr>
                        <td>游戏id</td>
                        <td>
                            <div class="col-sm-10">
                                ${game.gameId}
                            </div></td>
                    </tr>

                    <tr >
                        <td>游戏名称</td>
                        <td>
                            <div class="col-sm-10">
                                ${game.gameName}
                            </div></td>
                    </tr>

                    <tr >
                        <td>游戏类型</td>
                        <td>
                            <div class="col-sm-10">
                                ${game.gameType}
                            </div></td>
                    </tr>

                    <tr >
                        <td>游戏状态</td>
                        <td>
                            <div class="col-sm-10">
                                <c:if test="${game.gameStatus == 1}">
                                    上线
                                </c:if>
                                <c:if test="${game.gameStatus == 0}">
                                    下线
                                </c:if>
                                
                            </div></td>
                    </tr>

                    <tr >
                        <td>游戏开发商</td>
                        <td>
                            <div class="col-sm-10">
                                ${game.gameDevelopers}
                            </div></td>
                    </tr>

                    <tr >
                        <td>游戏备案号</td>
                        <td>
                            <div class="col-sm-10">
                                ${game.gameFiling}
                            </div></td>
                    </tr>

                    <tr >
                        <td>游戏简介</td>
                        <td>
                            <div class="col-sm-10">
                                ${game.gameIntroduction}
                            </div></td>
                    </tr>

                    <tr >
                        <td>游戏详情</td>
                        <td>
                            <div class="col-sm-10">
                                ${game.gameDetail}
                            </div></td>
                    </tr>

                    <tr >
                        <td>游戏币价格</td>
                        <td>
                            <div class="col-sm-10">
                                ${game.gameCurrency}
                            </div></td>
                    </tr>

                    <tr >
                        <td>话费价格</td>
                        <td>
                            <div class="col-sm-10">
                                ${game.gameTariffe}
                            </div></td>
                    </tr>

                    <tr >
                        <td>游戏封面</td>
                        <td>
                            <div class="col-sm-10  col-md-offset-4">
                                <img class="img-responsive" width="80"
                                     src="/usedimg/game/${game.gameCover}?temp=<%=Math.random()%>" />
                            </div></td>
                    </tr>

                    <tr >
                        <td>游戏画面截图</td>
                        <td>
                            <c:set var="screens" value="${fn:split(game.gameScreen, ',')}"></c:set>
                            <c:forEach var="screen" items="${screens}">
                                <div class="col-sm-4  col-md-4">
                                    <div class="thumbnail">
                                        <img class="img-responsive"   width="100"   src="/usedimg/game/screen/${screen}?temp=<%=Math.random()%>"  width="50" />
                                    </div>
                                </div>
                            </c:forEach>

                        </td>
                    </tr>

                    <tr >
                        <td>创建时间</td>
                        <td>
                            <div class="col-sm-10">
                                <fmt:formatDate value="${game.gameCreateTime}" pattern="yyyy/MM/dd hh:mm:ss"></fmt:formatDate>
                            </div></td>
                    </tr>

                    <tr >
                        <td>修改时间</td>
                        <td>
                            <div class="col-sm-10">
                                <fmt:formatDate value="${game.gameUpdateTime}" pattern="yyyy/MM/dd hh:mm:ss"></fmt:formatDate>
                            </div></td>
                    </tr>
                    </tbody>
                </table>
                <div class="row">
                    <div class="col-xs-6 col-sm-4">
                        <div class="form-group">
                            <div class="col-sm-offset-10 col-sm-11">
                                <button class="btn btn-warning" ><a href="<%=basePath%>game/game.jsp">返回上一页</a></button>
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
