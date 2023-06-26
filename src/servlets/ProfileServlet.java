package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import models.Author;

@WebServlet(value = "/profile")
public class ProfileServlet extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    HttpSession session = req.getSession();
    Author author = (Author) session.getAttribute("currentUser");
    if (author != null) {
      req.getRequestDispatcher("profile.jsp").forward(req, resp);
    }
    req.getRequestDispatcher("auth.jsp").forward(req, resp);
  }
}
