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

@WebServlet(name = "ClientServlet", urlPatterns = {"/client"})
public class ClientServlet extends HttpServlet {

  private ClientDB db;
  
  public void init() throws ServletException {
    String host = this.getServletContext().getInitParameter("host");
    String user = this.getServletContext().getInitParameter("user");
    String pass = this.getServletContext().getInitParameter("pass");
    db = new ClientDB(host, user, pass);
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
      case "register":
        request.getRequestDispatcher("client/register.jsp").forward(request, response);
        break;
      case "signIn":
        request.getRequestDispatcher("client/signIn.jsp").forward(request, response);
        break;
      case "cart":
        request.getRequestDispatcher("client/cart.jsp").forward(request, response);
        break;
      case "manageOrders":
        request.getRequestDispatcher("client/manageOrders.jsp").forward(request, response);
        break;
      case "updateInfo":
        request.getRequestDispatcher("client/updateInfo.jsp").forward(request, response);
        break;
      case "bonus":
        request.getRequestDispatcher("client/bonus.jsp").forward(request, response);
        break;
      case "null":
        boolean signedIn = true;
        if (signedIn)
          request.getRequestDispatcher("client/index.jsp").forward(request, response);
        else
          request.getRequestDispatcher("404.jsp").forward(request, response);
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
    response.setContentType("application/json;charset=UTF-8");
    switch (String.valueOf(request.getParameter("action"))) {
      case "register":
        String name = request.getParameter("name");
        //db.addItem(name, desc, brand, catId, price);
        break;
      case "signIn":
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        IUserBean user = db.login(username, password);
        out.print(String.valueOf(user != null));
        break;
      default:
        break;
    }
  }
  
}