<%--
  Created by IntelliJ IDEA.
  User: Wean
  Date: 2017/6/23
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        body {
            text-align: center;
            align-content: center;
            background-color: white;

        }

        body {
            -webkit-background-image: url(image/regfail.jpg);
            -moz-background-image: url(image/regfail.jpg);
            -o-background-image: url(image/regfail.jpg);
            background: url(image/regfail.jpg) no-repeat;
            background-size: 100%;
            margin-left: 0;
        }
    </style>

    <script type="text/javascript">
        onload = function () {
                setTimeout(go, 3000);
        };
        function go() {
            location.href = "http://localhost:8080/index.jsp";
        }
    </script>
</head>
<body>
</body>
</html>