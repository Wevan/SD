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
    <title>Title</title>
    <style>
        .right {
            float: right;
            padding-right: 20px;
            padding-bottom: 10px;
            padding-top: 160px;
        }

        button {
            background-color: lightskyblue;
            border: none;
        }

    </style>
<script>

        var n=document.getElementById('rand');
        n.style.background(rand(0,255),rand(0,255),rand(0,255));


</script>
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

    <a href="/itemInfo.jsp?item=<%=i.toString()%>">
        <button><%=i.toString()%></button>
    </a>

<%
    }

    for (Books books : list
            ) {


%>
<table>
    <tr>
        <td rowspan="4"><img alt="请刷新数据库" src="<%=books.getImgPath()%>" width="130px" height="180px"></td>
    </tr>
    <tr>
        <td><%=books.getBookname() + "( 书号：" + books.getBookid() + ")"%>
        </td>
    </tr>
    <tr>
        <td><%=books.getWriter()%>
        </td>
        <td><%=books.getCbs()%>
        </td>
    </tr>
    <tr>
        <td><%=books.getItems()%>
        </td>

    </tr>
    <tr>
        <a href="/del?bookId=<%=books.getBookid()%>" class="right">
            <button>删除</button>
        </a>
    </tr>
    <tr>
        <a href="/modify.jsp?bookId=<%=books.getBookid()%>&bookName=<%=books.getBookname()%>&writer=<%=books.getWriter()%>&cbs=<%=books.getCbs()%>&items=<%=books.getItems()%>"
           class="right">
            <button>修改</button>
        </a>
    </tr>
</table>

<hr>
<%
    }
%>


</body>
</html>
