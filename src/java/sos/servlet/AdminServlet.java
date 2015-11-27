package sos.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sos.bean.*;
import sos.db.*;

@WebServlet(name = "AdminServlet", urlPatterns = {"/admin"})
public class AdminServlet extends HttpServlet {

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
    /* check is admin */
    IUserBean user = (IUserBean) request.getSession().getAttribute("user");
    if (user == null || !(user instanceof AdminBean)) {
      request.getRequestDispatcher("404.jsp").forward(request, response);
      return;
    }
    int itemId;
    switch (String.valueOf(request.getParameter("action"))) {
      case "addItem":
        request.setAttribute("categories", itemDB.getAllCategories());
        request.getRequestDispatcher("admin/addItem.jsp").forward(request, response);
        break;
      case "manageOrders":
        request.setAttribute("orders", orderDB.getAllOrders());
        request.getRequestDispatcher("admin/manageOrders.jsp").forward(request, response);
        break;
      case "bonusRequests":
        request.setAttribute("requests", orderDB.getAllCreditRequests());
        request.getRequestDispatcher("admin/bonusRequests.jsp").forward(request, response);
        break;
      case "verify":
        request.setAttribute("clients", userDB.getClientsByAttr("Verified", "=", "false"));
        request.getRequestDispatcher("admin/verify.jsp").forward(request, response);
        break;
      case "halfOrders":
        request.setAttribute("halfOrders", orderDB.getOrdersByAttr("Status", "IN", "('process','cancel')"));
        request.getRequestDispatcher("admin/halfOrders.jsp").forward(request, response);
        break;
      case "null":
        request.getRequestDispatcher("admin/index.jsp").forward(request, response);
        break;
      case "deleteItem":
        //request.setAttribute("item", new ItemBean(request.getParameter("id"), "fuck"));
        request.getRequestDispatcher("admin/deleteItem.jsp").forward(request, response);
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
    IUserBean user = (IUserBean) request.getSession().getAttribute("user");
    if (user == null || !(user instanceof AdminBean))  return;
    PrintWriter out = response.getWriter();
    response.setContentType("text/html;charset=UTF-8");
    switch (String.valueOf(request.getParameter("action"))) {
      case "addItem":
        String name = request.getParameter("name");
        String desc = request.getParameter("desc");
        String brand = request.getParameter("brand");
        String catNo = request.getParameter("catNo");
        float price = 0;
        try {
          price = new Float(request.getParameter("price"));
        } catch (NumberFormatException e) {}
        String picture = request.getParameter("picture");
        int id = itemDB.addItem(name, desc, brand, catNo, price, picture);
        out.print(String.valueOf(id));
        break;
      case "verify":
        ClientBean client = userDB.getClientById(String.valueOf(request.getParameter("id")));
        if (null != client) {
          client.setVerified(true);
          userDB.update(client);
        }
        out.print("");
        break;
      case "approveBonus":
        BonusRequestBean req = orderDB.getCreditRequest(String.valueOf(request.getParameter("id")));
        if (null != req) {
          client = userDB.getClientById(String.valueOf(req.getClientID()));
          client.setBonus(client.getBonus() + req.getAmount());
          userDB.update(client);
          orderDB.removeCreditRequest(req.getId());
        }
        out.print("");
        break;
      default:
        break;
    }
  }
  
}