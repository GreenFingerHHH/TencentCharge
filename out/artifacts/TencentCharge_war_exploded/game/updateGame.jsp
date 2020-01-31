<%--
  Created by IntelliJ IDEA.
  User: soft01
  Date: 20-1-15
  Time: 下午3:32
  
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<html>
<head>
    <title>游戏详情</title>


    <link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
    <script src="<%=basePath%>js/jquery.js"></script>
    <script src="<%=basePath%>js/bootstrap.min.js"></script>
    <style type="text/css">
        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
        }
        input[type="number"]{
            -moz-appearance: none;
        }
        #container {
            margin-top: -20px;
            margin-left: 10px;
        }

        #selectFile{
            position: absolute;
            z-index: 999999;
            left: 10%;
            right: 50%;
            top: 30%;
            width: 500px;
            height: 450px;
            background-color: #f0efee;
        }


    </style>

    <script type="text/javascript">
        function getGameTypes() {

            $.ajax({
                type:"POST",
                url:"<%=basePath%>gameType/getAllGameTypes.do",
                async:false,
                success:function (msg) {
                    var select = $("#gameTypes")
                    for(i=0;i<msg.length;i++){
                        var opt = $("<option id='"+msg[i].typeName+"' value='"+msg[i].typeId+"'>"+msg[i].typeName+"</option>")
                        select.append(opt)
                    }
                    $("#${game.gameType}").attr("selected",true);

                }
            })
        }
        function addOrUpdateGame(funCode) {

            $("#funCode").val(funCode);
            if (funCode==1){
                if($("#gameName").val()==""){
                    $("#nameResult").attr("style","color:red");
                    $("#nameResult").text("游戏名不可为空！");
                }else if($("#gameTypes").val()==""){
                    $("#typeResult").attr("style","color:red");
                    $("#typeResult").text("未选择游戏类型！")
                }else if ($("#gameDeveloper").val()==""){
                    $("#developerResult").attr("style","color:red");
                    $("#developerResult").text("游戏开发商不可为空！");
                }else if($("#gameFiling").val()==""){
                    $("#filingResult").attr("style","color:red");
                    $("#filingResult").text("游戏备案号不可为空！");

                }else if($("#gameIntroduction").val()==""){
                    $("#introductionResult").attr("style","color:red");
                    $("#introductionResult").text("游戏简介不可为空！");

                }else if($("#gameDetail").val()==""){
                    $("#detailResult").attr("style","color:red");
                    $("#detailResult").text("游戏详情不可为空！");

                }else if($("#gameCurrency").val()==""){
                    $("#currencyResult").attr("style","color:red");
                    $("#currencyResult").text("游戏币价格不可为空！");

                }else if($("#gameCurrency").val()<0){
                    $("#currencyResult").attr("style","color:red");
                    $("#currencyResult").text("游戏币价格不可小于0！");
                }else if($("#gameTariffe").val()==""){
                    $("#tariffeResult").attr("style","color:red");
                    $("#tariffeResult").text("话费价格不可为空！");

                }else if($("#gameTariffe").val()<0){
                    $("#tariffeResult").attr("style","color:red");
                    $("#tariffeResult").text("话费价格不可小于0！");
                } else if($("#gameCover").val()==""){
                    $("#coverResult").attr("style","color:red");
                    $("#coverResult").text("未选择文件！");

                }else if($("#gameScreen1").val()==""){
                    $("#screenResult1").attr("style","color:red");
                    $("#screenResult1").text("未选择文件！");

                }else if($("#gameScreen2").val()==""){
                    $("#screenResult2").attr("style","color:red");
                    $("#screenResult2").text("未选择文件！");

                }else if($("#gameScreen3").val()==""){
                    $("#screenResult3").attr("style","color:red");
                    $("#screenResult3").text("未选择文件！");

                } else{
                    $("#addOrUpdateForm").submit()
                }
            }else {
                if($("#gameName").val()==""){
                    $("#nameResult").attr("style","color:red");
                    $("#nameResult").text("游戏名不可为空！");
                }else if($("#gameTypes").val()==""){
                    $("#typeResult").attr("style","color:red");
                    $("#typeResult").text("未选择游戏类型！")
                }else if ($("#gameDeveloper").val()==""){
                    $("#developerResult").attr("style","color:red");
                    $("#developerResult").text("游戏开发商不可为空！");
                }else if($("#gameFiling").val()==""){
                    $("#filingResult").attr("style","color:red");
                    $("#filingResult").text("游戏备案号不可为空！");

                }else if($("#gameIntroduction").val()==""){
                    $("#introductionResult").attr("style","color:red");
                    $("#introductionResult").text("游戏简介不可为空！");

                }else if($("#gameDetail").val()==""){
                    $("#detailResult").attr("style","color:red");
                    $("#detailResult").text("游戏详情不可为空！");

                }else if($("#gameCurrency").val()==""){
                    $("#currencyResult").attr("style","color:red");
                    $("#currencyResult").text("游戏币价格不可为空！");

                }else if($("#gameCurrency").val()<0){
                    $("#currencyResult").attr("style","color:red");
                    $("#currencyResult").text("游戏币价格不可小于0！");
                }else if($("#gameTariffe").val()==""){
                    $("#tariffeResult").attr("style","color:red");
                    $("#tariffeResult").text("话费价格不可为空！");

                }else if($("#gameTariffe").val()<0){
                    $("#tariffeResult").attr("style","color:red");
                    $("#tariffeResult").text("话费价格不可小于0！");
                } else{
                    $("#addOrUpdateForm").submit()
                }
            }



        }

    </script>
