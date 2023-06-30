<%@ page import="models.Post" %><%--
  Created by IntelliJ IDEA.
  User: Kuat
  Date: 23.06.2023
  Time: 20:22
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
        <div class="card bg-success col-8 mx-auto">
            <div class="card-body">
                <%
                    Post post = (Post) request.getAttribute("novost");
                    if (post != null) {
                %>
                <h1 class="text-center"><%=post.getTitle()%></h1>
                <h5><%=post.getCategory().getName() + "/" + post.getCategory().getDescription()%></h5>
                <p><%=post.getDescription()%></p>
                <p>posted by <b><%=post.getAuthor().getFirstName() + " " + post.getAuthor().getLastName()%></b>
                    from <%=post.getAuthor().getCounty().getName()%>
                </p>
                <%
                    }
                %>
            </div>
        </div>
    </div>
</body>
</html>
