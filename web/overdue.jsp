<%@ page import="bean.Books" %>
<%@ page import="dao.BookDao" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Wean
  Date: 2017/6/9
  Time: 15:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        .right {
            float: right;
            padding-right: 10px;
            padding-bottom: 10px;
            padding-top: 60px;
        }

        button {
            background-color: lightskyblue;
            border: none;
        }
    </style>
</head>
<body bgcolor="white">


<%
    BookDao bookDao = new BookDao();
    List<Books> list = bookDao.overdue();

    for (Books books : list
            ) {


%>
<table>
    <tr>
        <td><%=books.getBookname() + "( 书号：" + books.getBookid() + ")"%>
        </td>
    </tr>
    <tr>
        <td><%="借阅号" + books.getIslend()%>
        </td>
    </tr>
    <tr>
        <td>
            <fmt:formatDate value="<%=books.getDate()%>" pattern="yyyy-MM-dd"/>
        </td>
    </tr>
    <tr>
        <a href="/overreturn?bookId=<%=books.getBookid()%>&id=<%=books.getIslend()%>" class="right">
            <button>已交罚金</button>
        </a>
    </tr>
</table>

<hr>
<%
    }
%>


</body>
</html>