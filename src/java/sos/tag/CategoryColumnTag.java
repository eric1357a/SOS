package sos.tag;

import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import sos.bean.*;

public class CategoryColumnTag extends SimpleTagSupport {
  
  private CategoryBean category;

  public CategoryBean getCategory() {
    return category;
  }

  public void setCategory(CategoryBean category) {
    this.category = category;
  }
  
  public void doTag() throws java.io.IOException {
    JspWriter out = getJspContext().getOut();
    out.print("<div class='column'>");
    out.print("  <a class='basic teal ui icon button' href='item?action=category&no=" + category.getNo() + "'>");
    out.print("    <span>" + category.getName() + "</span>");
    out.print("  </a>");
    out.print("</div>");
  }
  
}