package sos.db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Random;
import sos.bean.*;

public class ItemDB extends SOSDB {

  public ItemDB(String url, String username, String password) {
    super(url, username, password);
  }

  public boolean addItem(String name, String desc, String brand, String catId, float price, String picture) {
    PreparedStatement statement = null;
    boolean success = false;
    try {
      statement = getConnection().prepareStatement("INSERT INTO PRODUCTS (PRODNAME,PRICE,DESCRIPTION,CATNO,BRAND,PICTURE) VALUES (?,?,?,?,?,?)");
      statement.setString(1, name);
      statement.setFloat(2, price);
      statement.setString(3, desc);
      statement.setString(4, catId);
      statement.setString(5, brand);
      statement.setString(6, picture);
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
  
  private ItemBean itemFronResult (ResultSet result) throws Exception {
    ItemBean item = new ItemBean();
    item.setNo(result.getString("ProdNo"));
    item.setName(result.getString("ProdName"));
    item.setPrice(result.getDouble("Price"));
    item.setDesc(result.getString("Description"));
    item.setCatNo(result.getString("CatNo"));
    item.setBrand(result.getString("Brand"));
    item.setPicture(result.getString("Picture"));
    return item;
  }
  
  public ArrayList<ItemBean> getProductsByAttr(String attr, String op, String val) {
    return this.getProductsByAttr(attr, op, val, -1);
  }

  public ArrayList<ItemBean> getProductsByAttr(String attr, String op, String val, int limit) {
    PreparedStatement statement = null;
    ArrayList<ItemBean> products = new ArrayList<>();
    try {
      statement = getConnection().prepareStatement("SELECT * FROM PRODUCTS WHERE " + attr +" " + op + " " + val);
      if (limit > 0)
        statement.setMaxRows(limit);
      ResultSet result = statement.executeQuery();
      while (result.next())
        products.add(itemFronResult(result));
      statement.close();
    } catch (Exception e) {
      /* Who cares? */
    }
    return products;
  }

  public ItemBean getProductByNo(String prodNo) {
    ArrayList<ItemBean> result = getProductsByAttr("PRODNO", "=", prodNo);
    return result.size() == 1 ? result.get(0) : null;
  }
  
  public ArrayList<ItemBean> getProductsByName(String name) {
    return getProductsByAttr("PRODNAME", "LIKE", "'%" + name + "%'");
  }
  
  public ArrayList<ItemBean> getProductsByCategory(String category) {
    return getProductsByAttr("CATNO", "=", category);
  }
  
  public ArrayList<ItemBean> getTop10ProductsByCategory(String category) {
    return getProductsByAttr("CATNO", "=", category, 10);
  }
  
  public ArrayList<CategoryBean> getCategoriesByAttr(String attr, String op, String val) {
    PreparedStatement statement = null;
    ArrayList<CategoryBean> categories = new ArrayList<>();
    try {
      statement = getConnection().prepareStatement("SELECT * FROM CATEGORIES WHERE " + attr +" " + op + " " + val);
      ResultSet result = statement.executeQuery();
      while (result.next()) {
        CategoryBean category = new CategoryBean();
        category.setNo(result.getString("CatNo"));
        category.setName(result.getString("CatName"));
        categories.add(category);
      }
      statement.close();
    } catch (Exception e) {
      e.printStackTrace();
      /* Who cares? */
    }
    return categories;
  }
  
  public ArrayList<CategoryBean> getRandomFourCategories() {
    ArrayList<CategoryBean> categories = getCategoriesByAttr("CATNAME", "LIKE", "'%'");
    long seed = System.nanoTime();
    Collections.shuffle(categories, new Random(seed));
    ArrayList<CategoryBean> four = new ArrayList<>();
    for (int i = 0; i < 4; i++) four.add(categories.get(i));
    return four;
  }
  
  public ArrayList<CategoryBean> getAllCategories() {
    return getCategoriesByAttr("CATNAME", "LIKE", "'%'");
  }

  public CategoryBean getCategoryByNo(String no) {
    ArrayList<CategoryBean> result = getCategoriesByAttr("CATNO", "=", no);
    return result.size() == 1 ? result.get(0) : null;
  }
  
  public ArrayList<CategoryBean> getCategoriesByName(String name) {
    return getCategoriesByAttr("CATNAME", "LIKE", "'%" + name + "%'");
  }
  
  public boolean update(ItemBean item) {
    PreparedStatement statement = null;
    try {
      String preQueryStatement = "UPDATE PRODUCTS SET PRODNAME=?,PRICE=?,DESCRIPTION=?,CATNO=?,BRAND=?,PICTURE=? WHERE PRODNO = ?";
      statement = getConnection().prepareStatement(preQueryStatement);
      statement.setString(1, item.getName());
      statement.setDouble(2, item.getPrice());
      statement.setString(3, item.getDesc());
      statement.setString(4, item.getCatNo());
      statement.setString(5, item.getBrand());
      statement.setString(6, item.getPicture());
      statement.setString(7, item.getNo());
      statement.executeUpdate();
      statement.close();
      return true;
    } catch (Exception e) {
      /* Who cares? */
    }
    return false;
  }
  
}