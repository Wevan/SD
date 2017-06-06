<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: Wean
  Date: 2017/6/5
  Time: 15:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        body{
            background-color: white;
            align-content: center;
            text-align: center;
        }
        #mod {
            padding-top: 10px;
        }
        h1 {
            font-family: "微软雅黑 Light";
            margin-top: 45px;
        }
        input {
            margin-top: 10px;
            width: 200px;
        }
    </style>
    <script>
        function Cmd(){
            var ipt = document.getElementById("add").getElementsByTagName("input");
            for(var i = 0; i < ipt.length; i++){
                if(ipt[i].value.length == 0){
                    alert("所有文本框都需要填写");
                    ipt[i].focus();
                    return false;
                }
            }
            return true;
        }
    </script>
</head>
<body>
<h1>修改信息</h1>
您将要修改id为<%
    request.setCharacterEncoding("utf-8");
    String a=request.getParameter("bookId");

    out.write(a);
%>的图书
<form action="/mod?bookId=<%=request.getParameter("bookId")%>" method="post" onsubmit="return Cmd()" id="">
    书名  ：<input type="text" name="bookName" value="<%=request.getParameter("bookName")%>"><br>
    作者  ：<input type="text" name="writer" value="<%=request.getParameter("writer")%>"><br>
    出版社：<input type="text" name="cbs" value="<%=request.getParameter("cbs")%>"><br>
    标签  ：<input type="text" name="items" value="<%=request.getParameter("items")%>"><br>
    <input type="submit" value="修改"><br>
    <input type="reset" value="重置">
</form>
</body>
</html>
