<%@ page import="models.Post" %>
<%@ page import="models.Author" %>
<%@ page import="java.util.List" %>
<%@ page import="models.Comment" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.temporal.ChronoUnit" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.Period" %><%--
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
    <%@include file="head.jsp" %>
</head>
<body>
<%@include file="navbar.jsp" %>
<div class="container">
    <div class="card bg-success col-8 mx-auto">
        <div class="card-body">
            <%
                Post post = (Post) request.getAttribute("novost");
                Author currentUser = (Author) session.getAttribute("currentUser");
                if (post != null) {
            %>
            <h1 class="text-center"><%=post.getTitle()%>
            </h1>
            <h5><%=post.getCategory().getName() + "/" + post.getCategory().getDescription()%>
            </h5>
            <p><%=post.getDescription()%>
            </p>
            <p>posted by <b><%=post.getAuthor().getFirstName() + " " + post.getAuthor()
                    .getLastName()%>
            </b>
                from <%=post.getAuthor().getCounty().getName()%>
            </p><br>
            <form action="/comment" method="post">
                <input type="hidden" name="post_id" value="<%=post.getId()%>">
                <textarea name="caption" class="form-control"
                          placeholder="Insert comment..."></textarea>
                <br>
                <button class="btn btn-primary">ADD COMMENT</button>
            </form>
            <hr>
            <%
                List<Comment> comments = (List<Comment>) request.getAttribute("comments");
                for (Comment c : comments) {
            %>
            <h5><%=c.getAuthor().getFirstName() + " " + c.getAuthor().getLastName()%>
            </h5>
            <p><%=c.getCaption()%>
            </p>
            <%--                <p><%=c.getCreatedDate().getDayOfMonth() + " " + c.getCreatedDate().getMonth()--%>
            <%--                + " " + c.getCreatedDate().getHour() + ":" + c.getCreatedDate().getMinute()%></p>--%>
            <%
                var resultHours = ChronoUnit.HOURS.between(c.getCreatedDate(), LocalDateTime.now());
                var resultDays = ChronoUnit.DAYS.between(c.getCreatedDate(), LocalDateTime.now());
                if (resultHours > 0 && resultHours < 24) {
            %>
            <p>comment added at <%=resultHours%> hours ago</p>
            <%
            } else if (resultDays > 0 && resultDays < 30) {
            %>
            <p>comment added at <%=resultDays%> days ago</p>
            <%
                    }
                }
            %>
            <%
                }
            %>
        </div>
    </div>
</div>
</body>
</html>
