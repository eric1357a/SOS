package sos.db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import sos.bean.ItemBean;

public class ItemDB extends SOSDB {

  public ItemDB(String url, String username, String password) {
    super(url, username, password);
  }

  public boolean addItem(String name, String desc, String brand, String catId, float price) {
    PreparedStatement statement = null;
    boolean success = false;
    try {
      statement = getConnection().prepareStatement("INSERT INTO PRODUCTS VALUES (?,?,?,?,?)");
      statement.setString(1, name);
      statement.setFloat(2, price);
      statement.setString(3, desc);
      statement.setString(4, catId);
      statement.setString(5, brand);
      if (statement.executeUpdate() >= 1)
        success = true;
      statement.close();
    } catch (Exception e) {
      /* Who cares? */
    }
    return success;
  }

  public boolean removeItem(int prodNo) {
    PreparedStatement statement = null;
    boolean success = false;
    try {
      statement = getConnection().prepareStatement("DELETE FROM PRODUCTS WHERE PRODNO = ?");
      statement.setInt(1, prodNo);
      if (statement.executeUpdate() >= 1)
        success = true;
      statement.close();
    } catch (Exception e) {
      /* Who cares? */
    }
    return success;
  }

  public ArrayList<ItemBean> getProductsByAttribute(String attr, String val) {
    PreparedStatement statement = null;
    ArrayList<ItemBean> products = new ArrayList<>();
    try {
      statement = getConnection().prepareStatement("SELECT * FROM PRODUCT WHERE " + attr + " LIKE \"%" + val + "%\"");
      statement.setString(1, val);
      ResultSet result = statement.executeQuery();
      while (result.next()) {
        ItemBean item = new ItemBean();
        item.setId(result.getInt("ProdNo"));
        item.setName(result.getString("ProdName"));
        products.add(item);
      }
      statement.close();
    } catch (Exception e) {
      /* Who cares? */
    }
    return products;
  }

  public ItemBean getProductByNo(String prodNo) {
    return getProductsByAttribute("PRODNO", prodNo).get(0);
  }
  
  public ArrayList<ItemBean> getProductByCategory(String category) {
    return getProductsByAttribute("CATNO", category);
  }
  
}