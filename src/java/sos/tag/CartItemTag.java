package sos.tag;

import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import sos.bean.ItemBean;

public class CartItemTag extends SimpleTagSupport {
  
  private ItemBean item;

  public ItemBean getItem() {
    return item;
  }

  public void setItem(ItemBean item) {
    this.item = item;
  }
  
  public void doTag() throws java.io.IOException {
    JspWriter out = getJspContext().getOut();
    out.print("<div class='event'>");
    out.print("  <div class='label'>");
    out.print("    <img src='" + item.getPicture() + "'>");
    out.print("  </div>");
    out.print("  <div class='content'>");
    out.print("    <div class='date'>" + item.getName() +"</div>");
    out.print("    <div class='summary'>111111111111111</div>");
    out.print("    <div class='meta'>");
    out.print("      <a href='item?action=details&no=" + item.getNo() + "'><i class='share icon'></i> View</a>");
    out.print("    </div>");
    out.print("  </div>");
    out.print("</div>");
  }
  
}