</head>
<body onload="getGameTypes()" id="backBody">
<script type="application/javascript">
    <c:if test="${gameExisit}">
    alert("${errorMessage}")
    </c:if>
</script>
<div id="container">
    <div class="page-header ">
        <h2>修改游戏</h2>

    </div>
    <div class="row">
        <div class="col-xs-6 col-sm-8 col-md-offset-2">
            <form id="addOrUpdateForm" class="form-horizontal text-center"
                  action="<%=basePath%>game/addOrUpdate.do" method="post" enctype="multipart/form-data">
                <input type="hidden" id="funCode" name="funCode">
                <input type="hidden"  name="gameId" value="${game.gameId}">
                <table class="table table-bordered table-condensed ">
                    <thead></thead>
                    <tbody>
                    <tr>
                        <td >游戏名称</td>
                        <td>
                            <div class="col-sm-6 col-md-offset-3">
                                <input type="text"
                                      id="gameName" class="col-sm-12" name="gameName" required="required" value="${game.gameName}" maxlength="10" placeholder="在此输入游戏名(1-10个字)"/>

                                <span id="nameResult"></span>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td>游戏类型</td>
                        <td>
                            <div class="col-sm-6 col-md-offset-3">
                                <select name="gameTypes" id="gameTypes" class="col-sm-12" required="required">

                                    <option value="">请选择游戏类型</option>
                                </select>
                                <span id="typeResult"></span>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td>游戏状态</td>
                        <td>
                            <div class="col-sm-6 col-md-offset-1" style="text-align: center">

                                <label> <input type="radio" id="1" name="gameStatus"
                                               value="1" checked="checked"> 商用 </label>
                                <label> <input type="radio" id="2" name="gameStatus"
                                               value="2"> 下线</label>

                                <script type="text/javascript">
                                    <c:if test="${game.gameStatus==1}">

                                    $("#1").attr("checked",true)
                                    </c:if>
                                    <c:if test="${game.gameStatus==0}">

                                    $("#2").attr("checked",true)
                                    </c:if>
                                </script>



                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td>开发商</td>
                        <td>
                            <div class="col-sm-6 col-md-offset-3">
                                <input name="gameDevelopers" type="text" class="col-sm-12" id="gameDeveloper"
                                       value="${game.gameDevelopers}" required="required" placeholder="在此输入游戏开发商名（1-20个字）" maxlength="20"/>
                            <span id="developerResult"></span>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td>备案号</td>
                        <td>
                            <div class=" col-sm-6 col-md-offset-3">
                                <input name="gameFiling" type="text" class="col-sm-12" id="gameFiling"
                                       value="${game.gameFiling}" required="required" placeholder="在此输入游戏备案号（1-16个字）" maxlength="20"/>
                                <span id="filingResult"></span>
                            </div></td>
                    </tr>

                    <tr>
                        <td>游戏简介</td>
                        <td>
                            <div class="col-sm-6 col-md-offset-3">
										<textarea name="gameIntroduction" class="form-control"
                                               id="gameIntroduction"    rows="3" required="required" placeholder="在此输入游戏简介(30个字)" maxlength="30">${game.gameIntroduction}</textarea>
                                <span id="introductionResult"></span>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td>游戏详情</td>
                        <td>
                            <div class="col-sm-6 col-md-offset-3">
                                <textarea name="gameDetail" id="gameDetail" class="form-control" rows="3" required="required" placeholder="在此输入游戏详情（1-100字)" maxlength="100">${game.gameDetail}</textarea>
                                <span id="detailResult"></span>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td>游戏币价格</td>
                        <td>
                            <div class="col-sm-6 col-md-offset-3">
                                <input name="gameCurrency" type="number" class="col-sm-12" id="gameCurrency"
                                       value="${game.gameCurrency}" required="required" placeholder="在此输入游戏币价格（币）" min="1" step="0.01"/>
                                <span id="currencyResult"></span>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td>话费价格</td>
                        <td>
                            <div class="col-sm-6 col-md-offset-3">
                                <input name="gameTariffe" type="number" class="col-sm-12" id="gameTariffe"
                                       value="${game.gameTariffe}" required="required" placeholder="在此输入话费价格（元）" min="1" step="0.01"/>
                                <span id="tariffeResult"></span>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td>游戏封面</td>
                        <td>
                            <div class="col-sm-6  col-md-offset-3">
                                <c:if test="${isUpdate}">
                                    <div class="thumbnail">
                                        <img class="img-responsive img-rounded " width="80"
                                             src="/usedimg/game/${game.gameCover}?temp=<%=Math.random()%>" />
                                    </div>
                                </c:if>
                                <div class="caption">
                                    <p>
                                        <input id="gameCover" name="gameCover" type="file"
                                               required="required"/>
                                        <span id="coverResult"></span>
                                    </p>
                                </div>

                            </div>
                        </td>
                    </tr>

