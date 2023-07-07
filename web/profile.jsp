<%@ page import="models.Author" %><%--
  Created by IntelliJ IDEA.
  User: Kuat
  Date: 26.06.2023
  Time: 19:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="head.jsp"%>
</head>
<body>
    <%@include file="navbar.jsp"%>
    <%
        Author author = (Author) request.getSession().getAttribute("currentUser");
        if (author != null) {
    %>
    <h1><%=author.getFirstName() + " " + author.getLastName()%></h1>
    <form action="/logout" method="post">
        <button class="btn btn-dark">LOGOUT</button>
    </form>
    <%
        }
    %>

</body>
</html>
