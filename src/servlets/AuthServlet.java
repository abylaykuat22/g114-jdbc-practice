package servlets;

import db.DBUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import models.Author;

@WebServlet(value = "/auth")
public class AuthServlet extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    Author author = (Author) req.getSession().getAttribute("currentUser");
    if (author == null) {
      req.setAttribute("countries", DBUtil.getCountries());
      req.getRequestDispatcher("auth.jsp").forward(req, resp);
    }
    resp.sendRedirect("/home");
  }

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    String email = req.getParameter("email");
    String password = req.getParameter("password");
    String redirect = "/auth?error"; // req.setParameter("error")
    Author author = DBUtil.getAuthorByEmailAndPassword(email, password);
    if (author != null) {
      HttpSession session = req.getSession();
      session.setAttribute("currentUser", author);
      redirect = "/profile";
    }
    resp.sendRedirect(redirect);
  }
}
