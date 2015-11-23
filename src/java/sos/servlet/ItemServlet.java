package sos.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sos.bean.CategoryBean;
import sos.bean.ItemBean;
import sos.db.*;

@WebServlet(name = "ItemServlet", urlPatterns = {"/item"})
public class ItemServlet extends HttpServlet {

  private ItemDB db;
  
  public void init() throws ServletException {
    String host = this.getServletContext().getInitParameter("host");
    String user = this.getServletContext().getInitParameter("user");
    String pass = this.getServletContext().getInitParameter("pass");
    db = new ItemDB(host, user, pass);
  }
  
  private void initializeCart(HttpServletRequest request) {
    if (request.getSession().getAttribute("cart") == null)
      request.getSession().setAttribute("cart", new ArrayList<>());
  }
  
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    // request is not ajax, forward to index to enforce ajax
    if (request.getHeader("X-Requested-With") == null) {
      request.getRequestDispatcher("index.jsp").forward(request, response);
      return;
    }
    PrintWriter out = response.getWriter();
    response.setContentType("text/html;charset=UTF-8");
    switch (String.valueOf(request.getParameter("action"))) {
      case "categories":
        request.setAttribute("categories", db.getAllCategories());
        request.getRequestDispatcher("item/categories.jsp").forward(request, response);
        break;
      case "category":
        String catNo = String.valueOf(request.getParameter("no"));
        if (null == db.getCategoryByNo(catNo))
          request.getRequestDispatcher("404.jsp").forward(request, response);
        else {
          request.setAttribute("items", db.getProductsByCategory(catNo));
          request.getRequestDispatcher("item/categoryItems.jsp").forward(request, response);
        }
        break;
      case "details":
        ItemBean item = db.getProductByNo(String.valueOf(request.getParameter("no")));
        if (null == item)
          request.getRequestDispatcher("404.jsp").forward(request, response);
        else {
          request.setAttribute("category", db.getCategoryByNo(item.getCatNo()));
          request.setAttribute("item", item);
          request.getRequestDispatcher("item/details.jsp").forward(request, response);
        }
        // DB QueryByID request.setAttribute("id", id);
        break;
      case "cart":
        initializeCart(request);
        request.getRequestDispatcher("item/cart.jsp").forward(request, response);
        break;
      case "null":
        LinkedHashMap<CategoryBean, ArrayList<ItemBean>> map = new LinkedHashMap<>();
        for (CategoryBean category : db.getRandomFourCategories())
          map.put(category, db.getTop10ProductsByCategory(category.getNo()));
        request.setAttribute("catSta", map);
        request.getRequestDispatcher("item/stationeries.jsp").forward(request, response);
        break;
      default:
        request.getRequestDispatcher("404.jsp").forward(request, response);
        break;
    }
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    // request is not ajax, forward to index to enforce ajax
    if (request.getHeader("X-Requested-With") == null) return;
    PrintWriter out = response.getWriter();
    response.setContentType("text/html;charset=UTF-8");
    switch (String.valueOf(request.getParameter("action"))) {
      case "search":
        String keyword = request.getParameter("word");
        String which = request.getParameter("which");
        Pattern p = Pattern.compile("(Item name|Item price|Item type|Gift points)");
        Matcher m = p.matcher(which);
        if (null != keyword && m.find()) {
          String matched = m.group(1);
          request.setAttribute("items", db.getProductsByName(keyword));
          request.getRequestDispatcher("item/searchResult.jsp").forward(request, response);
        } else
          request.getRequestDispatcher("item/noResult.jsp").forward(request, response);
        break;
      case "cart":
        ItemBean item = db.getProductByNo(String.valueOf(request.getParameter("no")));
        if (null != item) {
          initializeCart(request);
          ArrayList<ItemBean> cart = (ArrayList<ItemBean>) request.getSession().getAttribute("cart");
          cart.add(item);
          request.getSession().setAttribute("cart", cart);
        }
      default:
        break;
    }
  }
  
}