<%--                    <div id="selectFile" style="display: none">--%>


<%--                        <div ><input id="getScreens" type="file" accept=".jpeg,.png,.jpg" name="uploadFiles" multiple></div>--%>
<%--                        <div ><ul id="selectedFiles">--%>

<%--                        </ul></div>--%>

<%--                        <input type="button" style="margin-bottom: 0px" onclick="back()" value="返回">--%>



<%--                        <script type="text/javascript">--%>
<%--                            var input = document.getElementById("getScreens");--%>
<%--                            var showSelectedFiles = $("#selectedFiles");--%>
<%--                            input.addEventListener("change",uploadFiles);--%>
<%--                            function uploadFiles() {--%>

<%--                                while (showSelectedFiles.firstChild){--%>
<%--                                    showSelectedFiles.removeChild(showSelectedFiles.firstChild)--%>
<%--                                }--%>
<%--                                var curFiles =  input.files;--%>
<%--                                if (curFiles==0){--%>
<%--                                    var li = $("<li>未上传文件！</li>")--%>
<%--                                    showSelectedFiles.append(li);--%>
<%--                                }else {--%>
<%--                                    for(i=0;i<curFiles.length;i++){--%>
<%--                                        var li = $("<li>"+curFiles[i].name+"</li>");--%>
<%--                                        showSelectedFiles.append(li);--%>
<%--                                    }--%>
<%--                                }--%>
<%--                            }--%>
<%--                            function back() {--%>

<%--                                document.getElementById("selectFile").style.display="none"--%>
<%--                            }--%>
<%--                        </script>--%>
                    </div>
                    <tr>
                        <td>游戏截图</td>
                        <td>
                            <c:if test="${isUpdate}">
                                <c:set var="screens" value="${fn:split(game.gameScreen, ',')}"></c:set>
                                <c:forEach var="screen" items="${screens}" varStatus="s">
                                    <div class="col-sm-4  col-md-4">
                                        <div class="thumbnail">
                                            <img class="img-responsive"   width="100"   src="/usedimg/game/screen/${screen}?temp=<%=Math.random()%>"  width="50" />
                                        </div>

                                        <div class="caption">
                                            <p><input type="file" id="gameScreen${s.count}" name="gameScreen${s.count}" accept=".jpeg,.jpg,.png"></p>
                                            <span id="screenResult${s.count}"></span>
                                        </div>
                                    </div>

                                </c:forEach>
                            </c:if>
                            <c:if test="${isAdd}">
                                <div class="caption">
                                    <p><input id="gameScreen1" type="file" name="gameScreen1" accept=".jpeg,.jpg,.png"></p>
                                    <span id="screenResult1"></span>
                                </div>
                                <div class="caption">
                                    <p><input id="gameScreen2" type="file" name="gameScreen2" accept=".jpeg,.jpg,.png"></p>
                                    <span id="screenResult2"></span>
                                </div>
                                <div class="caption">
                                    <p><input id="gameScreen3" type="file" name="gameScreen3" accept=".jpeg,.jpg,.png"></p>
                                    <span id="screenResult3"></span>
                                </div>
                            </c:if>



