package sos.bean;

import java.io.Serializable;

public class BonusRequestBean implements Serializable {
  
  private String id;
  private int amount, clientID;
  private long time;
  
  public BonusRequestBean() {
  }
  
  public BonusRequestBean(String id, int amount, long time, int clientID) {
    this.id = id;
    this.amount = amount;
    this.time = time;
    this.clientID = clientID;
  }

  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  public int getAmount() {
    return amount;
  }

  public void setAmount(int amount) {
    this.amount = amount;
  }

  public int getClientID() {
    return clientID;
  }

  public void setClientID(int clientID) {
    this.clientID = clientID;
  }

  public long getTime() {
    return time;
  }

  public void setTime(long time) {
    this.time = time;
  }

}
