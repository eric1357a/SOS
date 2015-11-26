package sos.tag;

import java.util.Calendar;
import java.util.Date;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import sos.bean.*;

public class BonusRequestTag extends SimpleTagSupport {
  
  private BonusRequestBean request;

  public BonusRequestBean getRequest() {
    return request;
  }

  public void setRequest(BonusRequestBean request) {
    this.request = request;
  }
  
  public void doTag() throws java.io.IOException {
    JspWriter out = getJspContext().getOut();
    Calendar cal = Calendar.getInstance();
    cal.setTime(new Date(request.getTime()));
    String date = cal.get(Calendar.YEAR) + "-" + (1 + cal.get(Calendar.MONTH)) + "-" + cal.get(Calendar.DATE);
    out.print("<div class='item'>");
    out.print("  <div class='right floated content'>");
    out.print("    <a data-content='Approve bonus request' class='ui green icon button' data-id='" + request.getId() + "'><i class='checkmark icon'></i></a>");
    out.print("  </div>");
    out.print("  <div class='content'>");
    out.print("    <div class='header'>Request #" + request.getId() + "</div>");
    out.print("    <i class='user icon'></i> User: " + request.getClientID());
    out.print("    <br>");
    out.print("    <i class='time icon'></i> Date: " + date);
    out.print("    <br>");
    out.print("    <i class='database icon'></i> Bonus: " + request.getAmount());
    out.print("  </div>");
    out.print("</div>");
  }
  
}