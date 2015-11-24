package sos.bean;

import java.io.Serializable;
import java.util.Date;

public class OrderBean implements Serializable {

  private String no, status;
  private double amount;
  private Date time;
  private int clientId;

  public OrderBean() {
  }

  public OrderBean(String no,  double amount, Date time, String status, int clientId) {
    this.no = no;
    this.amount = amount;
    this.time = time;
    this.status = status;
    this.clientId = clientId;
  }

  public String getNo() {
    return no;
  }

  public void setNo(String no) {
    this.no = no;
  }

  public String getStatus() {
    return status;
  }

  public void setStatus(String status) {
    this.status = status;
  }

  public double getAmount() {
    return amount;
  }

  public void setAmount(double amount) {
    this.amount = amount;
  }

  public Date getTime() {
    return time;
  }

  public void setTime(Date time) {
    this.time = time;
  }

  public int getClientId() {
    return clientId;
  }

  public void setClientId(int clientId) {
    this.clientId = clientId;
  }

}