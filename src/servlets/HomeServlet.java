package servlets;

import db.DBUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import models.Author;
import models.Post;

@WebServlet(value = "/home")
public class HomeServlet extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    Author author = (Author) req.getSession().getAttribute("currentUser");
    if (author != null) {
      req.setAttribute("novosti", DBUtil.getPosts());
      req.getRequestDispatcher("home.jsp").forward(req, resp);
    }
    req.getRequestDispatcher("auth.jsp").forward(req, resp);
  }
}
