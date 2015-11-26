package sos.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.AbstractMap.SimpleEntry;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Map.Entry;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sos.bean.*;
import sos.db.*;

@WebServlet(name = "ItemServlet", urlPatterns = {"/item"})
public class ItemServlet extends HttpServlet {

  private ItemDB itemDB;
  private UserDB userDB;
  private OrderDB orderDB;
  
  public void init() throws ServletException {
    String host = this.getServletContext().getInitParameter("host");
    String user = this.getServletContext().getInitParameter("user");
    String pass = this.getServletContext().getInitParameter("pass");
    itemDB = new ItemDB(host, user, pass);
    userDB = new UserDB(host, user, pass);
    orderDB = new OrderDB(host, user, pass);
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
    ArrayList<Entry<ItemBean, Integer>> cart = (ArrayList<Entry<ItemBean, Integer>>) request.getSession().getAttribute("cart");
    IUserBean user = (IUserBean) request.getSession().getAttribute("user");
    ItemBean item;
    OrderBean order;
    switch (String.valueOf(request.getParameter("action"))) {
      case "categories":
        request.setAttribute("categories", itemDB.getAllCategories());
        request.getRequestDispatcher("item/categories.jsp").forward(request, response);
        break;
      case "category":
        String catNo = String.valueOf(request.getParameter("no"));
        if (null == itemDB.getCategoryByNo(catNo))
          request.getRequestDispatcher("404.jsp").forward(request, response);
        else {
          request.setAttribute("items", itemDB.getProductsByCategory(catNo));
          request.getRequestDispatcher("item/categoryItems.jsp").forward(request, response);
        }
        break;
      case "gifts":
        request.setAttribute("gifts", itemDB.getAllGifts());
        request.getRequestDispatcher("item/gifts.jsp").forward(request, response);
        break;
      case "gift":
        item = itemDB.getGiftByNo(String.valueOf(request.getParameter("no")));
        if (null == item)
          request.getRequestDispatcher("404.jsp").forward(request, response);
        else {
          request.setAttribute("gift", item);
          request.getRequestDispatcher("item/viewGift.jsp").forward(request, response);
        }
        break;
      case "details":
        item = itemDB.getProductByNo(String.valueOf(request.getParameter("no")));
        if (null == item)
          request.getRequestDispatcher("404.jsp").forward(request, response);
        else {
          request.setAttribute("category", itemDB.getCategoryByNo(item.getCatNo()));
          request.setAttribute("item", item);
          request.getRequestDispatcher("item/details.jsp").forward(request, response);
        }
        break;
      case "cart":
        if (user != null && user instanceof ClientBean) {
          if (cart == null) request.getSession().setAttribute("cart", new ArrayList<>());
          request.getRequestDispatcher("item/cart.jsp").forward(request, response);
        }
        else request.getRequestDispatcher("404.jsp").forward(request, response);
        break;
      case "checkout":
        if (user != null && user instanceof ClientBean) {
          request.setAttribute("client", (ClientBean) user);
          request.getRequestDispatcher("item/checkout.jsp").forward(request, response);
        }
        else request.getRequestDispatcher("404.jsp").forward(request, response);
        break;
      case "updateOrder":
        if (user != null && user instanceof AdminBean) {
          order = orderDB.getOrder(String.valueOf(request.getParameter("no")));
          if (null != order) {
            request.setAttribute("order", order);
            request.getRequestDispatcher("item/updateOrder.jsp").forward(request, response);
            break;
          }
        }
        request.getRequestDispatcher("404.jsp").forward(request, response);
        break;
      case "cancelOrder":
        if (user != null && user instanceof ClientBean) {
          order = orderDB.getOrder(String.valueOf(request.getParameter("no")));
          if (null != order) {
            request.setAttribute("order", order);
            request.getRequestDispatcher("item/cancelOrder.jsp").forward(request, response);
            break;
          }
        }
        request.getRequestDispatcher("404.jsp").forward(request, response);
        break;
      case "edit":
        if (user != null && user instanceof AdminBean) {
          item = itemDB.getProductByNo(String.valueOf(request.getParameter("no")));
          if (null == item)
            request.getRequestDispatcher("404.jsp").forward(request, response);
          else {
            request.setAttribute("item", item);
            request.setAttribute("categories", itemDB.getAllCategories());
            request.getRequestDispatcher("item/edit.jsp").forward(request, response);
          }
        }
        else request.getRequestDispatcher("404.jsp").forward(request, response);
        break;
      case "null":
        LinkedHashMap<CategoryBean, ArrayList<ItemBean>> map = new LinkedHashMap<>();
        boolean fa1se = true;
        ArrayList<CategoryBean> categories;
        while (fa1se) {
          map.clear();
          categories = itemDB.getRandomFourCategories();
          for (int i = 0; i < categories.size(); i++) {
            ArrayList<ItemBean> items = itemDB.getTop10ProductsByCategory(categories.get(i).getNo());
            // filter out empty categories
            if (items.size() < 1) break;
            else {
              map.put(categories.get(i), items);
              fa1se = i != categories.size() - 1;
            }
          }
        }
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
    IUserBean user = (IUserBean) request.getSession().getAttribute("user");
    ArrayList<Entry<ItemBean, Integer>> cart = (ArrayList<Entry<ItemBean, Integer>>) request.getSession().getAttribute("cart");
    switch (String.valueOf(request.getParameter("action"))) {
      case "search":
        String keyword = request.getParameter("word");
        String which = request.getParameter("which");
        Pattern p = Pattern.compile("(Item name|Item price|Item type|Gift points)");
        Matcher m = p.matcher(which);
        if (null != keyword && m.find()) {
          String matched = m.group(1);
          request.setAttribute("items", itemDB.getProductsByName(keyword));
          request.getRequestDispatcher("item/searchResult.jsp").forward(request, response);
        } else
          request.getRequestDispatcher("item/noResult.jsp").forward(request, response);
        break;
      case "cart":
        if (user != null && user instanceof ClientBean) {
          ItemBean item = itemDB.getProductByNo(String.valueOf(request.getParameter("no")));
          if (null != item) {
            boolean found = false;
            if (cart == null) cart = new ArrayList<>();
            for (Entry<ItemBean, Integer> entry : cart)
              if (entry.getKey().getNo().equals(item.getNo())) {
                found = true;
                entry.setValue(entry.getValue() + 1);
              }
            if (!found) cart.add(new SimpleEntry<>(item, 1));
            request.getSession().setAttribute("cart", cart);
          }
        }
        break;
      case "edit":
        if (user != null && user instanceof AdminBean) {
          ItemBean item = itemDB.getProductByNo(String.valueOf(request.getParameter("no")));
          if (null != item) {
            item.setName(request.getParameter("name"));
            item.setDesc(request.getParameter("desc"));
            item.setBrand(request.getParameter("brand"));
            item.setPrice(Double.parseDouble(request.getParameter("price")));
            String catNo = String.valueOf(request.getParameter("catNo"));
            if (itemDB.getCategoryByNo(catNo) != null)
              item.setCatNo(catNo);
            item.setPicture(request.getParameter("pic"));
            itemDB.update(item);
          }
        }
        break;
      case "updateCart":
        java.util.Map<String, String[]> map = request.getParameterMap();
        for (java.util.Map.Entry<String, String[]> field : map.entrySet()) {
          if (!field.getKey().startsWith("qty")) continue;
          for (Entry<ItemBean, Integer> entry : cart)
            if (entry.getKey().getNo().equals(field.getKey().split("qty")[1]))
              entry.setValue(new Integer(field.getValue()[0]));
        }
        request.getSession().setAttribute("cart", cart);
        break;
      case "emptyCart":
        String no = request.getParameter("no");
        if (no != null) {
          for (Entry<ItemBean, Integer> entry : cart)
            if (entry.getKey().getNo().equals(no))
              cart.remove(entry);
          request.getSession().setAttribute("cart", cart);
        } else {
          request.getSession().setAttribute("cart", new ArrayList<>());
        }
        break;
      case "redeem":
        ItemBean item = itemDB.getGiftByNo(String.valueOf(request.getParameter("no")));
        if (null == item) out.print("-1");
        else if (user != null && user instanceof ClientBean) {
          ClientBean client = (ClientBean) user;
          if (client.getBonus() >= item.getPrice()) {
            client.setBonus((int) (client.getBonus() - item.getPrice()));
            userDB.update(client);
            out.print("0");
          }
          else out.print("1");
        }
        else out.print("-1");
        break;
      case "checkout":
        int total = new Integer(request.getParameter("totalCost"));
        boolean pickup = "true".equals(request.getParameter("pickup"));
        int clientId = ((ClientBean) user).getId();
        /* create order, credit request */
        int ordId = orderDB.addOrder(total, new Date(), pickup ? "Self pick-up" : "Delivery", "process", clientId);
        int credit = (total / 1000) * 100;
        if (credit > 0)
          orderDB.addCreditRequest(clientId, credit, System.currentTimeMillis());
        /* insert products orders */
        for (Entry<ItemBean, Integer> entry : cart)
          orderDB.addProductOrder(entry.getValue(), entry.getKey().getNo(), ordId);
        /* empty shopping cart */
        request.getSession().setAttribute("cart", new ArrayList<>());
        break;
      default:
        break;
    }
  }
  
}
