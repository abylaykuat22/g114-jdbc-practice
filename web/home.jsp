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
    <%@include file="navbar.jsp"%>
    <div class="container">
        <table class="table table-striped">
            <thead>
                <th>ID</th>
                <th>TITLE</th>
                <th>AUTHOR</th>
                <th>CATEGORY</th>
                <th>DETAILS</th>
            </thead>
            <tbody>
                <%
                    List<Post> posts = (List<Post>) request.getAttribute("novosti");
                    for (Post p : posts) {
                %>
                <tr>
                    <td><%=p.getId()%></td>
                    <td><%=p.getTitle()%></td>
                    <td><%=p.getAuthor().getFirstName() + " " + p.getAuthor().getLastName()%></td>
                    <td><%=p.getCategory().getName()%></td>
                    <td><a href="/details?id=<%=p.getId()%>" class="btn btn-dark">DETAILS</a></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
