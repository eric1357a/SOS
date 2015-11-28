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
  
  public boolean addClient(String name, int phone, String address) {
    PreparedStatement statement = null;
    boolean success = false;
    try {
      statement = getConnection().prepareStatement("INSERT INTO CLIENTS (PASSWORD,FULLNAME,PHONE,ADDRESS,VERIFIED,BONUS) VALUES (?,?,?,?,?,?)");
      statement.setString(1, "123");
      statement.setString(2, name);
      statement.setInt(3, phone);
      statement.setString(4, address);
      statement.setBoolean(5, false);
      statement.setInt(6, 10);
      if (statement.executeUpdate() >= 1)
        success = true;
      statement.close();
    } catch (Exception e) {
      e.printStackTrace();
    }
    return success;
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
      e.printStackTrace();
    }
    return null;
  }
  
  public ArrayList<ClientBean> getClientsByAttr(String attr, String op, String val) {
    PreparedStatement statement = null;
    ArrayList<ClientBean> clients = new ArrayList<>();
    try {
      statement = getConnection().prepareStatement("SELECT * FROM CLIENTS WHERE " + attr +" " + op + " " + val);
      ResultSet result = statement.executeQuery();
      while (result.next())
        clients.add(clientFromResult(result));
      statement.close();
    } catch (Exception e) {
      e.printStackTrace();
    }
    return clients;
  }
  
  public ClientBean getClientById(String id) {
    ArrayList<ClientBean> result = getClientsByAttr("CLIENTID", "=", id);
    return result.size() == 1 ? result.get(0) : null;
  }
  
  public boolean update(ClientBean client) {
    PreparedStatement statement = null;
    try {
      String preQueryStatement = "UPDATE CLIENTS SET PASSWORD=?,FULLNAME=?,PHONE=?,ADDRESS=?,VERIFIED=?,BONUS=? WHERE CLIENTID = ?";
      statement = getConnection().prepareStatement(preQueryStatement);
      statement.setString(1, client.getPassword());
      statement.setString(2, client.getName());
      statement.setInt(3, client.getPhone());
      statement.setString(4, client.getAddress());
      statement.setBoolean(5, client.getVerified());
      statement.setInt(6, client.getBonus());
      statement.setInt(7, client.getId());
      statement.executeUpdate();
      statement.close();
      return true;
    } catch (Exception e) {
      e.printStackTrace();
    }
    return false;
  }
  
}