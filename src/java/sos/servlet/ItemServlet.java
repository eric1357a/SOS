package sos.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sos.bean.ItemBean;
import sos.db.SOSDB;

@WebServlet(name = "ItemServlet", urlPatterns = {"/item"})
public class ItemServlet extends HttpServlet {

  private SOSDB db;
  
  public void init() throws ServletException {
    String host = this.getServletContext().getInitParameter("host");
    String user = this.getServletContext().getInitParameter("user");
    String pass = this.getServletContext().getInitParameter("pass");
    db = new SOSDB(host, user, pass);
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
      case "details":
        out.println("<h1>ItemServlet " + request.getParameter("id") + "</h1>");
        String id = request.getParameter("id");
        // DB QueryByID request.setAttribute("id", id);
        break;
      case "null":
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
          ArrayList<ItemBean> items = new ArrayList<>();
          // get results from db..
          items.add(new ItemBean("12", keyword));
          request.setAttribute("items", items);
          request.getRequestDispatcher("item/searchResult.jsp").forward(request, response);
        } else
          request.getRequestDispatcher("item/noResult.jsp").forward(request, response);
        break;
      default:
        break;
    }
  }
  
}
