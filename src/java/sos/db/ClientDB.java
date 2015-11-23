package sos.db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import sos.bean.*;

public class ClientDB extends SOSDB {

  public ClientDB(String url, String username, String password) {
    super(url, username, password);
  }
  
  public IUserBean login(String username, String password) {
    PreparedStatement statement;
    ResultSet result;
    try {
      statement = getConnection().prepareStatement("SELECT * FROM ADMINS WHERE USERNAME = ? AND PASSWORD = ?");
      statement.setString(1, username);
      statement.setString(2, password);
      result = statement.executeQuery();
      if (result.next()) {
        AdminBean bean = new AdminBean();
        bean.setUsername(result.getString("Username"));
        bean.setPassword(result.getString("Password"));
        return bean;
      } else {
        statement = getConnection().prepareStatement("SELECT * FROM CLIENTS WHERE CLIENTID = ? AND PASSWORD = ?");
        statement.setString(1, username);
        statement.setString(2, password);
        result = statement.executeQuery();
        if (result.next()) {
          ClientBean bean = new ClientBean();
          bean.setId(result.getInt("ClientID"));
          bean.setPassword(result.getString("Password"));
          bean.setName(result.getString("FullName"));
          bean.setPhone(result.getInt("Phone"));
          bean.setAddress(result.getString("Address"));
          bean.setAddress(result.getString("Address"));
          bean.setVerified(result.getBoolean("Verified"));
          bean.setBonus(result.getInt("Bonus"));
          return bean;
        }
      }
    } catch (Exception e) {
      /* Who cares? */
    }
    return null;
  }

}