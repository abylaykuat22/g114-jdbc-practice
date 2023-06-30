package servlets;

import db.DBUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import models.Author;
import models.Country;

@WebServlet(value = "/signup")
public class SignupServlet extends HttpServlet {

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    String email = req.getParameter("email");
    String password = req.getParameter("password");
    String rePassword = req.getParameter("re_password");
    String firstName = req.getParameter("first_name");
    String lastName = req.getParameter("last_name");
    Long countryId = Long.parseLong(req.getParameter("country_id"));

    String redirect = "/auth?err-email";
    Author author = DBUtil.getAuthorByEmail(email);

    Country country = DBUtil.getCountryById(countryId);
    Author signUpAuthor = new Author();
    signUpAuthor.setEmail(email);
    signUpAuthor.setFirstName(firstName);
    signUpAuthor.setLastName(lastName);
    signUpAuthor.setCounty(country);
    if (author == null) {
      if (password.equals(rePassword)) {
        author = new Author(firstName, lastName, email, password);
        DBUtil.addAuthor(author, countryId);
        redirect = "/auth?success";
      }
    }
    req.getSession().setAttribute("sign-up-data", signUpAuthor);
    resp.sendRedirect(redirect);
  }
}
