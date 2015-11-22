package sos.tag;

import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class CartItemTag extends SimpleTagSupport {
  
  private int id;
  private String title;
  
  public int getId () { return id; }
  public void setId (int i) { id = i; }
  public String getTitle () { return title; }
  public void setTitle (String t) { title = t; }
  
  public void doTag() throws java.io.IOException {
    JspWriter out = getJspContext().getOut();
    out.print("<div class='event'>");
    out.print("  <div class='label'>");
    out.print("    <img src='http://localhost:8080/SOS/images/stationery/pens/101/10103.jpg'>");
    out.print("  </div>");
    out.print("  <div class='content'>");
    out.print("    <div class='date'>" + title +"</div>");
    out.print("    <div class='summary'>111111111111111</div>");
    out.print("    <div class='meta'>");
    out.print("      <a href='gift'><i class='share icon'></i> View</a>");
    out.print("    </div>");
    out.print("  </div>");
    out.print("</div>");
  }
  
}