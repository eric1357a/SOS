package sos.db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import sos.bean.*;

public class UserDB extends SOSDB {

  public UserDB(String url, String username, String password) {
    super(url, username, password);
  }
  
  private ClientBean clientFromResult (ResultSet result) throws Exception {
    ClientBean client = new ClientBean();
    client.setId(result.getInt("ClientID"));
    client.setPassword(result.getString("Password"));
    client.setName(result.getString("FullName"));
    client.setPhone(result.getInt("Phone"));
    client.setAddress(result.getString("Address"));
    client.setAddress(result.getString("Address"));
    client.setVerified(result.getBoolean("Verified"));
    client.setBonus(result.getInt("Bonus"));
    return client;
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
          ClientBean client = clientFromResult(result);
          return client.getVerified() ? client : null;
        }
      }
    } catch (Exception e) {
      /* Who cares? */
    }
    return null;
  }
  
  public ArrayList<ClientBean> getClientByAttribute(String attr, String val) {
    PreparedStatement statement = null;
    ArrayList<ClientBean> clients = new ArrayList<>();
    try {
      statement = getConnection().prepareStatement("SELECT * FROM CLIENTS WHERE " + attr + " LIKE \"%" + val + "%\"");
      statement.setString(1, val);
      ResultSet result = statement.executeQuery();
      while (result.next()) {
        ClientBean client = clientFromResult(result);
        clients.add(client);
      }
      statement.close();
    } catch (Exception e) {
      /* Who cares? */
    }
    return clients;
  }

}