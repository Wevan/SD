<%--
  Created by IntelliJ IDEA.
  User: Wean
  Date: 2017/6/3
  Time: 19:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        body {
            text-align: center;
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
            var ipt = document.getElementById("add").getElementsByTagName("input"); //查找divbox这个div里的所有文本框
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
<body bgcolor="white">
<h1>添加图书信息</h1>
<form action="/upImg" method="post" enctype="multipart/form-data" id="add" onsubmit="return Cmd();">
    <input type="file" name="pic" placeholder="上传图书封面" value=""><br>
    <input type="text" name="bookname" placeholder="书名"><br>
    <input type="text" name="writer" placeholder="作者"><br>
    <input type="text" name="cbs" placeholder="出版社"><br>
    <input type="text" name="items" placeholder="标签"><br>
    <input type="submit" value="添加"><br>
    <input type="reset" value="重置">
</form>
</body>
</html>
