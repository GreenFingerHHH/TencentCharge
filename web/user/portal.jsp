<%--
  Created by IntelliJ IDEA.
  User: soft01
  Date: 20-1-15
  Time: 下午3:44
  
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
    <script src="<%=basePath%>js/jquery-2.2.3.min.js"></script>
    <title>游币门户网站</title>
    <link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
    <link href="<%=basePath%>css/jquery-accordion-menu.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath%>css/font-awesome.css" rel="stylesheet" type="text/css" />
    <script src="<%=basePath%>js/jquery.js"></script>
    <script src="<%=basePath%>js/bootstrap.min.js"></script>
    <script src="<%=basePath%>js/particles.js"></script>
    <script src="<%=basePath%>js/app.js"></script>
    <style type="text/css">
        *{box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;}
        .content{width:260px;margin:100px auto;}
        .filterinput{
            background-color:rgba(249, 244, 244, 0);
            border-radius:15px;
            width:90%;
            height:30px;
            border:thin solid #FFF;
            text-indent:0.5em;
            font-weight:bold;
            color:#FFF;
        }
        #demo-list a{
            overflow:hidden;
            text-overflow:ellipsis;
            -o-text-overflow:ellipsis;
            white-space:nowrap;
            width:100%;
        }
    </style>
    <style type="text/css">

        * {
            padding: 0;
            margin: 0;
        }

        ul {
            list-style: none;
        }

        .out {
            width: 350px;
            height: 245px;
            margin: 25px auto;
            position: relative;
        }

        .img li {
            position: absolute;
            top: 0px;
            left: 0px;
            display: none
        }

        .out .num {
            position: absolute;
            bottom: 0px;
            left: 0px;
            font-size: 0px;
            text-align: center;
            width: 100%;
        }

        .num li {
            width: 20px;
            height: 20px;
            background: #666666;
            color: #FFFFFF;
            text-align: center;
            line-height: 20px;
            display: inline-block;
            font-size: 16px;
            border-radius: 50%;
            margin-right: 10px;
            cursor: pointer;
        }

        .out .btn {
            position: absolute;
            top: 52%;
            margin-top: -30px;
            width: 45px;
            height: 60px;
            background: rgba(0, 0, 0, 0.5);
            color: #FFFFFF;
            text-align: center;
            line-height: 60px;
            font-size: 40px;
            display: none;
            cursor: pointer;
        }

        .out .num li.active-1 {
            background: #AA0000;
            margin-left:150px;
        }

        .out:hover .btn {
            display: block
        }

        .out .left {
            left: 0px;
        }

        .out .right {
            right: -150px;
        }
        #leftNav{
            margin-left:87px;
        }
    </style>
    <script src="<%=basePath%>js/jquery-accordion-menu.js" type="text/javascript"></script>
    <script type="text/javascript">

        var currentPage = 1;
        var currentTypeName;
        var totalPage;

        function initHead() {

            $.ajax({
                type:"POST",
                url:"<%=basePath%>gameType/getAllGameTypes.do",

                success:function (msg) {

                    var emptLi = $("<li></li>");
                    var headUl = $("#headLine");

                    var leftLine = $("#demo-list");
                    var operation1 = $("<li><input type=\"text\" class=\"form-control\" /></li>\n");
                    var operation2 = $("<li><a  id=\"search\" class=\"btn btn-primary \">查询</a></li>");
                    var headSelect = $("<select id=\"selectType\" class=\"form-control\"></select>");

                    var subLine = $("<li><a href=\"#\"><i class=\"fa fa-suitcase\"></i>更多类型 </a></li>");
                    var subUl = $("<ul class=\"submenu\"></ul>");
                    emptLi.append(headSelect);
                    for(var i=0;i<msg.length;i++){
                        if(msg[i].typeStatus==1){
                            var li = $("<li><a href=\"<%=basePath%>game/getAllGamesByType.do?typeName="+msg[i].typeId+"\" class=\"btn btn-primary\">"+msg[i].typeName+"</a></li>");
                            var opt = $("<option value=\""+msg[i].typeId+"\">"+msg[i].typeName+"</option>")
                            var option = $("<li><a onclick=\"searchButton('"+msg[i].typeId+"')\"><img width=\"50px\" src=\"/usedimg/gameType/"+msg[i].typePicture+"?temp=<%=Math.random()%>/\"/>"+msg[i].typeName+"</a></li>")

                            headUl.append(li);
                            headSelect.append(opt);

                            if (i<4){
                                leftLine.append(option);
                            }else {
                                subUl.append(option);
                            }
                        }
                    }

                    headUl.append(emptLi).append(operation1).append(operation2);
                    subLine.append(subUl);
                    leftLine.append(subLine);

                }
            });

        }
        function searchButton(gameTypeId) {

            currentTypeName = gameTypeId;
            currentPage = 1;
            search(currentPage);
        }
        function search(pageNum) {
            currentPage = pageNum;
            $.ajax({
                type:"POST",
                url:"<%=basePath%>game/getAllGame.do",
                data:({
                    "gameType":currentTypeName,
                    "pageNum":currentPage
                }),
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

                    var gameFiled = $("#nail2");
                    gameFiled.html("");
                    for (var i=0;i<game.length;i++){
                        var gameIntro = $("<div class=\"col-md-4 col-sm-6 \"><div class=\"thumbnail\">\n" +
                            "                    <img src=\"/usedimg/game/"+game[i].gameCover+"\" width=\"150\" height=\"150px\" alt=\"\">\n" +
                            "                    <div class=\"caption\"><h3>"+game[i].gameName+"</h3>\n" +
                            "                        <p><a href=\"<%=basePath%>game/gameDetails.do?gameId="+game[i].gameId+"&status=2&userId=${user.userId}\" class=\"btn btn-primary\">游戏详情</a></p>\n" +
                            "                    </div>\n" +
                            "                </div>\n" +
                            "                </div>");
                        gameFiled.append(gameIntro);
                    }
                }

            })
        }
    </script>
