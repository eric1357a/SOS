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
  
  public SOSDB (String url, String username, String password) {
    this.url = url;
    this.username = username;
    this.password = password; 
  }
  
  protected Connection getConnection() throws SQLException, IOException {
    System.setProperty("jdbc.drivers", "org.apache.derby.jdbc.ClientDriver");
    return DriverManager.getConnection(url, username, password);
  }
  
  protected boolean tableExists (Connection con, String table) {
    int numRows = 0;
    try {
      DatabaseMetaData dbmd = con.getMetaData();
      ResultSet rs = dbmd.getTables(null, "APP", table.toUpperCase(), null);
      while(rs.next()) ++numRows;
    } catch (Exception e) {}
      System.out.println(""+numRows);
    return numRows > 0;
  }
  
  public void createTables(){
    java.sql.Connection conn = null;
    java.sql.Statement stat = null;
    String sql;
    try {
      conn = getConnection();
      stat = conn.createStatement();
      if (!tableExists(conn, "CATEGORY")) {
        sql = "CREATE TABLE CATEGORY ("
                + "CatID VARCHAR(5) CONSTRAINT PK_CATEGORY PRIMARY KEY,"
                + "Name VARCHAR(50))";
        stat.execute(sql);
      }
      if (!tableExists(conn, "ITEM")) {
        sql = "CREATE TABLE ITEM ("
                + "ItemNo VARCHAR(5) CONSTRAINT PK_ITEM PRIMARY KEY,"
                + "Name VARCHAR(50), Description VARCHAR(100), Brand VARCHAR(25), "
                + "CatID VARCHAR(5) REFERENCES CATEGORY(CatID), Price INTEGER)";
        stat.execute(sql);
      }
      if (!tableExists(conn, "CLIENT")) {
        sql = "CREATE TABLE CLIENT ("
                + "CID VARCHAR(5) CONSTRAINT PK_CLIENT PRIMARY KEY,"
                + "Name VARCHAR(50), Address VARCHAR(100), Bonus INTEGER,"
                + "Password VARCHAR(20), Phone INTEGER, Verified INTEGER)";
        stat.execute(sql);
      }
      if (!tableExists(conn, "CLIENT_ORDER")) {
        sql = "CREATE TABLE CLIENT_ORDER ("
                + "OrdNo VARCHAR(5) CONSTRAINT PK_CLIENT_ORDER PRIMARY KEY,"
                + "Timestamp VARCHAR(20), CID VARCHAR(5) REFERENCES CLIENT(CID))";
        stat.execute(sql);
      }
      stat.close();
      conn.close();
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
  
}
