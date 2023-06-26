package servlets;

import db.DBUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/addPost")
public class AddPostServlet extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    req.setAttribute("avtory", DBUtil.getAuthors());
    req.setAttribute("categories", DBUtil.getCategories());
    req.getRequestDispatcher("addPost.jsp").forward(req, resp);
  }

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    String title = req.getParameter("title");
    String description = req.getParameter("description");
    Long authorId = Long.parseLong(req.getParameter("author_id"));
    Long categoryId = Long.parseLong(req.getParameter("category_id"));
    DBUtil.addPost(title, description, authorId, categoryId);
    resp.sendRedirect("/home");
  }
}
