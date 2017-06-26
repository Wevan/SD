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
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>Title</title>
    <style>

        font {
            padding-top: 20px;
            background-color: plum;
            font-family: 微软雅黑, serif;
        }

        button {
            background-color: lightskyblue;
            border: none;
        }
        .navbar{
            border-radius: 0;
        }

    </style>

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
    <script>
        function Cmd(){
            var ipt = document.getElementById("regist").getElementsByTagName("input");
            for(var i = 0; i < ipt.length; i++){
                if(ipt[i].value.length == 0){
                    alert("所有文本框都需要填写");
                    ipt[i].focus();
                    return false;
                }
            }
            if(ipt[1].value()!=ipt[2].value()){
                alert("两次输入密码不一致！");
                ipt[2].focus();
                return false;
            }
            return true;
        }
    </script>


</head>
<body>
<%
    BookDao bookDao = new BookDao();
    List<Books> list = bookDao.overdue();
    String str = String.valueOf(list.size());
%>


<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">图书管理系统</a>
        </div>

        <ul class="nav navbar-nav navbar-right">
            <li><a data-toggle="modal" data-target="#register" href=""><span class="glyphicon glyphicon-user"></span> 注册</a></li>
        </ul>
    </div>
</nav>

<div id="register" class="modal fade" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <button class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>
            <div class="modal-title">
                <h1 class="text-center">注册</h1>
            </div>
            <div class="modal-body">
                <form id="regist" class="form-group" action="regist" onsubmit="return Cmd();">
                    <div class="form-group">
                        <label>用户名</label>
                        <input class="form-control" type="text" name="username" placeholder="6-15位字母或数字">
                    </div>
                    <div class="form-group">
                        <label>密码</label>
                        <input class="form-control" type="password" name="password" placeholder="至少6位字母或数字">
                    </div>
                    <div class="form-group">
                        <label>再次输入密码</label>
                        <input class="form-control" type="password" name="password2" placeholder="至少6位字母或数字">
                    </div>
                    <div class="text-right">
                        <button class="btn btn-primary" type="submit">提交</button>
                        <button class="btn btn-danger" data-dismiss="modal">取消</button>
                    </div>
                    <a href="" data-toggle="modal" data-dismiss="modal" data-target="#login">请注意账号唯一</a>
                </form>
            </div>
        </div>
    </div>
</div>

<%
    response.setHeader("Pragma", "No-Cache");
    response.setHeader("Cache-Control", "No-Cache");
    response.setDateHeader("Expires", 0);


%>
<div id="main">
    <iframe id="left" src="nav.jsp" frameborder="1px">
    </iframe>
    <iframe id="right" src="allInfo.jsp" name="show"></iframe>
</div>

<div id="footer">
    <jsp:include page="footer.jsp" flush="true"/>
</div>
<script type="text/javascript" language="javascript">
    alert(<%=str%>+
        "本书逾期未还！"
    )
    ;
</script>

<script>(function(T,h,i,n,k,P,a,g,e){g=function(){P=h.createElement(i);a=h.getElementsByTagName(i)[0];P.src=k;P.charset="utf-8";P.async=1;a.parentNode.insertBefore(P,a)};T["ThinkPageWeatherWidgetObject"]=n;T[n]||(T[n]=function(){(T[n].q=T[n].q||[]).push(arguments)});T[n].l=+new Date();if(T.attachEvent){T.attachEvent("onload",g)}else{T.addEventListener("load",g,false)}}(window,document,"script","tpwidget","//widget.seniverse.com/widget/chameleon.js"))</script>
<script>tpwidget("init", {
    "flavor": "bubble",
    "location": "WQXZZ8CQMBQZ",
    "geolocation": "enabled",
    "position": "bottom-right",
    "margin": "10px 10px",
    "language": "zh-chs",
    "unit": "c",
    "theme": "chameleon",
    "uid": "UBEF39CBB6",
    "hash": "8c66e22e26dcb967edd3a297b504b356"
});
tpwidget("show");</script>

</body>
</html>
