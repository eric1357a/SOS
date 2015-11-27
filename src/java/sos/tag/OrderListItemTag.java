package sos.tag;

import java.util.Calendar;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import sos.bean.*;

public class OrderListItemTag extends SimpleTagSupport {
  
  private OrderBean order;
  private Boolean admin;

  public OrderBean getOrder() {
    return order;
  }

  public void setOrder(OrderBean order) {
    this.order = order;
  }

  public Boolean getAdmin() {
    return admin;
  }

  public void setAdmin(Boolean admin) {
    this.admin = admin;
  }
  
  public void doTag() throws java.io.IOException {
    JspWriter out = getJspContext().getOut();
    Calendar cal = Calendar.getInstance();
    cal.setTime(order.getTime());
    String date = cal.get(Calendar.YEAR) + "-" + (1 + cal.get(Calendar.MONTH)) + "-" + cal.get(Calendar.DATE);
    out.print("<div class='event'>");
    out.print("  <div class='content'>");
    out.print("    <div class='date'>#" + order.getNo() + "&emsp;" + order.getType() + " order" + "</div>");
    out.print("    <div class='summary'>");
    out.print("      Status: " + order.getStatus() + "<br>");
    out.print("      Total: $" + order.getAmount() + "<br>");
    out.print("      Date: " + date);
    out.print("    </div>");
    if (admin) {
    out.print("    <div class='meta'>");
    out.print("      <a href='item?action=updateOrder&no=" + order.getNo() + "'><i class='edit icon'></i> Update order</a>");
    out.print("    </div>");
    } else if (!order.getStatus().equals("cancel")) {
    out.print("    <div class='meta'>");
    out.print("      <a href='item?action=cancelOrder&no=" + order.getNo() + "'><i class='remove icon'></i> Cancel order</a>");
    out.print("    </div>");
    }
    out.print("  </div>");
    out.print("</div>");
  }
  
}