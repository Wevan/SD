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
<%@ page contentType="text/html;charset=UTF-8" language="java" autoFlush="true" buffer="none" %>
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
            padding-top: 50px;
        }

        .button-a {
            margin: 10px 5px 5px 5px;
            background-color: lightskyblue;
            border: none;
        }

        #a-item {
            text-decoration-line: none;
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
    list = bookDao.listBookInfo();
    item = bookDao.getItems();
    System.out.println("2 list = " + list);

    for (Object i : item
            ) {
%>

<a href="itemInfo.jsp?item=<%=i.toString()%>" id="a-item">
    <button class="button-a"><%=i.toString()%>
    </button>
</a>

<%
    }

    for (Books books : list
            ) {


%>
<%--<table>--%>
    <%--<tr>--%>
        <%--<td rowspan="4"><img alt="图片不存在" src="<%=books.getImgPath()%>" width="130px" height="180px"></td>--%>
    <%--</tr>--%>
    <%--<tr>--%>
        <%--<td><%=books.getBookname() + "( 书号：" + books.getBookid() + "）"%>--%>
            <%--<%--%>
                <%--if (books.getIslend() != 1) {--%>
            <%--%>--%>
            <%--<img src="image/lend.png" width="24px" height="24px">--%>
            <%--<%--%>
                <%--}--%>
            <%--%>--%>
        <%--</td>--%>
    <%--</tr>--%>
    <%--<tr>--%>
        <%--<td><%=books.getWriter()%>--%>
        <%--</td>--%>
        <%--<td><%=books.getCbs()%>--%>
        <%--</td>--%>
    <%--</tr>--%>
    <%--<tr>--%>
        <%--<td><%=books.getItems()%>--%>
        <%--</td>--%>
        <%--<td class="right">--%>
            <%--<a href="/del?bookId=<%=books.getBookid()%>" class="right">--%>
                <%--<button class="btn btn-danger" type="submit">删除</button>--%>
            <%--</a>--%>
        <%--</td>--%>
        <%--<td class="right">--%>
            <%--<a href="/modify.jsp?bookId=<%=books.getBookid()%>&bookName=<%=books.getBookname()%>&writer=<%=books.getWriter()%>&cbs=<%=books.getCbs()%>&items=<%=books.getItems()%>"--%>
               <%--class="right">--%>
                <%--<button class="btn btn-success" type="submit">修改</button>--%>
            <%--</a>--%>
        <%--</td>--%>
    <%--</tr>--%>
<%--</table>--%>

<table>
    <tr>
        <td rowspan="4"><img alt="请刷新数据库" src="<%=books.getImgPath()%>" width="130px" height="180px"></td>
    </tr>
    <tr>
        <td><%=books.getBookname() + "( 书号：" + books.getBookid() + "）"%>
            <%
                if (books.getIslend() != 1) {
            %>
            <img src="image/lend.png" width="24px" height="24px">
            <%
                }
            %>
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
