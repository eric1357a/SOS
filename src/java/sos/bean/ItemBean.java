package sos.bean;

import java.io.Serializable;

public class ItemBean implements Serializable {
  
  private String name;
  
  public ItemBean () {}
  public ItemBean (String n) {
    name = n;
  }

  public String getName() { return name; }
  public void setName(String name) { this.name = name; }
  
}
