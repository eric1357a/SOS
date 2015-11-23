package sos.tag;

import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class SearchResultTag extends SimpleTagSupport {
  
  private int id;
  private String title, desc;
  
  public int getId () { return id; }
  public void setId (int i) { id = i; }
  public String getTitle () { return title; }
  public void setTitle (String t) { title = t; }
  public String getDesc () { return desc; }
  public void setDesc (String d) { desc = d; }
  
  public void doTag() throws java.io.IOException {
    JspWriter out = getJspContext().getOut();
    out.print("<a class='result' href='item?action=details&no=10101'>");
    out.print("  <div class='content'>");
    out.print("    <div class='title'>" + title + "</div>");
    out.print("    <div class='description'>" + desc + "</div>");
    out.print("  </div>");
    out.print("</a>");
  }
  
}