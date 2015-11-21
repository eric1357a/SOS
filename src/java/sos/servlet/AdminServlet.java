package sos.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sos.bean.ItemBean;
import sos.db.*;

@WebServlet(name = "AdminServlet", urlPatterns = {"/admin"})
public class AdminServlet extends HttpServlet {

  private ItemDB db;
  
  public void init() throws ServletException {
    String host = this.getServletContext().getInitParameter("host");
    String user = this.getServletContext().getInitParameter("user");
    String pass = this.getServletContext().getInitParameter("pass");
    db = new ItemDB(host, user, pass);
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
    System.out.println("===============");
    System.out.println(String.valueOf(request.getParameter("action")));
    int itemId;
    switch (String.valueOf(request.getParameter("action"))) {
      case "manageItems":
        request.getRequestDispatcher("admin/manageItems.jsp").forward(request, response);
        break;
      case "manageOrders":
        request.getRequestDispatcher("admin/manageOrders.jsp").forward(request, response);
        break;
      case "verify":
        request.getRequestDispatcher("admin/verify.jsp").forward(request, response);
        break;
      case "halfOrders":
        request.getRequestDispatcher("admin/halfOrders.jsp").forward(request, response);
        break;
      case "null":
        request.getRequestDispatcher("admin/index.jsp").forward(request, response);
        break;
      case "editItem":
        itemId = new Integer(request.getParameter("id"));
        request.setAttribute("item", new ItemBean(itemId, "fuck"));
        request.getRequestDispatcher("admin/editItem.jsp").forward(request, response);
        break;
      case "deleteItem":
        itemId = new Integer(request.getParameter("id"));
        request.setAttribute("item", new ItemBean(itemId, "fuck"));
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
    PrintWriter out = response.getWriter();
    response.setContentType("text/html;charset=UTF-8");
    switch (String.valueOf(request.getParameter("action"))) {
      case "addItem":
        String name = request.getParameter("name");
        String desc = request.getParameter("desc");
        String brand = request.getParameter("brand");
        String catId = request.getParameter("catId");
        float price = 0;
        try {
          price = new Float(request.getParameter("price"));
        } catch (NumberFormatException e) {}
        out.print("server returns: " + name+" "+desc+" "+price);
        db.addItem(name, desc, brand, catId, price);
        break;
      default:
        break;
    }
  }
  
}