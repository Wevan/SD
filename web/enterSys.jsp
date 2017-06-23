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
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>Title</title>
    <style>
        button {
            background-color: lightskyblue;
            border: none;
        }

        .input-group {
            width: 300px;
        }

        .main {
            margin-left: 40%;
            margin-top: 250px;
            height: 250px;
        }

        head, body {
            margin: 0;
            padding: 0;
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
        function aa() {
            str = enter.password.value;
            var ipt = document.getElementById("enter").getElementsByTagName("input");
            if (ipt[0].value.length == 0) {
                alert("请填写密码");
                ipt[0].focus();
                return false;
            } else {
                return true;
            }
        }


    </script>
</head>
<body>

<%
    response.setHeader("Pragma", "No-Cache");
    response.setHeader("Cache-Control", "No-Cache");
    response.setDateHeader("Expires", 0);
%>

<form action="check" method="post" id="enter" name="enter" onsubmit="return aa();" class="main">

    <div class="input-group">
                <span class="input-group-addon" id="basic-addon1">
                  <img src="image/user.png" width="13px" height="13px">
                </span>
        <input type="text" class="form-control" placeholder="Username" name="username" aria-describedby="basic-addon1">
    </div>
    <br>

    <div class="input-group">
        <input type="password" class="form-control" name="password" placeholder="password">
        <span class="input-group-btn">
        <button class="btn btn-default" type="submit">Go!</button>
      </span>
    </div>

</form>

</body>
</html>
