package sos.bean;

import java.io.Serializable;

public class ItemBean implements Serializable {
  
  private String no, name, desc, catNo, brand, picture;
  private double price;

  public ItemBean() {
  }

  public ItemBean(String no, String name, double price, String desc, String catNo, String brand, String picture) {
    this.no = no;
    this.name = name;
    this.price = price;
    this.desc = desc;
    this.catNo = catNo;
    this.brand = brand;
    this.picture = picture;
  }
  
  public String getNo() {
    return no;
  }

  public void setNo(String no) {
    this.no = no;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getDesc() {
    return desc;
  }

  public void setDesc(String desc) {
    this.desc = desc;
  }

  public String getCatNo() {
    return catNo;
  }

  public void setCatNo(String catNo) {
    this.catNo = catNo;
  }

  public String getBrand() {
    return brand;
  }

  public void setBrand(String brand) {
    this.brand = brand;
  }

  public String getPicture() {
    return picture;
  }

  public void setPicture(String picture) {
    this.picture = picture;
  }

  public double getPrice() {
    return price;
  }

  public void setPrice(double price) {
    this.price = price;
  }

}
