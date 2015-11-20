package sos.db;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SOSDB {

  final protected String url;
  final protected String username;
  final protected String password;

  public SOSDB(String url, String username, String password) {
    this.url = url;
    this.username = username;
    this.password = password;
  }

  protected Connection getConnection() throws SQLException, IOException {
    System.setProperty("jdbc.drivers", "org.apache.derby.jdbc.ClientDriver");
    return DriverManager.getConnection(url, username, password);
  }
  
}