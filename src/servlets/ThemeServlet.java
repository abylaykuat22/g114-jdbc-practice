package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/theme")
public class ThemeServlet extends HttpServlet {

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    String color = req.getParameter("color");
    Cookie navbarColor = new Cookie("navbarColor", color);
    navbarColor.setMaxAge(500000000);
    resp.addCookie(navbarColor);
    resp.sendRedirect("/auth");
  }
}
