package models;

import java.time.LocalDateTime;
import java.util.Date;

public class Comment {
  private Long id;
  private String caption;
  private Author author;
  private Post post;
  private LocalDateTime createdDate;

  public Comment() {

  }

  public Comment(Long id, String caption, Author author, Post post, LocalDateTime createdDate) {
    this.id = id;
    this.caption = caption;
    this.author = author;
    this.post = post;
    this.createdDate = createdDate;
  }

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getCaption() {
    return caption;
  }

  public void setCaption(String caption) {
    this.caption = caption;
  }

  public Author getAuthor() {
    return author;
  }

  public void setAuthor(Author author) {
    this.author = author;
  }

  public Post getPost() {
    return post;
  }

  public void setPost(Post post) {
    this.post = post;
  }

  public LocalDateTime getCreatedDate() {
    return createdDate;
  }

  public void setCreatedDate(LocalDateTime date) {
    this.createdDate = date;
  }
}
