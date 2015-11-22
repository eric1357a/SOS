package sos.db;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import sos.bean.ItemBean;

public class ItemDB extends SOSDB {
  
  public ItemDB (String url, String username, String password) {
    super(url, username, password);
  }
  
  public boolean addItem (String name, String desc, String brand, String catId, float price) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {
            cnnct = getConnection();
            String preQueryStatement = "INSERT INTO PRODUCTS VALUES (?,?,?,?,?)";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, name);
            pStmnt.setFloat(2, price);
            pStmnt.setString(3, desc);
            pStmnt.setString(4, catId);
            pStmnt.setString(5, brand);
            int rowCount = pStmnt.executeUpdate();
            if (rowCount >= 1) {
                isSuccess = true;
            }
            pStmnt.close();
            cnnct.close();
            return true;
        } catch (SQLException ex) {
            while (ex != null) {
                ex.printStackTrace();
                ex = ex.getNextException();
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
            return false;
  }
    public boolean removeItem (int id) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        try {
            cnnct = getConnection();
            String preQueryStatement = "DELETE FROM PRODUCTS WHERE PRODNO=?";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setInt(1, id);
            pStmnt.executeUpdate();
            pStmnt.close();
            cnnct.close();
        } catch (SQLException ex) {
            while (ex != null) {
                ex.printStackTrace();
                ex = ex.getNextException();
                return false;
            }
            return false;
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return false;
  }
        public ItemBean queryProdByID(String id) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        ArrayList product = new ArrayList();
        ItemBean ib = new ItemBean();
        try {
            cnnct = getConnection();
            String preQueryStatement = "SELECT * FROM PRODUCT WHERE PRODNO=?";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, id);
            ResultSet rs = pStmnt.executeQuery();
            while (rs.next()) {
                ib.setName(rs.getString("ProdName"));
                ib.setId(rs.getInt("ProdNo"));
                product.add(ib);
            }
            pStmnt.close();
            cnnct.close();
        } catch (SQLException ex) {
            while (ex != null) {
                ex.printStackTrace();
                ex = ex.getNextException();
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return ib;
    }
        
        public ItemBean queryProdByCat(String id) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        ArrayList product = new ArrayList();
        ItemBean ib = new ItemBean();
        try {
            cnnct = getConnection();
            String preQueryStatement = "SELECT * FROM PRODUCT WHERE CATNO=?";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, id);
            ResultSet rs = pStmnt.executeQuery();
            while (rs.next()) {
                ib.setName(rs.getString("ProdName"));
                ib.setId(rs.getInt("ProdNo"));
                product.add(ib);
            }
            pStmnt.close();
            cnnct.close();
        } catch (SQLException ex) {
            while (ex != null) {
                ex.printStackTrace();
                ex = ex.getNextException();
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return ib;
    }
  /*TODO class: 
    
  */
}
