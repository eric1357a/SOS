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

  private UserDB db;
  
  public void init() throws ServletException {
    String host = this.getServletContext().getInitParameter("host");
    String user = this.getServletContext().getInitParameter("user");
    String pass = this.getServletContext().getInitParameter("pass");
    db = new UserDB(host, user, pass);
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
    IUserBean user = (IUserBean) request.getSession().getAttribute("user");
    switch (String.valueOf(request.getParameter("action"))) {
      case "register":
        /* already registered */
        if (request.getSession().getAttribute("user") != null) {
          request.getRequestDispatcher("404.jsp").forward(request, response);
          break;
        }
        if (request.getSession().getAttribute("regInfo") != null)
          request.getRequestDispatcher("client/downPayment.jsp").forward(request, response);
        else
          request.getRequestDispatcher("client/register.jsp").forward(request, response);
        break;
      case "signIn":
        /* already signed in */
        if (request.getSession().getAttribute("user") != null) {
          request.getRequestDispatcher("404.jsp").forward(request, response);
          break;
        }
        request.getRequestDispatcher("client/signIn.jsp").forward(request, response);
        break;
      case "manageOrders":
        /* check is client */
        if (user == null || !(user instanceof ClientBean)) {
          request.getRequestDispatcher("404.jsp").forward(request, response);
          break;
        }
        request.getRequestDispatcher("client/manageOrders.jsp").forward(request, response);
        break;
      case "orderHistory":
        /* check is client */
        if (user == null || !(user instanceof ClientBean)) {
          request.getRequestDispatcher("404.jsp").forward(request, response);
          break;
        }
        request.getRequestDispatcher("client/orderHistory.jsp").forward(request, response);
        break;
      case "updateInfo":
        /* check is client */
        if (user == null || !(user instanceof ClientBean)) {
          request.getRequestDispatcher("404.jsp").forward(request, response);
          break;
        }
        request.setAttribute("user", user);
        request.getRequestDispatcher("client/updateInfo.jsp").forward(request, response);
        break;
      case "bonus":
        /* check is client */
        if (user == null || !(user instanceof ClientBean)) {
          request.getRequestDispatcher("404.jsp").forward(request, response);
          break;
        }
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
        if (null != request.getSession().getAttribute("regInfo")) {
          if ("submit".equals(request.getParameter("act"))) {
            String[] data = ((String) request.getSession().getAttribute("regInfo")).split("\\|");
            db.addClient(data[0], new Integer(data[1]), data[2]);
            out.print("\"" + request.getContextPath() + "\"");
            break;
          }
          else if ("cancel".equals(request.getParameter("act")))
            request.getSession().removeAttribute("regInfo");
        } else {
          String name = request.getParameter("forename") + " " + request.getParameter("surname");
          String phone = request.getParameter("phone");
          String address = request.getParameter("address");
          String regInfo = name + "|" + phone + "|" + address;
          request.getSession().setAttribute("regInfo", regInfo);
        }
        out.print("\"" + request.getContextPath() + "/client?action=register\"");
        break;
      case "signIn":
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        IUserBean user = db.login(username, password);
        //getServletContext().setAttribute("user", out);
        if (user != null)
          request.getSession().setAttribute("user", user);
        out.print(String.valueOf(user != null));
        break;
      case "updateInfo":
        /* check is client */
        String name = request.getParameter("forename") + " " + request.getParameter("surname");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        ClientBean client = (ClientBean) request.getSession().getAttribute("user");
        client.setName(name);
        client.setPhone(new Integer(phone));
        client.setAddress(address);
        db.update(client);
        out.print('1');
        break;
      case "signOut":
        request.getSession().removeAttribute("user");
        out.print('1');
        break;
      default:
        break;
    }
  }
  
}