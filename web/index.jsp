<%@ page import="bean.Books" %>
<%@ page import="dao.BookDao" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Wean
  Date: 2017/5/30
  Time: 19:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" autoFlush="true" %>

<html>
<head>
    <title>$Title$</title>
    <style>
        #left {
            float: left;
            width: 15%;
            border: 0;
            margin-left: 7%;
            height: 100%;

        }

        #right {
            background: inherit;
            border: 0;
            float: right;
            margin-right: 7%;
            margin-left: 5px;
            width: 70%;
            height: 100%;

        }

        #header {
            width: 100%;
            height: auto;

        }

        #footer {
            margin-top: 20px;
            width: 100%;
            height: 100px;
            background-color: plum;
        }

        #main {
            margin-top: 15px;
            width: 100%;
            height: 500px;
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
        }
    </style>
</head>
<body>
<%
    BookDao bookDao = new BookDao();
    List<Books> list = bookDao.overdue();
    String str = String.valueOf(list.size());
%>


<div id="header">
    <jsp:include page="header.jsp" flush="true"/>
</div>
<%
    response.setHeader("Pragma", "No-Cache");
    response.setHeader("Cache-Control", "No-Cache");
    response.setDateHeader("Expires", 0);
    if (session.getAttribute("enter").equals("1")) {

%>
<div id="main">
    <iframe id="left" src="nav.jsp" frameborder="1px">
    </iframe>
    <iframe id="right" src="allInfo.jsp" name="show"></iframe>
</div>
<%
    } else {
        response.sendRedirect("enterSys.jsp");
    }
%>
<div id="footer">
    <jsp:include page="footer.jsp" flush="true"/>
</div>
<script type="text/javascript" language="javascript">
    alert(<%=str%>+
        "本书逾期未还！"
    )
    ;
</script>

</body>
</html>
