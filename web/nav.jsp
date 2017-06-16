<%--
  Created by IntelliJ IDEA.
  User: Wean
  Date: 2017/6/3
  Time: 12:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        #item {
            margin-top: 28px;
        }

        a {
            text-decoration: none;
            color: black;
        }

        body {
            text-align: center;
            align-content: center;
        }
    </style>
    <script>
        function del() {
            var msg = "确定退出系统吗？";
            if (confirm(msg)==true){
                return true;
            }else{
                return false;
            }
        }
    </script>
</head>
<body bgcolor="white">
<b style="margin-top: 10px">功能列表</b><br>
<div id="item">
    <a href="allInfo.jsp" target="show"> 查看图书</a><br>
    <hr>
    <a href="addInfo.jsp" target="show">添加图书</a>
    <hr>
    <a href="findMsg.jsp" target="show">查询信息</a>
    <hr>
    <a href="allLender.jsp" target="show">显示借阅人</a>
    <hr>
    <a href="addLender.jsp" target="show">新建借阅人</a>
    <hr>
    <a href="lendBook.jsp" target="show">借阅图书</a>
    <hr>
    <a href="returnBook.jsp" target="show">送还图书</a>
    <hr>
    <a href="overdue.jsp" target="show">逾期未还图书</a>
    <hr>
    <a href="/out" target="_parent" onclick="javascript:return del()">退出系统</a>
    <img src="image/nav.jpg" width="151px" height="80px" style="margin-top: 20px"/>
</div>
</body>
</html>
