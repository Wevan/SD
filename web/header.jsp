<%--
  Created by IntelliJ IDEA.
  User: Wean
  Date: 2017/6/2
  Time: 20:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>Title</title>
    <style>
        #center {
            width: 100%;
            height: 50px;
        }

        font {
            padding-top: 20px;
            background-color: plum;
            font-family: 微软雅黑, serif;
        }

        button {
            background-color: lightskyblue;
            border: none;
        }

        .left-title {
            float: left;
            width: 50%;
        }

        .right-title {
            float: right;
            width: 10%;
        }
        .navbar{
            border-radius: 0;
        }

    </style>

</head>
<body>


<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">图书管理系统</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->


        <ul class="nav navbar-nav navbar-right">
            <li><a href="#">注册</a></li>
        </ul>
    </div><!-- /.navbar-collapse -->
</nav>

<%--<div id="center" align="center">--%>
    <%--<div class="left-title">--%>
        <%--<font color="white">--%>
            <%--<B>图书管理系统</B>--%>
        <%--</font>--%>
    <%--</div>--%>
    <%--<div class="right-title">--%>
        <%--<a>xxx</a>--%>
    <%--</div>--%>
<%--</div>--%>


</body>
</html>
