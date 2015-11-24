package sos.tag;

import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import sos.bean.OrderBean;

public class IncompleteOrderTag extends SimpleTagSupport {
  
  private OrderBean order;

  public OrderBean getOrder() {
    return order;
  }

  public void setOrder(OrderBean order) {
    this.order = order;
  }
  
  public void doTag() throws java.io.IOException {
    JspWriter out = getJspContext().getOut();
    out.print("<div class='item'>");
    out.print("  <div class='content'>");
    out.print("    <div class='header'>Order #" + order.getNo() + "</div>");
    out.print("    Status: " + order.getStatus() + "");
    out.print("  </div>");
    out.print("</div>");
  }
  
}