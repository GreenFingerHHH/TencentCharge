<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: soft01
  Date: 20-1-15
  Time: 下午3:41
  
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
    <title>游币游戏详情</title>
    <link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>css/index.css"/>
    <link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
    <link href="<%=basePath%>css/jquery-accordion-menu.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath%>css/font-awesome.css" rel="stylesheet" type="text/css" />
    <script src="<%=basePath%>js/jquery.js"></script>
    <script src="<%=basePath%>js/bootstrap.min.js"></script>
    <script src="<%=basePath%>js/particles.js"></script>
    <script src="<%=basePath%>js/app.js"></script>
    <script src="<%=basePath%>js/jquery.js"></script>
    <script src="<%=basePath%>js/bootstrap.min.js"></script>

    <script type="text/javascript">
        function buyGame() {
        $.ajax({
            type:"POST",
            url: "<%=basePath%>expense/buyGame.do",
            data:({
                "gameId":"${game.gameId}",
                "userId":"${user.userId}",
                "operatorId":$("#operatorId").val()
            }),
            success:function (msg) {
                if (msg=="tariffeNotEnough"){
                    alert("购买失败，话费余额不足！")
                }else if (msg=="currencyNotEnough"){
                    alert("购买失败，话费余额不足！")
                }else if (msg=="success"){
                    alert("购买成功！您可以尽情游戏了！")
                    $("#buyBtn").attr("type","hidden");
                    $("#downloadBtn").attr("type","submit");

                }
            }
        })
    }

    var currentImg = 3;


    function initHead() {

            $.ajax({
                type:"POST",
                url:"<%=basePath%>gameType/getAllGameTypes.do",

                success:function (msg) {

                    var headUl = $("#headLine");

                    var emptLi = $("<li></li>");


                    for(var i=0;i<msg.length;i++){
                        if(msg[i].typeStatus==1){
                            var li = $("<li><a href=\"<%=basePath%>game/getAllGamesByType.do?typeName="+msg[i].typeId+"\" class=\"btn btn-primary\">"+msg[i].typeName+"</a></li>");
                            headUl.append(li);

                        }
                    }

                    headUl.append(emptLi);

                }
            });

            $.ajax({
                type:"POST",
                url:"<%=basePath%>expense/getBuyStatus.do",
                async:false,
                data:({
                    "gameId":"${game.gameId}",
                    "userId":"${user.userId}"
                }),
                success:function (msg) {
                    if (msg=="hasBought"){
                        $("#buyBtn").attr("type","hidden");
                        $("#downloadBtn").attr("type","submit");
                    }
                }

            })

        }
        function showImage() {
            var ul = $("li[name='screen']");
            ul[currentImg].display = "display";
            currentImg
            console.log(ul[0])

        }
    </script>
    <style type="text/css">
        .img li {
            position: absolute;
            top: 0px;
            left: 0px;
            display: none
        }
    </style>
</head>
<body onload="initHead()"><div class="container">
    <nav class="navbar navbar-default" >
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#example-navbar-collapse">
                <span class="sr-only">切换导航</span> <span class="icon-bar"></span> <span
                    class="icon-bar"></span> <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="portal.html">游币手机下载门户网站</a>
        </div>
        <div class="collapse navbar-collapse" id="example-navbar-collapse">
            <ul class="nav navbar-nav">

            </ul>
            <ul class="nav navbar-nav navbar-right">
                <c:choose>
                    <c:when test="${user==null}">
                        <li class="dropdown"><a href="login.html" >登录</a>
                        </li>
                        <li class="dropdown"><a href="register.html" >注册</a>
                        </li>
                    </c:when>
                    <c:when test="${user!=null}">
                        <li class="dropdown"><a href="#">欢迎${user.userName}</a>
                        </li>
                        <li class="dropdown"><a href="#" class="dropdown-toggle "
                                                data-toggle="dropdown">个人中心<b class="caret"></b> </a>
                            <ul  class="dropdown-menu">
                                <li><a data-toggle="modal"
                                       data-target="#myModal">密保卡充值</a></li>
                                <li><a href="prepaid.html">充值记录</a></li>
                                <li><a href="userDetail.html">账户信息</a></li>
                                <li><a href="expense.html">消费记录</a></li>
                                <li class="divider"></li>
                                <li><a href="login.html">退出</a></li>
                            </ul>
                        </li>
                    </c:when>
                </c:choose>
            </ul>
        </div>
    </nav>
</div>
<div class="modal fade" id="myModal" tabindex="-1" >
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                >&times;</button>
                <h4 class="modal-title" id="myModalLabel">密保卡充值</h4>
            </div>
        </div>
    </div>
</div>

<div class="row" style="background-color:#CCC; 
	overflow:hidden;">
    <div class="col-md-12">
        <ul id="headLine" class="nav nav-pills col-md-offset-3" >
            <li class=><a href="portal.html" class="btn btn-primary">首页</a></li>

        </ul>
    </div>
</div>


