<%--
  Created by IntelliJ IDEA.
  User: soft01
  Date: 20-1-15
  Time: 下午3:29
  
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
    <title>游戏列表</title>


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


    var currentPage = 0;
        var currentGameName;
        var currentTypeName;
        var totalPage;
        var status = 1;
        function selectOrCancelAll() {
            // var selectBoxes = $("input[name='opt']");
            var selectBoxes = document.getElementsByName("games");
            console.log(selectBoxes)
            if(status==1){
                for(var i=0;i<selectBoxes.length;i++){
                    selectBoxes[i].checked = true
                }

                status = 0;
            }else {
                for(var i=0;i<selectBoxes.length;i++){
                    selectBoxes[i].checked = false;
                }
                status = 1;
            }
        }
        function searchButton() {
             currentGameName = $("#gameName").val();
            currentTypeName = $("#gameTypes").val();
            currentPage = 1;
            document.getElementById("all").checked = false;
            search(currentPage);
        }
        function search(pageNum) {
            document.getElementById("all").checked = false;
            currentPage = pageNum;
            $.ajax({
                type:"POST",
                url:"<%=basePath%>game/getAllGame.do",
                data:({
                    "gameName":currentGameName,
                    "gameType":currentTypeName,
                    "pageNum":currentPage
                }),
                async:false,
                success:function (msg) {
                    var game = msg.list;
                    totalPage =  msg.totalPage;

                    var pageNumDiv = $("#pageNum")
                    var firstPage = $("<span style=\"cursor:pointer\"  onclick=\"search(1)\">首页 </span>")
                    var previousPage = $("<span  style=\"cursor:pointer\" onclick=\"search(currentPage-1)\">上一页 </span>")
                    var nextPage = $("<span style=\"cursor:pointer\"  onclick=\"search(currentPage+1)\">下一页 </span>")
                    var lastPage = $("<span style=\"cursor:pointer\"  onclick=\"search(totalPage)\">末页 </span>");

                    pageNumDiv.html("");
                    if(currentPage>1){
                        pageNumDiv.append(firstPage);
                        pageNumDiv.append(previousPage);
                    }
                    for(i=0;i<totalPage;i++){
                        if(currentPage == (i+1)){
                            pageno = $("<span  style='color: red;text-decoration: underline;text-decoration-color: red;cursor: pointer'>"+(i+1)+"  "+"</span>")
                        }else {
                            pageno = $("<span style=\"cursor:pointer\" onclick='search("+(i+1)+")'>"+(i+1)+"  "+"</span>")
                        }

                        pageNumDiv.append(pageno);
                    }
                    if (currentPage<totalPage){
                        pageNumDiv.append(nextPage);
                        pageNumDiv.append(lastPage);
                    }
                    var table = $("#searchTable");
                    table.html($("table tr")[0]);
                    for(var i=0;i<game.length;i++){
                        var tr = $("<tr></tr>");
                        var checkBox = $("<td><input type='checkbox'  name='games' value='"+game[i].gameId+"' /></td>");

                        var gameId = $("<td>"+game[i].gameId+"</td>");
                        var gameName =$("<td>"+game[i].gameName+"</td>")
                        var gameType =$("<td>"+game[i].gameType+"</td>")
                        var gameCover =$("<td>\n" +
                            "                            <div class=\"col-xs-6  col-md-offset-4\">\n" +
                            "                                <img class=\"img-responsive\" width=\"97px\" height=\"40px\"\n" +
                            "                                     src=\"/usedimg/game/"+game[i].gameCover+"?temp=<%=Math.random()%>/\" />\n" +
                            "                            </div></td>")
                        if(game[i].gameStatus == 1){
                            var gameStatus =$("<td>上线</td>")
                        }else {
                            var gameStatus =$("<td>下架</td>")
                        }
                        var gameCurrency =$("<td>"+game[i].gameCurrency+"币</td>")
                        var gameTariffe =$("<td>"+game[i].gameTariffe+"元</td>")
                       var createTime = new Date(game[i].gameCreateTime).toLocaleString()
                        var updateTime = new Date(game[i].gameUpdateTime).toLocaleString()
                        var gameCreateTime =$("<td>"+createTime+"</td>")
                        var gameUpdateTime =$("<td>"+updateTime+"</td>")
                        var operator = $("<td>\n" +
                            "                            <div class=\"col-xs-6 col-sm-3 col-md-offset-3\">\n" +
                            "                                <a class=\"btn btn-info btn-sm\"\n" +
                            "                                   href=\"<%=basePath%>game/addOrUpdateGame.do?gameId="+game[i].gameId+"\">\n" +
                            "                                    <span class=\"glyphicon glyphicon-pencil\"></span>修改</a>\n" +
                            "                            </div>\n" +
                            "                            <div class=\"col-xs-6 col-sm-3 col-md-offset-1\">\n" +
                            "                                <a class=\"btn btn-warning btn-sm\"\n" +
                            "                                   href=\"<%=basePath%>game/gameDetails.do?gameId="+game[i].gameId+"&status=1\">\n" +
                            "                                    <span class=\"glyphicon glyphicon-pencil\"></span>详情</a>\n" +
                            "                            </div></td>")




                        tr.append(checkBox).append(gameId).append(gameName).append(gameType).append(gameCover).append(gameStatus).append(gameCurrency).append(gameTariffe).append(gameCreateTime).append(gameUpdateTime).append(operator);
                        table.append(tr);
                    }
                    for(;i<4;i++){
                        var tr = $("<tr><td>&nbsp;</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>");
                        table.append(tr);
                    }
                }
            })
        getGameTypes()
        }
        function getGameTypes() {

            $.ajax({
                type:"POST",
                url:"<%=basePath%>gameType/getAllGameTypes.do",
                async:false,
                success:function (msg) {
                    var select = $("#gameTypes");
                    select.html("");
                    var opt = $("<option value = ''>请选择类型</option>");
                    select.append(opt);
                    for(i=0;i<msg.length;i++){
                        var opt = $("<option value='"+msg[i].typeId+"'>"+msg[i].typeName+"</option>")
                   select.append(opt)
                    }

                }
            })
        }
    function deleteGames() {
        var gameIds = document.getElementsByName("games");
        for(i=0;i<gameIds.length;i++){
            if (gameIds[i].checked == true){
                $("#deleteForm").submit();
                return;
            }
        }
        alert("未选择游戏！")
    }

    </script>
