package sos.tag;

import java.util.Map.Entry;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import sos.bean.*;

public class CartItemTag extends SimpleTagSupport {
  
  private Entry<ItemBean, Integer> entry;

  public Entry<ItemBean, Integer> getEntry() {
    return entry;
  }

  public void setEntry(Entry<ItemBean, Integer> entry) {
    this.entry = entry;
  }
  
  public void doTag() throws java.io.IOException {
    JspWriter out = getJspContext().getOut();
    out.print("<div class='event'>");
    out.print("  <div class='label'>");
    out.print("    <img src='" + entry.getKey().getPicture() + "'>");
    out.print("  </div>");
    out.print("  <div class='content'>");
    out.print("    <div class='date'>" + entry.getKey().getName() +"</div>");
    out.print("    <div class='summary'>");
    out.print("      Quantity: <div class='ui small input'><input type='text' name='qty" + entry.getKey().getNo() + "' value='" + entry.getValue() + "'></div>");
    out.print("    </div>");
    out.print("    <div class='meta'>");
    out.print("      <a href='item?action=details&no=" + entry.getKey().getNo() + "'><i class='share icon'></i> View</a>");
    out.print("      <a data-rmno='" + entry.getKey().getNo() + "'><i class='remove icon'></i> Delete</a>");
    out.print("    </div>");
    out.print("  </div>");
    out.print("</div>");
  }
  
}