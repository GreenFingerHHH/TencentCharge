<%--
  Created by IntelliJ IDEA.
  User: soft01
  Date: 20-1-15
  Time: 下午3:49
  
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
    <script src="<%=basePath%>js/jquery-2.2.3.min.js"></script>
    <title>用户管理</title>
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
        var currentUsername;
        var currentPhone;
        var totalPage;
        var status = 1;

        function searchButton() {
            currentUsername = $("#username").val();
            currentPhone = $("#phone").val();
            currentPage = 1;
            document.getElementById("all").checked = false;
            search(currentPage);
        }

        function search(pageNum) {
            document.getElementById("all").checked = false;
            currentPage = pageNum;
            $.ajax({
                type:"POST",
                url:"<%=basePath%>user/getAllUsers.do",
                data:({
                    "username":currentUsername,
                    "phone":currentPhone,
                    "pageNum":currentPage
                }),
                success:function (msg) {
                    var users = msg.list;
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
                    for(var i=0;i<users.length;i++){
                        var tr = $("<tr></tr>");
                        var checkBox = $("<td><input type='checkbox' name='users' value='"+users[i].userId+"'/></td>");
                        var userid = $("<td>"+users[i].userId+"</td>");
                        var username = $("<td>"+users[i].userName+"</td>");
                        var userphone = $("<td>"+users[i].userPhone+"</td>");
                        if (users[i].userStatus == 1){
                            var userstatus = $("<td>"+"正常"+"</td>");
                        }
                        if (users[i].userStatus == 0){
                            var userstatus = $("<td>"+"封禁"+"</td>");
                        }

                        var date = new Date(users[i].userCreateTime).toLocaleString();
                        var usercreatetime = $("<td>"+date+"</td>");
                        tr.append(checkBox).append(userid).append(username).append(userphone).append(userstatus).append(usercreatetime)
                        table.append(tr)
                    }
                    for(;i<4;i++){
                        var tr = $("<tr><td>&nbsp;</td><td></td><td></td><td></td><td></td><td></td></tr>");
                        table.append(tr);
                    }
                }
            })
        }

        function selectOrCancelAll() {
            // var selectBoxes = $("input[name='opt']");
            var selectBoxes = document.getElementsByName("users");
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

        function banUsers() {
            $("#status").val(0);
            $("#ban").submit();
        }
        function freeUsers() {
            $("#status").val(1);
            $("#free").submit();
        }
    </script>
</head>
<body onload="searchButton()">
<script type="text/javascript">
    <c:if test="${notSelect}">
        alert("${errorMessage}");
    </c:if>
</script>
<div id="container"  >
    <div class="page-header">
        <h2>用户列表</h2>
    </div>
        <div class="row">
            <div class="col-xs-6 col-sm-3">
                <div class="row">
                    <div class="col-xs-8 col-sm-3">
                        <span class="btn btn-default">用户名</span>
                    </div>
                    <div class="col-xs-3 col-sm-8">
                        <input id="username" type="text" class="form-control" name="username"/>
                    </div>
                </div>
            </div>
            <div class="col-xs-6 col-sm-2">
                <div class="row">
                    <div class="col-xs-8 col-sm-4">
                        <span class="btn btn-default">手机号码</span>
                    </div>
                    <div class="col-xs-3 col-sm-8">
                        <input id="phone" type="text" class="form-control" name="phone"/>
                    </div>
                </div>

            </div>
            <div class="col-xs-6 col-sm-4">
                <input type="button" class="btn btn-primary"  value="查询" onclick="searchButton()"/>
            </div>
        </div>
    <div class="row">&nbsp;</div>
    <form action="<%=basePath%>user/banUsers.do" method="post">
    <div class="row">

        <input type="hidden" id="status" name="status">
        <div class="col-xs-6 col-sm-4">
            <button id="free" class="btn btn-success" onclick="freeUsers()"> <span class="glyphicon glyphicon-ok-sign"></span>
                恢复使用</button>

            <button class="btn btn-danger" id="ban" onclick="banUsers()"> <span
                    class="glyphicon glyphicon-trash"></span> 禁止使用</button>
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
                        <th width="65px"><input type="checkbox" id="all" value="全选" onclick="selectOrCancelAll()"
                        /> 全选</th>
                        <th width="122px">ID</th>
                        <th width="145px">用户名</th>
                        <th width="145px">手机号码</th>
                        <th width="75px">状态</th>
                        <th width="319px">创建时间</th>
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
    td {
        vertical-align: middle !important;
    }
</style>
</html>
<%--继续完成分页--%>