<div class="row">&nbsp;</div>
<div class="container">
        <div class="row">
            <div class="col-md-4 col-sm-4">
                <img
                        src="/usedimg/game/${game.gameCover}"
                        width="450px;" alt="" />
            </div>
            <div class="col-md-6 col-md-offset-1">
                <p>
                    <strong>游戏名称:</strong>${game.gameName}
                </p>
                <p>
                    <strong>游戏类型:</strong>${game.gameType}
                </p>
                <p>
                    <strong>话费价格:</strong>${game.gameTariffe}
                </p>
                <p>
                    <strong>游币价格:</strong>${game.gameCurrency}(单位:游币)
                </p>
                <p>
                    <strong>开发商:</strong>${game.gameDevelopers}
                </p>
                <p>
                    <strong>备案号:</strong>${game.gameFiling}
                </p>
                <p>
                    <strong>游戏简介:</strong>${game.gameIntroduction}
                </p>
                <p>
                    <strong>游戏状态:</strong>

                    <c:if test="${game.gameStatus==1}">
                        商用
                    </c:if>

                    <c:if test="${game.gameStatus==2}">
                        下线
                    </c:if>


                </p>
                <p>
                    <strong>最新发布时间:</strong>
                    <fmt:formatDate value="${game.gameUpdateTime}" pattern="yyyy/MM/dd hh:mm:ss"></fmt:formatDate>
                </p>
                <p>
                    <strong>支付方式:</strong><select id="operatorId">
                    <option value="1" selected="selected">话费支付</option>
                    <option value="2">游币支付</option>
                </select>
                </p>
                <form action="<%=basePath%>game/downloadGame.do" method="post">
                <p>
                <input id="buyBtn" type="button"  class="btn btn-success" value="确认购买" onclick="buyGame()">
                <input type="hidden" name="userId" value="${user.userId}">
                <input type="hidden" name="gameId" value="${game.gameId}">
                <input id="downloadBtn" type="hidden"  class="btn btn-success" value="下载游戏">
                    <a class="btn btn-warning" href="">返回首页</a>
                </p>
    </form>

</div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title">游戏简介</h3>
                    </div>
                    <div class="panel-body">${game.gameDetail}</div>
                </div>
            </div>

        </div>
        <div class="row col-md-12">
            <div class="panel panel-warning ">
                <div class="panel-heading">
                    <h3 class="panel-title">游戏画面截图</h3>
                </div><div class="panel-body">
                <div class="carousel content-main">

                    <div class="col-md-6 ">
                        <div class="out">
                            <!--上面-->
                            <ul class="img">

                                <c:set var="screens" value="${fn:split(game.gameScreen, ',')}"></c:set>
                                <c:forEach var="screen" items="${screens}" varStatus="s">
                                    <li name="screen"><img  style="width: 800px;height: 411px;"      src="/usedimg/game/screen/${screen}?temp=<%=Math.random()%>"  width="50" /></li>
                                </c:forEach>
<%--                                <li>--%>
<%--                                    <a href="">--%>
<%--                                        <img src="<%=basePath%>usedimg/game/YX0003.jpg" width="500"--%>
<%--                                             height="300" alt="" />--%>
<%--                                    </a>--%>
<%--                                </li>--%>
<%--                                <li>--%>
<%--                                    <a href="">--%>
<%--                                        <img src="<%=basePath%>usedimg/game/YX0004.jpg" width="500"--%>
<%--                                             height="300" alt="" />--%>
<%--                                    </a>--%>
<%--                                </li>--%>
<%--                                <li>--%>
<%--                                    <a href="">--%>
<%--                                        <img src="<%=basePath%>usedimg/game/YX0005.jpg" width="500"--%>
<%--                                             height="300" alt="" />--%>
<%--                                    </a>--%>
<%--                                </li>--%>
<%--                                <li>--%>
<%--                                    <a href="">--%>
<%--                                        <img src="<%=basePath%>usedimg/game/YX0001.jpg" width="500"--%>
<%--                                             height="300" alt="" />--%>
<%--                                    </a>--%>
<%--                                </li>--%>
                            </ul>
                            <!--下面-->
                            <ul class="num">
                            </ul>
                            <div class="left btn">&lt;</div>
                            <div class="right btn">&gt;</div>
                        </div>
                    </div>
<%--                    <ul class="list">--%>
<%--                        <c:set var="screens" value="${fn:split(game.gameScreen, ',')}"></c:set>--%>
<%--                        <c:forEach var="screen" items="${screens}" varStatus="s">--%>
<%--                            <li name="screen"><img class="img-responsive" style="width: 800px;height: 411px;"      src="/usedimg/game/screen/${screen}?temp=<%=Math.random()%>"  width="50" /></li>--%>
<%--                        </c:forEach>--%>
<%--                    </ul></div>--%>
<%--                <div style="text-align: center">--%>
<%--                    <div class="left btn" onclick="showImage()">&lt;<</div>--%>
<%--                    <div class="right btn" onclick="showImage()">>></div>--%>
<%--                </div>--%>

            </div>
            </div>
            <script src="<%=basePath%>js/index.js"></script>
            <script>

                var setting = {
                    width:500,
                    height:270,
                    postWidth:658,
                    postHeight:270,
                    scale:0.8,
                    verticalAlign:"center",
                    speed:500
                };
                $(".carousel").attr("data-setting",'{ "width":900,"height":411,"postWidth":658}');
                Carousel.init($(".carousel"));
            </script>
        </div>

</div>
<div class="row">
    <div class="container">
        <hr/>
        <div class="col-md-4 col-md-offset-5">
            &copy;2016-2017 portal.com 版权所有
        </div>
    </div>
</div>

</body>

</html>