</head>
<body onload="search(1)">

<div id="container">
    <div class="page-header">
        <h2>游戏列表</h2>
    </div>

        <div class="row">
            <div class="col-xs-6 col-sm-3">
                <div class="row">
                    <div class="col-xs-8 col-sm-3">
                        <span class="btn btn-default">游戏名称</span>
                    </div>
                    <div class="col-xs-3 col-sm-8">
                        <input id="gameName" type="text"
                               class="form-control" />
                    </div>
                </div>
            </div>
            <div class="col-xs-6 col-sm-2">
                <div class="row">
                    <div class="col-xs-8 col-sm-4">
                        <span class="btn btn-default">游戏类型</span>
                    </div>
                    <div class="col-xs-3 col-sm-8">
                        <select id="gameTypes" class="form-control" >

                            <option value="">请选择游戏类型</option>>

                        </select>
                    </div>
                </div>

            </div>
            <div class="col-xs-6 col-sm-4">
                <input type="button" class="btn btn-primary" id="search" value="查询" onclick="searchButton()" />
            </div>
        </div>
    <div class="row">&nbsp;</div>
    <div class="row">
        <div class="col-xs-6 col-sm-4">
            <a class="btn btn-primary" href="<%=basePath%>game/addOrUpdateGame.do"> <span class="glyphicon glyphicon-plus"></span>
                新增</a>


            <button class="btn btn-danger" onclick="deleteGames()"> <span
                    class="glyphicon glyphicon-trash" ></span> 删除</button>
        </div>
    </div>

    <div class="row">&nbsp;</div>
    <div class="row">
        <form id="deleteForm" action="<%=basePath%>game/deleteGames.do" method="post">
        <div class="col-xs-6 col-sm-11">
            <div class="table-responsive"
                 style="vertical-align: middle;text-align: center; width: 1450px">
                <table id="searchTable"
                       class="table table-bordered table-hover table-condensed  ">
                    <tr>
                        <td><input type="checkbox" id="all" value="全选" onclick="selectOrCancelAll()"
                        /> 全选</td>
                        <td>ID</td>
                        <td>游戏名称</td>
                        <td>游戏类别</td>
                        <td>游戏封面</td>
                        <td>状态</td>
                        <td>游币价格</td>
                        <td>话费价格</td>
                        <td>创建时间</td>
                        <td>更新时间</td>
                        <td>操作</td>
                    </tr>


                </table>
            </div>
            <div id="pageNum" style="width:300px;margin: auto auto;">

            </div>


    </div>
        </form>
    </div>
</div>
</body>
<style>
    td {
        vertical-align: middle !important;
    }
</style>
</html>
