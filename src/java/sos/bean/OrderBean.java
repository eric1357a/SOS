package sos.bean;

import java.io.Serializable;
import java.util.Date;

public class OrderBean implements Serializable {

  private String no, type, status;
  private double amount;
  private Date orderDate, delivDate;
  private int clientId;

  public OrderBean() {
  }

  public OrderBean(String no,  double amount, Date orderDate, Date delivDate, String type, String status, int clientId) {
    this.no = no;
    this.amount = amount;
    this.orderDate = orderDate;
    this.delivDate = delivDate;
    this.type = type;
    this.status = status;
    this.clientId = clientId;
  }

  public String getNo() {
    return no;
  }

  public void setNo(String no) {
    this.no = no;
  }
  
  public String getType() {
    return type;
  }

  public void setType(String type) {
    this.type = type;
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
  
  public Date getOrderDate() {
    return orderDate;
  }

  public void setOrderDate(Date orderDate) {
    this.orderDate = orderDate;
  }

  public Date getDelivDate() {
    return delivDate;
  }

  public void setDelivDate(Date delivDate) {
    this.delivDate = delivDate;
  }

  public int getClientId() {
    return clientId;
  }

  public void setClientId(int clientId) {
    this.clientId = clientId;
  }

}