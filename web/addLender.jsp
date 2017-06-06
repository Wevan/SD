<%--
  Created by IntelliJ IDEA.
  User: Wean
  Date: 2017/6/5
  Time: 17:26
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
<h1>添加借阅人信息</h1>
<form action="/lender" method="post" onsubmit="return Cmd();" name="add">
    <input type="text" name="name" placeholder="姓名"><br>
    <input type="text" name="workId" placeholder="工号"><br>
    <input type="submit" value="创建"><br>
    <input type="reset" value="重置">
</form>
</body>
</html>
