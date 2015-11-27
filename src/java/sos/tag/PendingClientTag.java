package sos.tag;

import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import sos.bean.*;

public class PendingClientTag extends SimpleTagSupport {
  
  private ClientBean client;

  public ClientBean getClient() {
    return client;
  }

  public void setClient(ClientBean client) {
    this.client = client;
  }
  
  public void doTag() throws java.io.IOException {
    JspWriter out = getJspContext().getOut();
    out.print("<div class='item'>");
    out.print("  <div class='right floated content'>");
    out.print("    <a data-content='Send ID and Password' class='ui green icon button' data-id='" + client.getId() + "'><i class='checkmark icon'></i></a>");
    out.print("  </div>");
    out.print("  <div class='content'>");
    out.print("    <div class='header'>#" + client.getId() + " &emsp; " + client.getName() + "</div>");
    out.print("    <i class='home icon'></i>" + client.getAddress());
    out.print("    <br>");
    out.print("    <i class='call icon'></i>" + client.getPhone());
    out.print("    <br>");
    out.print("    <i class='database icon'></i>" + client.getBonus());
    out.print("  </div>");
    out.print("</div>");
  }
  
}