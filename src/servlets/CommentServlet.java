package servlets;

import db.DBUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import models.Author;

@WebServlet(value = "/comment")
public class CommentServlet extends HttpServlet {

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    String caption = req.getParameter("caption");
    Long postId = Long.parseLong(req.getParameter("post_id"));
    Author author = (Author) req.getSession().getAttribute("currentUser");
    DBUtil.addComment(caption, postId, author.getId());
    resp.sendRedirect("/details?id=" + postId);
  }
}
