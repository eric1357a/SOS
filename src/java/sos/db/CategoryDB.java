package sos.db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import sos.bean.*;

public class CategoryDB extends SOSDB {

  public CategoryDB(String url, String username, String password) {
    super(url, username, password);
  }
  
  public ArrayList<CategoryBean> getCategoriesByAttr(String attr, String val) {
    PreparedStatement statement = null;
    ArrayList<CategoryBean> categories = new ArrayList<>();
    try {
      statement = getConnection().prepareStatement("SELECT * FROM CATEGORIES WHERE " + attr +" LIKE \"%" + val + "%\"");
      statement.setString(1, val);
      ResultSet result = statement.executeQuery();
      while (result.next()) {
        CategoryBean item = new CategoryBean();
        item.setNo(result.getString("CatNo"));
        item.setName(result.getString("CatName"));
        categories.add(item);
      }
      statement.close();
    } catch (Exception e) {
      /* Who cares? */
    }
    return categories;
  }
  
  public ArrayList<CategoryBean> getAllCategories() {
    return getCategoriesByAttr("CATNO", "");
  }

  public CategoryBean getCategoryByNo(String no) {
    return getCategoriesByAttr("CATNO", no).get(0);
  }
  
  public ArrayList<CategoryBean> getCategoriesByName(String name) {
    return getCategoriesByAttr("CATNAME", name);
  }

}