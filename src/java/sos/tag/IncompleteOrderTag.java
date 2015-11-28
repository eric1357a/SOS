package sos.tag;

import java.util.Calendar;
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
    Calendar cal = Calendar.getInstance();
    cal.setTime(order.getOrderDate());
    String date = cal.get(Calendar.YEAR) + "-" + (1 + cal.get(Calendar.MONTH)) + "-" + cal.get(Calendar.DATE);
    out.print("<div class='item'>");
    out.print("  <div class='content'>");
    out.print("    <div class='header'>Order #" + order.getNo() + " by Client #" + order.getClientId() + "</div>");
    out.print("    Status: " + order.getStatus() + "<br>");
    out.print("    Type: " + order.getType()+ "<br>");
    out.print("    Amount: $" + order.getAmount()+ "<br>");
    out.print("    Date: " + date+ "<br>");
    out.print("  </div>");
    out.print("</div>");
  }
  
}