<%@ page import="java.util.List" %>
<%@ page import="models.Post" %>
<%@ page import="models.Country" %>
<%@ page import="models.Author" %>
<%@ page import="models.Country" %><%--
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
        String errEmail = request.getParameter("err-email");
        String errPassword = request.getParameter("err-password");
        String success = request.getParameter("success");
        Author signUpAuthor = (Author) session.getAttribute("sign-up-data");
    %>
    <div class="container col-6 mx-auto mt-5">
<%--        <form action="/theme" method="post">--%>
<%--        <select name="color">--%>
<%--            <option value="DARK">DARK</option>--%>
<%--            <option value="LIGHT">LIGHT</option>--%>
<%--        </select>--%>
<%--            <button class="btn btn-success">MAKE COLOR</button>--%>
<%--        </form>--%>
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
        <%
            if (errEmail != null) {
        %>
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <strong>Email is busy!</strong>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        <%
            }
        %>
        <%
            if (errPassword != null) {
        %>
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <strong>Passwords are not same!</strong>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        <%
            }
        %>
        <%
            if (success != null) {
        %>
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            <strong>U are created new account!</strong>
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
            <!-- Button trigger modal -->
            <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#signupModal">
                SIGN UP
            </button>
        </form>

        <!-- Modal -->
        <form action="/signup" method="post">
            <div class="modal fade" id="signupModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">SIGN UP.</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="mb-3">
                                <label class="form-label">Email address</label>
                                <input value="<%=signUpAuthor != null ? signUpAuthor.getEmail() : ""%>" name="email" type="email" class="form-control">
                            </div>
                            <div class="mb-3">
                                <label for="validationPassword" class="form-label">Password</label>
                                <div class="input-group has-validation">
                                    <input name="password" onkeyup="passValidation()" type="password" class="form-control" id="validationPassword" aria-describedby="inputGroupPrepend3 validationServerUsernameFeedback" required>
                                    <script type="text/javascript">
                                      function passValidation() {
                                        var value = document.getElementById('validationPassword').value
                                        if (value.length < 6) {
                                          document.getElementById('validationPasswordFeedback').style = "display: block"
                                        } else {
                                          document.getElementById('validationPasswordFeedback').style = "display: none"
                                        }
                                      }
                                    </script>
                                    <div style="display: none" id="validationPasswordFeedback" class="invalid-feedback">
                                        min 6 symbols.
                                    </div>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="validationRePassword" class="form-label">Retype Password</label>
                                <div class="input-group has-validation">
                                    <input name="re_password" onkeyup="rePassValidation()" type="password" class="form-control" id="validationRePassword" aria-describedby="inputGroupPrepend3 validationServerUsernameFeedback" required>
                                    <script type="text/javascript">
                                      function rePassValidation() {
                                        var value = document.getElementById('validationRePassword').value
                                        if (value !== document.getElementById('validationPassword').value) {
                                          document.getElementById('validationRePasswordFeedback').style = "display: block"
                                        } else {
                                          document.getElementById('validationRePasswordFeedback').style = "display: none"
                                        }
                                      }
                                    </script>
                                    <div style="display: none" id="validationRePasswordFeedback" class="invalid-feedback">
                                        Password are not same!.
                                    </div>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">First name</label>
                                <input value="<%=signUpAuthor != null ? signUpAuthor.getFirstName() : ""%>" name="first_name" type="text" class="form-control">
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Last name</label>
                                <input value="<%=signUpAuthor != null ? signUpAuthor.getLastName() : ""%>" name="last_name" type="text" class="form-control">
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Country</label>
                                <select name="country_id" class="form-select">
                                    <%
                                        List<Country> counties = (List<Country>) request.getAttribute("countries");
                                        for (Country country : counties) {
                                    %>
                                    <%
                                        if (signUpAuthor != null && signUpAuthor.getCounty().getId() == country.getId()) {
                                    %>
                                        <option selected value="<%=country.getId()%>">
                                            <%=country.getName() + "/" + country.getShortName()%>
                                        </option>
                                    <%
                                        } else {
                                    %>
                                        <option value="<%=country.getId()%>">
                                            <%=country.getName() + "/" + country.getShortName()%>
                                        </option>
                                    <%
                                        }
                                    %>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">CREATE ACCOUNT</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</body>
</html>

