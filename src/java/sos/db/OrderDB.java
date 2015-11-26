package sos.db;

import sos.tag.BonusRequestTag;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import sos.bean.*;

public class OrderDB extends SOSDB {

  public OrderDB(String url, String username, String password) {
    super(url, username, password);
  }
  
  public boolean addCreditRequest(int clientId, int bonus, long time) {
    PreparedStatement statement = null;
    boolean success = false;
    try {
      statement = getConnection().prepareStatement("INSERT INTO CREDIT_REQUESTS (CLIENTID,AMOUNT,TIME) VALUES (?,?,?)");
      statement.setInt(1, clientId);
      statement.setInt(2, bonus);
      statement.setLong(3, time);
      if (statement.executeUpdate() >= 1)
        success = true;
      statement.close();
    } catch (Exception e) {
      /* Who cares? */
    }
    return success;
  }
  
  public int addOrder(double amount, Date time, String ordType, String status, int clientId) {
    PreparedStatement statement = null;
    int id = -1;
    try {
      statement = getConnection().prepareStatement("INSERT INTO ORDERS (AMOUNT,TIME,ORDTYPE,STATUS,CLIENTID) VALUES (?,?,?,?,?)",
              Statement.RETURN_GENERATED_KEYS);
      statement.setDouble(1, amount);
      statement.setLong(2, time.getTime());
      statement.setString(3, ordType);
      statement.setString(4, status);
      statement.setInt(5, clientId);
      ResultSet rs;
      if (statement.executeUpdate() >= 1)
        if ((rs = statement.getGeneratedKeys()).next())
          id = rs.getInt(1);
      statement.close();
    } catch (Exception e) {
      /* Who cares? */
    }
    return id;
  }
  
  public boolean addProductOrder(int quantity, String prodNo, int ordNo) {
    PreparedStatement statement = null;
    boolean success = false;
    try {
      statement = getConnection().prepareStatement("INSERT INTO PRODUCTS_ORDERS (QUANTITY,PRODNO,ORDNO) VALUES (?,?,?)");
      statement.setInt(1, quantity);
      statement.setString(2, prodNo);
      statement.setInt(3, ordNo);
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
    order.setType(result.getString("OrdType"));
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
  
  public ArrayList<OrderBean> getOrder10LastClient(int clientID) {
    return getOrdersByAttr("CLIENTID", "=", clientID + " order by time desc", 10);
  }
  
  public ArrayList<OrderBean> getAllOrders() {
    return getOrdersByAttr("STATUS", "LIKE", "'%'");
  }
  
  public OrderBean getOrder(String no) {
    ArrayList<OrderBean> result = getOrdersByAttr("ORDNO", "=", no);
    return result.size() == 1 ? result.get(0) : null;
  }
  
  public boolean removeCreditRequest(String id) {
    PreparedStatement statement = null;
    boolean success = false;
    try {
      statement = getConnection().prepareStatement("DELETE FROM CREDIT_REQUESTS WHERE REQID = ?");
      statement.setString(1, id);
      if (statement.executeUpdate() >= 1)
        success = true;
      statement.close();
    } catch (Exception e) {
      /* Who cares? */
    }
    return success;
  }
  
  public ArrayList<BonusRequestBean> getCreditRequestsByAttr(String attr, String op, String val) {
    PreparedStatement statement = null;
    ArrayList<BonusRequestBean> requests = new ArrayList<>();
    try {
      statement = getConnection().prepareStatement("SELECT * FROM CREDIT_REQUESTS WHERE " + attr +" " + op + " " + val);
      ResultSet result = statement.executeQuery();
      while (result.next()) {
        BonusRequestBean req = new BonusRequestBean();
        req.setId(result.getString("ReqID"));
        req.setAmount(result.getInt("Amount"));
        req.setTime(result.getLong("Time"));
        req.setClientID(result.getInt("ClientID"));
        requests.add(req);
      }
      statement.close();
    } catch (Exception e) {
      /* Who cares? */
    }
    return requests;
  }
  
  public ArrayList<BonusRequestBean> getAllCreditRequests() {
    return this.getCreditRequestsByAttr("REQID", ">", "0");
  }
  
  public BonusRequestBean getCreditRequest(String id) {
    ArrayList<BonusRequestBean> result = getCreditRequestsByAttr("REQID", "=", id);
    return result.size() == 1 ? result.get(0) : null;
  }
  
}