</head>
<body onLoad="initHead()">
<div class="container">
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
                                <li><a href="<%=basePath%>prep/getAllPreps.do?userId=${user.userId}">充值记录</a></li>
                                <li><a href="<%=basePath%>user/userDetail.jsp">账户信息</a></li>
                                <li><a href="<%=basePath%>user/expense.jsp">消费记录</a></li>
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
                <button id="closeBtn" type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">密保卡充值</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" action=""
                      enctype="multipart/form-data" method="post"  >
                    <div class="form-group">

                        <label for="cardNumber" class="col-sm-2 control-label">卡号</label>
                        <div class="col-sm-10">
                            <input  type="text" class="form-control" id="cardNumber"
                                   name="cardNumber" placeholder="请输入卡号">
                            <input type="hidden" name="userId" value="${user.userId}"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="cardPwd" class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-10">
                            <input id="cardPwd" type="text" class="form-control"  placeholder="请输入卡密码" name="cardPwd" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <script type="text/javascript">
                                function rechargeUser() {
                                    $.ajax({
                                        type:"POST",
                                        url:"<%=basePath%>user/userCharge.do",
                                        data:({
                                            "cardNumber":$("#cardNumber").val(),
                                            "cardPwd":$("#cardPwd").val(),
                                            "userId":"${user.userId}"
                                        }),
                                        success:function (msg) {
                                            if(msg=="1"){
                                                alert("卡号输入错误！")
                                            }
                                            if(msg=="2"){
                                                alert("此密保卡已过期！")
                                            }
                                            if(msg=="3"){
                                                alert("密码输入错误!")
                                            }
                                            if(msg=="4"){
                                                alert("此密保卡已被使用!")
                                            }
                                            if(msg=="5"){
                                                alert("该密保卡不可在您所在区域使用!")
                                            }
                                            if(msg=="6"){
                                                alert("充值成功！")
                                                document.getElementById("closeBtn").click()
                                            }
                                        }
                                    })
                                }
                            </script>
                            <button type="button" class="btn btn-default" onclick="rechargeUser()">确认充值</button>
                        </div>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>


<div class="row" style="background-color:#CCC; 
	overflow:hidden;" >
    <div class="col-md-12">
        <ul id="headLine" class="nav nav-pills col-md-offset-3" >
            <li class=><a href="portal.html" class="btn btn-primary">首页</a></li>

<%--            <li><a href="" class="btn btn-primary">棋牌游戏</a></li>--%>
<%--            <li><a href="" class="btn btn-primary">棋牌游戏</a></li>--%>
<%--            <li><a href="" class="btn btn-primary">棋牌游戏</a></li>--%>
<%--            <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>--%>
<%--            <li>--%>
<%--                <select id="selectType" class="form-control">--%>

<%--                    <option value="">棋牌游戏</option>--%>
<%--                    <option value="">棋牌游戏</option>--%>
<%--                    <option value="">棋牌游戏</option>--%>
<%--                    <option value="">棋牌游戏</option>--%>
<%--                </select>--%>
<%--            </li>--%>
<%--            <li><input type="text" class="form-control" /></li>--%>
<%--            <li><a  id="search" class="btn btn-primary ">查询</a></li>--%>

        </ul>
    </div>
</div>


