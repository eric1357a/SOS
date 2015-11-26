package sos.tag;

import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import sos.bean.*;

public class ProductCardTag extends SimpleTagSupport {
  
  private ItemBean item;

  public ItemBean getItem() {
    return item;
  }

  public void setItem(ItemBean item) {
    this.item = item;
  }
  
  public void doTag() throws java.io.IOException {
    JspWriter out = getJspContext().getOut();
    boolean isGift = null == item.getCatNo();
    String href = isGift ? "gift" : "details";
    out.print("<a class='product card column' href='item?action=" + href + "&no=" + item.getNo() + "'>");
    out.print("  <div class='ui fluid card'>");
    if (!isGift) {
    out.print("    <div class='image'>");
    out.print("      <img src='" + item.getPicture() + "'>");
    out.print("    </div>");
    }
    out.print("    <div class='content'>");
    out.print("      <h4 class='ui header'>" + item.getName() + "</h4>");
    out.print("      <div class='meta'>");
    out.print("        " + item.getDesc()+ "<br>");
    out.print("      </div>");
    out.print("      <table class='description'>");
    out.print("        <tr>");
    out.print("          <th><i class='" + (isGift ? "bitcoin" : "dollar") + " icon'></i></th>");
    out.print("          <td>" + item.getPrice() + "</td>");
    out.print("        </tr>");
    if (!isGift) {
    out.print("        <tr>");
    out.print("          <th><i class='tag icon'></i></th>");
    out.print("          <td>" + item.getBrand() + "</td>");
    out.print("        </tr>");
    }
    out.print("      </table>");
    out.print("    </div>");
    out.print("  </div>");
    out.print("</a>");
  }
  
}