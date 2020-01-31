<%--
  Created by IntelliJ IDEA.
  User: soft01
  Date: 20-1-15
  Time: 下午3:22
  
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<html>
<head>
    <title>游币比例管理页面</title>
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

</head>
<body>
<div id="container">
    <div class="page-header ">
        <h2>游币换算比例</h2>
    </div>
    <form action="" >
        <div class="row">
            <div class="col-xs-4 col-sm-3 " >
                <div class="row">
                    <div class="col-xs-8 col-sm-2">
                        <span class="btn btn-default">省份</span>
                    </div>
                    <div class="col-xs-3 col-sm-5">
                        <select  class="form-control">

                            <option value="">北京</option>
                            <option value="">上海</option>
                            <option value="">江苏</option>

                        </select>
                    </div>
                    <div class="col-xs-6 col-sm-4 ">
                        <input type="button" class="btn btn-primary" id="search" value="查询" />
                    </div>
                </div>
            </div>

        </div>
    </form>
    <div class="row">&nbsp;</div>
    <div class="row">
        <div class="col-xs-6 col-sm-4">
            <a class="btn btn-primary" data-toggle="modal"
               data-target="#myModal"> <span class="glyphicon glyphicon-plus"></span>
                新增</a>

            <a class="btn btn-danger" > <span
                    class="glyphicon glyphicon-trash"></span> 删除</a>

        </div>
    </div>
    <div class="row">&nbsp;</div>
    <div class="row">
        <div class="col-xs-6 col-sm-11">
            <div class="table-responsive"
                 style="vertical-align: middle;text-align: center;">
                <div class="panel-body">  消费金额是指对应省份消费1元话费所赠送的游币数量 </div>
                <table id="searchTable"
                       class="table table-bordered table-hover table-condensed  ">
                    <tr>
                        <td><input type="checkbox" id="all" value="全选"
                        /> 全选</td>
                        <td>省份代码</td>
                        <td>省份</td>
                        <td>兑换比例</td>
                        <td>创建时间</td>
                        <td>修改时间</td>
                        <td>规则状态</td>
                        <td>操作</td>
                    </tr>

                    <tr>
                        <td><input type='checkbox'
                                   name='opt' value='' />
                        </td>
                        <td>1</td>
                        <td>北京</td>
                        <td>5</td>
                        <td>
                            2017-05-01 12:18:09
                        </td>
                        <td>
                            未曾修改
                        </td>
                        <td>
                            商用
                        </td>
                        <td>
                            <a class="btn btn-info btn-sm" href="updateExchange.html">
                                <span class="glyphicon glyphicon-pencil"></span>修改</a>
                        </td>
                    </tr>
                    <tr>
                        <td><input type='checkbox'
                                   name='opt' value='' />
                        </td>
                        <td>1</td>
                        <td>北京</td>
                        <td>5</td>
                        <td>
                            2017-05-01 12:18:09
                        </td>
                        <td>
                            未曾修改
                        </td>
                        <td>
                            商用
                        </td>
                        <td>
                            <a class="btn btn-info btn-sm" href="updateExchange.html">
                                <span class="glyphicon glyphicon-pencil"></span>修改</a>
                        </td>
                    </tr><tr>
                    <td><input type='checkbox'
                               name='opt' value='' />
                    </td>
                    <td>1</td>
                    <td>北京</td>
                    <td>5</td>
                    <td>
                        2017-05-01 12:18:09
                    </td>
                    <td>
                        未曾修改
                    </td>
                    <td>
                        商用
                    </td>
                    <td>
                        <a class="btn btn-info btn-sm" href="updateExchange.html">
                            <span class="glyphicon glyphicon-pencil"></span>修改</a>
                    </td>
                </tr><tr>
                    <td><input type='checkbox'
                               name='opt' value='' />
                    </td>
                    <td>1</td>
                    <td>北京</td>
                    <td>5</td>
                    <td>
                        2017-05-01 12:18:09
                    </td>
                    <td>
                        未曾修改
                    </td>
                    <td>
                        商用
                    </td>
                    <td>
                        <a class="btn btn-info btn-sm" href="updateExchange.html">
                            <span class="glyphicon glyphicon-pencil"></span>修改</a>
                    </td>
                </tr><tr>
                    <td><input type='checkbox'
                               name='opt' value='' />
                    </td>
                    <td>1</td>
                    <td>北京</td>
                    <td>5</td>
                    <td>
                        2017-05-01 12:18:09
                    </td>
                    <td>
                        未曾修改
                    </td>
                    <td>
                        下线
                    </td>
                    <td>
                        <a class="btn btn-info btn-sm" href="updateExchange.html">
                            <span class="glyphicon glyphicon-pencil"></span>修改</a>
                    </td>
                </tr>
                </table>

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