<%--                            <div class="col-sm-4 col-md-2 col-md-offset-1">--%>
<%--                                <div class="thumbnail">--%>
<%--                                    <img class="img-rounded " width="150"  src="<%=basePath%>images/screen/">--%>
<%--                                </div>--%>
<%--                                <div class="caption">--%>
<%--                                    <p><input type="file" value="" name="" /></p>--%>
<%--                                </div>--%>
<%--                            </div>--%>

<%--                            <div class="col-sm-4 col-md-2 col-md-offset-1">--%>
<%--                                <div class="thumbnail">--%>
<%--                                    <img class="img-rounded "  width="150"   src="<%=basePath%>images/screen/">--%>
<%--                                </div>--%>
<%--                                <div class="caption">--%>
<%--                                    <p><input type="file" value="" name="" /></p>--%>
<%--                                </div>--%>
<%--                            </div>--%>

<%--                            <div class="col-sm-4 col-md-2 col-md-offset-1">--%>
<%--                                <div class="thumbnail">--%>
<%--                                    <img class="img-rounded "  width="150"   src="<%=basePath%>images/screen/">--%>
<%--                                </div>--%>
<%--                                <div class="caption">--%>
<%--                                    <p><input type="file" value="" name="" /></p>--%>
<%--                                </div>--%>
<%--                            </div>--%>
                        </td>
                    </tr>


                    <c:if test="${isUpdate}">
                        <tr>
                            <td>创建时间</td>
                            <td>
                                <div class="col-sm-6 col-md-offset-3">
                                    <fmt:formatDate value="${game.gameCreateTime}" pattern="yyyy/MM/dd hh:mm:ss"></fmt:formatDate>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td>修改时间</td>
                            <td>
                                <div class="col-sm-6 col-md-offset-3">
                                    <fmt:formatDate value="${game.gameUpdateTime}" pattern="yyyy/MM/dd hh:mm:ss"></fmt:formatDate>

                                </div>
                            </td>
                        </tr>
                    </c:if>
                <c:if test="${isAdd}">
                    <tr>
                        <td>上传游戏本体文件</td>
                        <td>
                            <div class="col-sm-6 col-md-offset-3">
                                <input type="file" name="gameFile" placeholder="点此上传游戏文件">
                            </div>
                        </td>
                    </tr>
                </c:if>

                    </tbody>
                </table>
                <div class="row">
                    <div class="col-xs-6 col-sm-10">
                        <div class="form-group">
                            <div class="col-xs-6 col-sm-4 col-md-offset-3">
                                <c:if test="${isAdd}">
                                    <input class="btn btn-info"  value="添加游戏" onclick="addOrUpdateGame(1)"/>

                                </c:if>
                                <c:if test="${isUpdate}">
                                    <input class="btn btn-info"  value="提交修改" onclick="addOrUpdateGame(2)"/>
                                </c:if>
                            </div>
                            <div class="col-xs-6 col-sm-4">
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