<div id="nail1" class="container">
    <div class="row">
        <div class="col-md-6 ">
            <div class="out">
                <!--上面-->
                <ul class="img">

                    <li>
                        <a href="">
                            <img src="<%=basePath%>usedimg/game/YX0003.jpg" width="500"
                                 height="300" alt="" />
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <img src="<%=basePath%>usedimg/game/YX0004.jpg" width="500"
                                 height="300" alt="" />
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <img src="<%=basePath%>usedimg/game/YX0005.jpg" width="500"
                                 height="300" alt="" />
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <img src="<%=basePath%>usedimg/game/YX0001.jpg" width="500"
                                 height="300" alt="" />
                        </a>
                    </li>
                </ul>
                <!--下面-->
                <ul class="num">
                </ul>
                <div class="left btn">&lt;</div>
                <div class="right btn">&gt;</div>
            </div>
        </div>
        <div class="col-md-5 col-md-offset-1">

            <div class="row">&nbsp;</div>
            <table class="table">
                <thead>
                <tr>
                    <th>新闻公告</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td><a href="#">劳动节优惠先知</a></td>
                </tr>
                <tr>
                    <td><a href="#">情人节优惠放送</a></td>
                </tr>
                <tr>
                    <td><a href="#">定时充值返现活动</a></td>
                </tr>
                <tr>
                    <td><a href="#">体育竞技类游戏更新</a></td>
                </tr>
                <tr>
                    <td><a href="#">棋牌类游戏折扣活动</a></td>
                </tr>
                <tr>
                    <td><a href="#">直辖市优惠活动</a></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td><a href="#">更多</a></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="row">&nbsp;</div>
    <div class="row">&nbsp;</div>
    <div  class="row">
        <div class="col-md-12 ">
            <div id="leftNav" class="col-md-2">
                <div id="jquery-accordion-menu" class="jquery-accordion-menu red" >
                    <div class="jquery-accordion-menu-header" id="form"></div>
                    <ul id="demo-list">

<%--                        <li><a href=""><img width="50px" src="<%=basePath%>images/cover/1430727532556.jpg"/>棋牌游戏</a></li>--%>
<%--                        <li><a href=""><img width="50px" src="<%=basePath%>images/cover/1430727532556.jpg"/>益智游戏</a></li>--%>
<%--                        <li><a href=""><img width="50px" src="<%=basePath%>images/cover/1430727532556.jpg"/>逃生游戏</a></li>--%>
<%--                        <li><a href=""><img width="50px" src="<%=basePath%>images/cover/1430727532556.jpg"/>枪机游戏</a></li>--%>
<%--                        <li><a href=""><img width="50px" src="<%=basePath%>images/cover/1430727532556.jpg"/>角色扮演游戏</a></li>--%>

<%--                        <li><a href="#"><i class="fa fa-suitcase"></i>更多类型 </a>--%>
<%--                            <ul class="submenu">--%>
<%--                                <li><a href=""><img width="50px" src="<%=basePath%>images/cover/1430727532556.jpg"/>对战游戏</a></li>--%>
<%--                                <li><a href=""><img width="50px" src="<%=basePath%>images/cover/1430727532556.jpg"/>剧情游戏</a></li>--%>
<%--                                <li><a href=""><img width="50px" src="<%=basePath%>images/cover/1430727532556.jpg"/>团队游戏</a></li>--%>
<%--                            </ul>--%>
<%--                        </li>--%>


                    </ul>

                    <div class="jquery-accordion-menu-footer">
                        Footer
                    </div>
                </div>
            </div>
            <div id="nail2" class="col-md-8 col-md-offset-1">
                <div class="row"><div class="col-md-6"><h2>&nbsp;&nbsp;</h2></div></div>

<%--                <div class="col-md-4 col-sm-6 "><div class="thumbnail">--%>
<%--                    <img src="${pageContext.request.contextPath}/images/cover/" width="150" height="150px" alt="">--%>
<%--                    <div class="caption"><h3>密室逃脱</h3>--%>
<%--                        <p><a href="gameDetail.html" class="btn btn-primary">游戏详情</a></p>--%>
<%--                    </div>--%>
<%--                </div>--%>
                </div>

                <!-- <div class="col-md-4 col-sm-6 ">该游戏类型下没有提供可下载游戏</div> -->


            </div>
            <div id="pageNum" style="position: absolute;left: 60%;top: 95%">

            </div>

        </div>
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


<script type="text/javascript">
    $(function(){

        $("#123").click(function(){
            $("#myModal").modal('hide');
        });
    });

    (function($) {
        $.expr[":"].Contains = function(a, i, m) {
            return (a.textContent || a.innerText || "").toUpperCase().indexOf(m[3].toUpperCase()) >= 0;
        };
        function filterList(header, list) {
            //@header 头部元素
            //@list 无需列表
            //创建一个搜素表单
            var form = $("<form>").attr({
                "class":"filterform",
                action:"#"
            }), input = $("<input>").attr({
                "class":"filterinput",
                type:"text"
            });
            $(form).append(input).appendTo(header);
            $(input).change(function() {
                var filter = $(this).val();
                if (filter) {
                    $matches = $(list).find("a:Contains(" + filter + ")").parent();
                    $("li", list).not($matches).slideUp();
                    $matches.slideDown();
                } else {
                    $(list).find("li").slideDown();
                }
                return false;
            }).keyup(function() {
                $(this).change();
            });
        }
        $(function() {
            filterList($("#form"), $("#demo-list"));
        });
    })(jQuery);
    jQuery(document).ready(function () {
        jQuery("#jquery-accordion-menu").jqueryAccordionMenu();

    });

    $(function(){
        //顶部导航切换
        $("#demo-list li").click(function(){
            $("#demo-list li.active").removeClass("active");
            $(this).addClass("active");
        });
    })	;
    $(".classname img").addClass("carousel-inner img-responsive img-rounded");

</script>

</body>
</html>
