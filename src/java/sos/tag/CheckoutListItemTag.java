package sos.tag;

import java.util.Map.Entry;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import sos.bean.*;

public class CheckoutListItemTag extends SimpleTagSupport {
  
  private Entry<ItemBean, Integer> entry;

  public Entry<ItemBean, Integer> getEntry() {
    return entry;
  }

  public void setEntry(Entry<ItemBean, Integer> entry) {
    this.entry = entry;
  }
  
  public void doTag() throws java.io.IOException {
    JspWriter out = getJspContext().getOut();
    ItemBean item = entry.getKey();
    out.print("<div class='item'>");
    out.print("  <div class='right floated content'>");
    out.print("    <a class='ui red icon button' data-no='" + item.getNo()+ "'><i class='remove icon'></i></a>");
    out.print("  </div>");
    out.print("  <div class='content'>");
    out.print("    <div class='header'>#" + item.getNo()+ " &emsp; " + item.getName() + "</div>");
    out.print("    <div class='ui mini horizontal statistic'>");
    out.print("      <div class='label'>Price</div>");
    out.print("      <div class='label'></div>");
    out.print("      <div class='value'>$" + item.getPrice() + "</div>");
    out.print("    </div>");
    out.print("    <div class='ui mini horizontal statistic'>");
    out.print("      <div class='label'>Quantity</div>");
    out.print("      <div class='label'></div>");
    out.print("      <div class='value'>");
    out.print("        <div class='ui mini input'>");
    out.print("          <input type='text' value='" + entry.getValue() + "'>");
    out.print("        </div>");
    out.print("      </div>");
    out.print("    </div>");
    out.print("  </div>");
    out.print("</div>");
  }
  
}