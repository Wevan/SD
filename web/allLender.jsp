<%@ page import="bean.Lender" %>
<%@ page import="dao.LenderDao" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Wean
  Date: 2017/6/5
  Time: 19:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>

    </style>
</head>
<body bgcolor="white">
<%
    LenderDao lenderDao = new LenderDao();
    List<Lender> list = lenderDao.listLenderInfo();
    for (Lender lender : list
            ) {
%>
<table>
    <tr>
        <td>工号：<%=lender.getWorkid()%></td>
    </tr>
    <tr>
        <td>借阅号：<%=lender.getId()%></td>
    </tr>
    <tr>
        <td>姓名：<%=lender.getName()%></td>
    </tr>
</table>
<hr>
<%
    }
%>

</body>
</html>
