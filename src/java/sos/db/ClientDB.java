package sos.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ClientDB extends SOSDB {
  
  public ClientDB (String url, String username, String password) {
    super(url, username, password);
  }
  public boolean isAdmin(String usern){
      ArrayList dname = new ArrayList();
      PreparedStatement pStmnt;
      try{
            Connection cnnct = DriverManager.getConnection(url, username, password);
            String preQueryStatement = "select * from USERINFO";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            ResultSet rs = pStmnt.executeQuery();
            for(int i=0;rs.next();i++) {
                dname.add(rs.getString("USERNAME"));
                if(usern.equals(dname.get(i))){
            return true;
        }
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClientDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
  /*TODO class: 
  
  */
}
