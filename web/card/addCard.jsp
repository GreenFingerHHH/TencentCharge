<%--
  Created by IntelliJ IDEA.
  User: soft01
  Date: 20-1-15
  Time: 下午3:04
  
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
    <title>游币比例管理页面</title>
    <script src="<%=basePath%>js/jquery-2.2.3.min.js"></script>
    <script src="<%=basePath%>js/My97DatePicker/WdatePicker.js"></script>
    <link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="<%=basePath%>js/laydate/laydate.js"></script>
    <script src="<%=basePath%>js/bootstrap.min.js"></script>
    <style type="text/css">
        #container {
            margin-top: -20px;
            margin-left: 10px;
        }
    </style>
    <link href="<%=basePath%>css/doubleDate.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        *{margin:0;padding:0;list-style-type:none;}
        a,img{border:0;}
        body{font:12px/180% Arial, Helvetica, sans-serif, "新宋体";}


        .iptgroup{width:620px;height:60px;margin:20px auto 0 auto;}
        .iptgroup li{float:left;height:30px;line-height:30px;padding:5px;}
        .iptgroup li .ipticon{background:url(<%=basePath%>/blue/date_icon.gif) 98% 50% no-repeat;border:1px #CFCFCF solid;padding:3px;}
    </style>
    <script type="text/javascript">
        function createCard() {
            var number = $("#number").val();
            var currency = $("#currency").val();
            var startTime = new Date($("#startTime").val()).getTime();
            var endTime = new Date($("#endTime").val()).getTime();
        if (number==""||number<=0){
            alert("数量必须大于0！")
        } else if (currency==""||currency<=0){
            alert("游币数量必须大于0！")
        }else if(startTime==""||endTime==""){
            alert("必须填写时间！")
        }else if (startTime-endTime>0){
            alert("结束时间不可早于开始时间！")
        } else {
            $("#createCards").submit();
        }
    }


    </script>
</head>
<body>
<div>
    <div id="container">
        <div class="page-header ">
            <h2>密保卡生成</h2>
        </div>
        <div class="row">
            <div class="col-xs-6 col-sm-4">
                <div class="modal-body">
                    <form id="createCards" class="form-horizontal" action="<%=basePath%>card/createCards.do">

                        <table class="table table-bordered table-hover table-condensed  ">
                            <tbody>
                            <tr>
                                <td>数量(张)</td>
                                <td><input id="number" name="number" type="number" step="1"  placeholder="必须输入整数"  /></td>
                            </tr>
                            <tr>
                                <td>选择需要生成卡的省份</td>
                                <td> <select
                                        class="selectpicker bla bla bli" name="provIds" multiple data-live-search="true">
                                    <optgroup>
                                        <c:forEach items="${provinces}" var="province">
                                            <option name="provId" value="${province.provId}">${province.provName}</option>
                                        </c:forEach>
                                    </optgroup>
                                </select></td>
                            </tr>
                            <tr>
                                <td>金额(游币数量)</td>
                                <td><input id="currency" name="currency" type="number" step="1"  placeholder="必须输入整数"
                                /></td>
                            </tr>
                            <tr class="iptgroup">
                                <td>有效期开始时间<input id="startTime" name="startTime" type="text"  readonly="readonly" class="doubledate ipticon" onclick="laydate()"/></td>
                                <td>有效期结束时间<input id="endTime" name="endTime" type="text"  readonly="readonly" class="doubledate ipticon" onclick="laydate()"/></td>
                            </tr>
                            </tbody>
                        </table>


                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="submit" class="btn btn-primary" onclick="createCard()">生成密保卡</button>

                                <button class="btn btn-warning" ><a id="returnCard" href="<%=basePath%>card/getAllCard.do">返回上一页</a> </button>
                            </div>
                        </div>
                    </form>
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
