<%@ page import="bean.Books" %>
<%@ page import="dao.LenderDao" %>
<%@ page import="java.util.List" %>
<%@ page import="bean.Lender" %><%--
  Created by IntelliJ IDEA.
  User: Wean
  Date: 2017/6/13
  Time: 20:12
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
    request.setCharacterEncoding("utf-8");
    LenderDao lenderDao=new LenderDao();
    List<Books> list = lenderDao.findLender(request.getParameter("lendmsg"));
    System.out.println("list = " + list);
    for (Books books : list
            ) {



%>
<table>
    <tr>
        <td rowspan="4"><img src="<%=books.getImgPath()%>" width="130px" height="180px"></td>
    </tr>
    <tr>
        <td ><%=books.getBookname() + "( 书号：" + books.getBookid() + "    被借阅号："+request.getParameter("lendmsg")+")"%>
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

</table>

<hr>
<%
    }
%>



</body>
</html>
