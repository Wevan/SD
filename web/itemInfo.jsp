<%@ page import="bean.Books" %>
<%@ page import="dao.BookDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Wean
  Date: 2017/6/2
  Time: 19:07
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
        .right {
            float: right;
            padding-right: 20px;
            padding-bottom: 10px;
            padding-top: 160px;
        }

        button {
            margin: 10px 5px 5px 5px;
            background-color: lightskyblue;
            border: none;
        }
        #a-item{
            text-decoration-line: none;
        }
        img{
            padding-left: 15px;
        }
        table{
            margin-left: 15px;
        }
    </style>

</head>
<body bgcolor="white">

<%
    response.setHeader("Pragma", "No-Cache");
    response.setHeader("Cache-Control", "No-Cache");
    response.setDateHeader("Expires", 0);
    BookDao bookDao = new BookDao();
    List<Books> list = new ArrayList<>();
    List item = new ArrayList();
    System.out.println("1 list = " + list);
    list = bookDao.selectBook(request.getParameter("item"));
    item = bookDao.getItems();
    System.out.println("2 list = " + list);

    for (Object i : item
            ) {
%>

    <a href="itemInfo.jsp?item=<%=i.toString()%>" id="a-item">
        <button><%=i.toString()%></button>
    </a>

<%
    }

    for (Books books : list
            ) {


%>
<table>
    <tr>
        <td>&nbsp;&nbsp;&nbsp;</td>
    </tr>
    &nbsp;&nbsp;
    <tr>
        <td rowspan="4"><img alt="请刷新数据库" src="<%=books.getImgPath()%>" width="130px" height="180px"></td>
    </tr>
    <tr>
        <td><%=books.getBookname() + "( 书号：" + books.getBookid() + ")"%>
        </td>
    </tr>
    &nbsp;&nbsp;
    <tr>
        <td><%=books.getWriter()%>
        </td>
        <td><%=books.getCbs()%>
        </td>
    </tr>
    &nbsp;&nbsp;
    <tr>
        <td><%=books.getItems()%>
        </td>

    </tr>
    <tr>
        <a href="/del?bookId=<%=books.getBookid()%>" class="right">
            <button class="btn btn-danger">删除</button>
        </a>
    </tr>
    <tr>
        <a href="/modify.jsp?bookId=<%=books.getBookid()%>&bookName=<%=books.getBookname()%>&writer=<%=books.getWriter()%>&cbs=<%=books.getCbs()%>&items=<%=books.getItems()%>"
           class="right">
            <button class="btn btn-success">修改</button>
        </a>
    </tr>
</table>

<hr>
<%
    }
%>
</body>
</html>