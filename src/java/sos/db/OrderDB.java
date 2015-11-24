package sos.db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import sos.bean.*;

public class OrderDB extends SOSDB {

  public OrderDB(String url, String username, String password) {
    super(url, username, password);
  }
  
  public boolean addOrder(double amount, Date time, String status, int clientId) {
    PreparedStatement statement = null;
    boolean success = false;
    try {
      statement = getConnection().prepareStatement("INSERT INTO ORDERS (AMOUNT,TIME,STATUS,CLIENTID) VALUES (?,?,?,?)");
      statement.setDouble(1, amount);
      statement.setLong(2, time.getTime());
      statement.setString(3, status);
      statement.setInt(4, clientId);
      if (statement.executeUpdate() >= 1)
        success = true;
      statement.close();
    } catch (Exception e) {
      /* Who cares? */
    }
    return success;
  }
  
  private OrderBean orderFronResult (ResultSet result) throws Exception {
    OrderBean order = new OrderBean();
    order.setNo(result.getString("OrdNo"));
    order.setAmount(result.getDouble("Amount"));
    order.setTime(new Date(result.getLong("Time")));
    order.setStatus(result.getString("Status"));
    order.setClientId(result.getInt("ClientID"));
    return order;
  }
  
  public ArrayList<OrderBean> getOrdersByAttr(String attr, String op, String val) {
    return this.getOrdersByAttr(attr, op, val, -1);
  }
  
  public ArrayList<OrderBean> getOrdersByAttr(String attr, String op, String val, int limit) {
    PreparedStatement statement = null;
    ArrayList<OrderBean> orders = new ArrayList<>();
    try {
      statement = getConnection().prepareStatement("SELECT * FROM ORDERS WHERE " + attr +" " + op + " " + val);
      if (limit > 0)
        statement.setMaxRows(limit);
      ResultSet result = statement.executeQuery();
      while (result.next())
        orders.add(orderFronResult(result));
      statement.close();
    } catch (Exception e) {
      /* Who cares? */
    }
    return orders;
  }
  
}
