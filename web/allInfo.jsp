<%@ page import="bean.Books" %>
<%@ page import="dao.BookDao" %>
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
        button{
            background-color:lightskyblue ;
            border: none;
        }
    </style>
</head>
<body bgcolor="white">


    <%
        BookDao bookDao = new BookDao();
        List<Books> list = bookDao.listBookInfo();
        for (Books books : list
                ) {



    %>
    <table>
    <tr>
        <td rowspan="4"><img src="<%=books.getImgPath()%>" width="130px" height="180px"></td>
    </tr>
    <tr>
        <td ><%=books.getBookname() + "( 书号：" + books.getBookid() + ")"%>
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
            <a href="/del?bookId=<%=books.getBookid()%>" class="right"><button>删除</button></a>
        </tr>
        <tr>
            <a href="/modify.jsp?bookId=<%=books.getBookid()%>&bookName=<%=books.getBookname()%>&writer=<%=books.getWriter()%>&cbs=<%=books.getCbs()%>&items=<%=books.getItems()%>" class="right"><button>修改</button></a>
        </tr>
</table>

    <hr>
    <%
        }
    %>



</body>
</html>
