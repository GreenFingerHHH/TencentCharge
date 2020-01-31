<%--
  Created by IntelliJ IDEA.
  User: soft01
  Date: 20-1-15
  Time: 下午3:35
  
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
    <title>Bootstrap后台管理系统</title>

    <script src="<%=basePath%>js/jquery-2.2.3.min.js"></script>
    <link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
    <script src="<%=basePath%>js/bootstrap.min.js"></script>
    <script src="<%=basePath%>js/jquery.js"></script>
    <style type="text/css">
        #container {
            margin-top: -20px;
            margin-left: 10px;
        }
    </style>

    <script type="text/javascript">
        var currentPage = 0;
        var currentTypeName;
        var currentStatus;
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
            currentTypeName = $("#gameType").val();
            currentStatus = $("#status").val();
            currentPage = 1;
            document.getElementById("all").checked = false;
            search(currentPage);
        }
        function search(pageNum) {
            document.getElementById("all").checked = false;
            currentPage = pageNum;
            $.ajax({
                type:"POST",
                url:"<%=basePath%>gameType/getAllGameType.do",
                data:({
                    "gameType":currentTypeName,
                    "status":currentStatus,
                    "pageNum":currentPage
                }),
                success:function (msg) {
                    var gameTypes = msg.list;
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
                    for(var i=0;i<gameTypes.length;i++){
                        var tr = $("<tr></tr>");
                        var checkBox = $("<td><input type='checkbox'  name='games' value='"+gameTypes[i].typeId+"' /></td>");
                        var id = $("<td>"+gameTypes[i].typeId+"</td>");
                        var typeImg = $("<td>\n" +
                            "                        <div class=\"col-xs-6  col-md-offset-4\">\n" +
                            "                            <img class=\"img-responsive\" width=\"130px\" height=\"40px\"\n" +
                            "                                 src=\"/usedimg/gameType/"+gameTypes[i].typePicture+"\" />\n" +
                            "                        </div>\n" +
                            "                    </td>");
                        var typeName = $("<td>"+gameTypes[i].typeName+"</td>");
                        if(gameTypes[i].typeStatus == 1){
                            var status = $("<td>商用</td>")
                        }else {
                            var status = $("<td>下线</td>")
                        }
                        var createTime = new Date(gameTypes[i].typeCreateTime).toLocaleString();
                        var updateTime = new Date(gameTypes[i].typeUpdateTime).toLocaleString();
                       var create = $("<td>"+createTime+"</td>");
                       var update = $("<td>"+updateTime+"</td>");
                       var operator = $("<td><a class=\"btn btn-info\" href=\"<%=basePath%>/gameType/getGameType.do?typeId="+gameTypes[i].typeId+"\"> <span class=\"glyphicon glyphicon-pencil\"></span>修改</a></td>")

                        tr.append(checkBox).append(id).append(typeImg).append(typeName).append(status).append(create).append(update).append(operator)
                        table.append(tr);
                    }
                    for(;i<4;i++){
                        var tr = $("<tr><td>&nbsp;</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>");
                        table.append(tr);
                    }
                }
            })
        }

        function deleteBtn() {

            $("#deleteForm").submit()
        }

    </script>
</head>
<body onload="search(1)">
<script type="text/javascript">
    <c:if test="${isSuccess}">
    alert("${successInfo}")
    </c:if>
    <c:if test="${isFail}">
    alert("${errorInfo}")
    </c:if>
    <c:if test="${isLeft}">
    var typeIds = ""
    <c:forEach items="${left}" var="typeid">
    typeIds += "${typeid}" + "、"
    </c:forEach>
    alert(typeIds+"下存在游戏！无法删除！")
    </c:if>
</script>
<div id="container" class="col-sm-12">
    <div class="page-header">
        <h2>游戏类型</h2>
    </div>
        <div class="row">
            <div class="col-xs-6 col-sm-3">
                <div class="row">
                    <div class="col-xs-8 col-sm-3">
                        <span class="btn btn-default">类型名称</span>
                    </div>
                    <div class="col-xs-3 col-sm-8">
                        <input type="text" id="gameType" class="form-control" name="gameType"/>
                    </div>
                </div>
            </div>
            <div class="col-xs-6 col-sm-2">
                <div class="row">
                    <div class="col-xs-8 col-sm-3">
                        <span class="btn btn-default">状态</span>
                    </div>
                    <div class="col-xs-3 col-sm-8">
                        <select id="status" class="form-control" name="status">
                            <option value="">请选择</option>
                            <option value="1">商用</option>
                            <option value="2">下线</option>
                        </select>
                    </div>
                </div>

            </div>
            <div class="col-xs-6 col-sm-4">
                <input type="button" class="btn btn-primary"  value="查询" onclick="searchButton()"/>
            </div>
        </div>
    <form id="deleteForm" action="<%=basePath%>gameType/deleteGameType.do" method="post">
    <div class="row">&nbsp;</div>
    <div class="row">
        <div class="col-xs-6 col-sm-4">
            <a href="<%=basePath%>gameType/addGameType.jsp" target="_self" class="btn btn-primary"
               > <span class="glyphicon glyphicon-plus"></span>
                新增</a>


            <button class="btn btn-danger" onclick="deleteBtn()"> <span
                    class="glyphicon glyphicon-trash"></span> 删除</button>
        </div>
    </div>

    <div class="row">&nbsp;</div>
    <div class="row">
        <div class="col-xs-6 col-sm-11">
            <div class="table-responsive " style="vertical-align: middle;text-align: center;">
                <table id="searchTable" class="table table-bordered table-condensed ">
                    <tr>
                        <td><input  type="checkbox" id="all" value="全选" onclick="selectOrCancelAll()"/> 全选</td>
                        <td>ID</td>
                        <td>类型图片</td>
                        <td>类型名称</td>
                        <td>状态</td>
                        <td>创建时间</td>
                        <td>修改时间</td>
                        <td>操作</td>
                    </tr>

                </table>
            </div>
            <div id="pageNum" style="width:300px;margin: auto auto;">

            </div>
        </div>
    </div>
    </form>
</div>
</body>
<style>
    td{
        vertical-align: middle !important;
    }
</style>
</html>
