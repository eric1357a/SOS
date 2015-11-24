package sos.bean;

import java.io.Serializable;

public class AdminBean implements Serializable, IUserBean {

  private String username, password;

  public AdminBean() {
  }

  public AdminBean(String username, String password) {
    this.username = username;
    this.password = password;
  }

  public String getUsername() {
    return username;
  }

  public void setUsername(String username) {
    this.username = username;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

}
