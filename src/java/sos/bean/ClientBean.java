package sos.bean;

import java.io.Serializable;

public class ClientBean implements Serializable, IUserBean {

  private String password, name, address;
  private int id, phone, bonus;
  private boolean verified;

  public ClientBean() {
  }

  public ClientBean(int id, String password, String name, int phone, String address, boolean verified, int bonus) {
    this.id = id;
    this.password = password;
    this.name = name;
    this.phone = phone;
    this.address = address;
    this.verified = verified;
    this.bonus = bonus;
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getAddress() {
    return address;
  }

  public void setAddress(String address) {
    this.address = address;
  }

  public int getPhone() {
    return phone;
  }

  public void setPhone(int phone) {
    this.phone = phone;
  }

  public int getBonus() {
    return bonus;
  }

  public void setBonus(int bonus) {
    this.bonus = bonus;
  }

  public boolean isVerified() {
    return verified;
  }

  public void setVerified(boolean verified) {
    this.verified = verified;
  }

}
