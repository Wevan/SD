<%--
  Created by IntelliJ IDEA.
  User: Wean
  Date: 2017/6/9
  Time: 20:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        button {
            background-color: lightskyblue;
            border: none;
        }

        #header {
            width: 100%;
            height: auto;

        }

        #footer {
            margin-top: 20px;
            width: 100%;
            height: 100px;
            background-color: plum;
        }

        #main {
            margin-left: 42%;
            margin-top:200px;
            height: 250px;
        }

        head, body {
            margin: 0;
            padding: 0;
        }

        #password{
            width: 200px;
            height: 40px;
        }
        #btn{
            height: 40px;
        }
        body {
            -webkit-background-image: url(image/bg.jpg);
            -moz-background-image: url(image/bg.jpg);
            -o-background-image: url(image/bg.jpg);
            background: url(image/bg.jpg) no-repeat;
            background-size: 100%;
            margin-left: 0;
            align-content: center;
        }
    </style>
    <script>
        var str;
        function aa(){
            str=enter.password.value;
            var ipt = document.getElementById("enter").getElementsByTagName("input");
            if(ipt[0].value.length == 0){
                alert("请填写密码");
                ipt[0].focus();
                return false;
            }else {
                if (str==="123456"){
                    return true;
                }else {
                    alert("口令错误！");
                    document.getElementById("password").value="";
                    return false;
                }
            }

        }
    </script>
</head>
<body>
<div id="header">
    <jsp:include page="header.jsp"/>
</div>
<%
    response.setHeader("Pragma", "No-Cache");

    response.setHeader("Cache-Control", "No-Cache");

    response.setDateHeader("Expires", 0);
%>
<div id="main">
    <form action="index.jsp" method="post" id="enter" name="enter" onsubmit="return aa();">
        <input type="password" name="password" placeholder="请输入口令" id="password">&nbsp;
        <input type="submit" value="进入系统" id="btn">
    </form>
</div>
<div id="footer">
    <jsp:include page="footer.jsp"/>
</div>
</body>
</html>
