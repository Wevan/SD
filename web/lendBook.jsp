<%--
  Created by IntelliJ IDEA.
  User: Wean
  Date: 2017/6/5
  Time: 19:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        body {
            text-align: center;
            background-color: white;
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
            var ipt = document.getElementById("lend").getElementsByTagName("input"); //查找divbox这个div里的所有文本框
            for(var i = 0; i < ipt.length; i++){ //循环
                if(ipt[i].value.length == 0){ //如果其中一个文本框没有填写
                    alert("所有文本框都需要填写"); //弹出提示
                    ipt[i].focus(); //定位到没有填写的文本框
                    return false; //返回false
                }
            }
            return true; //都已经填写，返回true
        }
    </script>
</head>
<body>
<h1>
    借阅图书
</h1>
<form action="/lend" method="post" name="lend" onsubmit="return Cmd();">
    <input type="text" name="id" placeholder="借阅号"><br>
    <input type="text" name="bookId" placeholder="书号"><br>
    <input type="submit" value="借阅"><br>
    <input type="reset" value="重置">
</form>
</body>
</html>
