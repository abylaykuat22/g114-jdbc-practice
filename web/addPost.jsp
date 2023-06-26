<%@ page import="models.Post" %>
<%@ page import="java.util.List" %>
<%@ page import="models.Author" %>
<%@ page import="models.Category" %><%--
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
                <form action="/addPost" method="post">
                    <div class="row mt-2">
                        <div class="col-4">
                            TITLE:
                        </div>
                        <div class="col-8">
                            <input type="text" class="form-control" name="title">
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-4">
                            DESCRIPTION:
                        </div>
                        <div class="col-8">
                            <textarea name="description" class="form-control"></textarea>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-4">
                            AUTHOR:
                        </div>
                        <div class="col-8">
                            <select name="author_id" class="form-select">
                                <%
                                    List<Author> authors = (List<Author>) request.getAttribute("avtory");
                                    for (Author a : authors) {
                                %>
                                <option value="<%=a.getId()%>"><%=a.getFirstName() + " " + a.getLastName()%></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-4">
                            CATEGORY:
                        </div>
                        <div class="col-8">
                            <select name="category_id" class="form-select">
                                <%
                                    List<Category> categories = (List<Category>) request.getAttribute("categories");
                                    for (Category c : categories) {
                                %>
                                <option value="<%=c.getId()%>"><%=c.getName()%></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <button class="btn btn-primary">ADD POST</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
