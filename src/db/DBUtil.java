package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import models.Author;
import models.Category;
import models.County;
import models.Post;

public class DBUtil {
  private static Connection connection;

  static {
    try {
      Class.forName("org.postgresql.Driver");
      connection = DriverManager.getConnection(
          "jdbc:postgresql://localhost:5432/G114-JDBC-INNERJOIN-PRACTICE-DB",
          "postgres",
          "postgres"
      );
    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  public static List<Post> getPosts() {
    List<Post> posts = new ArrayList<>();
    try {
      PreparedStatement statement = connection.prepareStatement(
          "select p.id, p.title, a.first_name, a.last_name, c.name from posts p "
              + "inner join authors a on p.author_id = a.id "
              + "inner join categories c on p.category_id = c.id");
      ResultSet resultSet = statement.executeQuery();
      while (resultSet.next()) {
        Post post = new Post();
        post.setId(resultSet.getLong("id"));
        post.setTitle(resultSet.getString("title"));

        Author author = new Author();
        author.setFirstName(resultSet.getString("first_name"));
        author.setLastName(resultSet.getString("last_name"));
        post.setAuthor(author);

        Category category = new Category();
        category.setName(resultSet.getString("name"));
        post.setCategory(category);
        posts.add(post);
      }
      statement.close();
    }catch (Exception e) {
      e.printStackTrace();
    }
    return posts;
  }

  public static Post getPostById(Long id) {
    Post post = null;
    try {
      PreparedStatement statement = connection.prepareStatement(
          "select p.id, p.title, p.description, a.first_name, a.last_name, "
              + "co.name as countryName, c.name, c.description as categoryDes from posts p "
              + "inner join authors a on p.author_id = a.id "
              + "inner join categories c on p.category_id = c.id "
              + "inner join countries co on a.country_id = co.id "
              + "where p.id = ?");
      statement.setLong(1, id);
      ResultSet resultSet = statement.executeQuery();
      if (resultSet.next()) {
        post = new Post();
        post.setId(resultSet.getLong("id"));
        post.setTitle(resultSet.getString("title"));
        post.setDescription(resultSet.getString("description"));

        Author author = new Author();
        author.setFirstName(resultSet.getString("first_name"));
        author.setLastName(resultSet.getString("last_name"));

        County county = new County();
        county.setName(resultSet.getString("countryName"));

        author.setCounty(county);
        post.setAuthor(author);

        Category category = new Category();
        category.setName(resultSet.getString("name"));
        category.setDescription(resultSet.getString("categoryDes"));
        post.setCategory(category);
      }
    }catch (Exception e) {
      e.printStackTrace();
    }
    return post;
  }

  public static List<Author> getAuthors() {
    List<Author> authors = new ArrayList<>();
    try {
      PreparedStatement statement = connection.prepareStatement(
          "select a.id, a.first_name, a.last_name from authors a");
      ResultSet resultSet = statement.executeQuery();
      while (resultSet.next()) {
        Author author = new Author();
        author.setId(resultSet.getLong("id"));
        author.setFirstName(resultSet.getString("first_name"));
        author.setLastName(resultSet.getString("last_name"));
        authors.add(author);
      }
      statement.close();
    }catch (Exception e) {
      e.printStackTrace();
    }
    return authors;
  }

  public static List<Category> getCategories() {
    List<Category> categories = new ArrayList<>();
    try {
      PreparedStatement statement = connection.prepareStatement(
          "select a.id, a.name from categories a");
      ResultSet resultSet = statement.executeQuery();
      while (resultSet.next()) {
        Category category = new Category();
        category.setId(resultSet.getLong("id"));
        category.setName(resultSet.getString("name"));
        categories.add(category);
      }
      statement.close();
    }catch (Exception e) {
      e.printStackTrace();
    }
    return categories;
  }

  public static void addPost(String title, String description, Long authorId, Long categoryId) {
    try {
      PreparedStatement statement = connection.prepareStatement(
          "insert into posts(title, description, author_id, category_id) "
              + "values (?,?,?,?)");
      statement.setString(1, title);
      statement.setString(2, description);
      statement.setLong(3, authorId);
      statement.setLong(4, categoryId);
      statement.executeUpdate();
      statement.close();
    }catch (Exception e) {
      e.printStackTrace();
    }
  }
}
