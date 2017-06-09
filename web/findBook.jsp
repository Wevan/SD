<%--
  Created by IntelliJ IDEA.
  User: Wean
  Date: 2017/6/9
  Time: 14:21
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
            var ipt = document.getElementById("find").getElementsByTagName("input");
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
<h1>查找图书</h1>
<form action="findInfo.jsp" method="post" id="find" onsubmit="return Cmd();">
    <input type="text" name="message" placeholder="书名/作者/书号/标签"><br>
    <input type="submit" value="查找">
</form>
</body>
</html>
