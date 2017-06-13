<%--
  Created by IntelliJ IDEA.
  User: Wean
  Date: 2017/6/13
  Time: 20:04
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
            align-content: center;
        }

        h1 {
            font-family: "微软雅黑 Light";
            margin-top: 45px;
        }

        input {
            margin-top: 10px;
            width: 200px;
        }
        button{
            background-color:lightskyblue ;
            margin-top: 10px;
            width: 200px;
            border: none;
        }
        /*.right {*/
            /*padding-right: 20px;*/
            /*padding-bottom: 10px;*/
            /*padding-top: 160px;*/
        /*}*/
    </style>
</head>
<body>
<h1>
    查询信息
</h1>
<table>
    <tr>
        <td>
            <a href="lendMsg.jsp" class="right">
                <button>查询借阅情况</button>
            </a>
        </td>
        <td>
            <a href="findBook.jsp" class="right">
                <button>查询图书信息</button>
            </a>
        </td>
    </tr>
</table>

</body>
</html>
