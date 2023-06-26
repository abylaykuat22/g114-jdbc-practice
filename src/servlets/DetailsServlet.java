package servlets;

import db.DBUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/details")
public class DetailsServlet extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    Long id = Long.parseLong(req.getParameter("id"));
    req.setAttribute("novost", DBUtil.getPostById(id));
    req.getRequestDispatcher("details.jsp").forward(req, resp);
  }
}
