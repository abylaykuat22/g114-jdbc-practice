<%@ page import="java.util.List" %>
<%@ page import="models.Post" %><%--
  Created by IntelliJ IDEA.
  User: Kuat
  Date: 23.06.2023
  Time: 19:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="head.jsp"%>
</head>
<body>

    <%
        String error = request.getParameter("error");
    %>
    <div class="container col-6 mx-auto mt-5">
        <form action="/theme" method="post">
        <select name="color">
            <option value="DARK">DARK</option>
            <option value="LIGHT">LIGHT</option>
        </select>
            <button class="btn btn-success">MAKE COLOR</button>
        </form>
        <%
            if (error != null) {
        %>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <strong>Incorrect email or password!</strong>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        <%
            }
        %>
        <form action="/auth" method="post">
            <div class="mb-3">
                <label class="form-label">Email address</label>
                <input name="email" type="email" class="form-control" aria-describedby="emailHelp">
                <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
            </div>
            <div class="mb-3">
                <label class="form-label">Password</label>
                <input name="password" type="password" class="form-control">
            </div>
            <button type="submit" class="btn btn-primary">SIGN IN</button>
        </form>
    </div>
</body>
</html>
