package sos.tag;

import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import sos.bean.ItemBean;

public class SearchResultTag extends SimpleTagSupport {
  
  private ItemBean item;

  public ItemBean getItem() {
    return item;
  }

  public void setItem(ItemBean item) {
    this.item = item;
  }
  
  public void doTag() throws java.io.IOException {
    JspWriter out = getJspContext().getOut();
    boolean isGift = item.getCatNo() == null;
    out.print("<div class='list-item' data-name='" + item.getName() + "' data-cost='" + item.getPrice() + "'>");
    out.print("<div class='name'><img alt src='" + item.getPicture() + "'></div>");
    out.print("<a class='result' href='item?action=" + (isGift ? "gift" : "details") + "&no=" + item.getNo() + "'>");
    out.print("  <div class='content'>");
    out.print("    <div class='title'>" + item.getName() + "</div>");
    out.print("    <div class='description'>" + item.getDesc() + "<br>Price: $" + item.getPrice() + "</div>");
    out.print("  </div>");
    out.print("</a>");
    out.print("</div>");
  }
  
}