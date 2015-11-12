package sos.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sos.db.SOSDB;

@WebServlet(name = "AjaxServlet", urlPatterns = {"/ajax"})
public class AjaxServlet extends HttpServlet {
  
  private SOSDB db;
  
  public void init() throws ServletException {
    String host = this.getServletContext().getInitParameter("host");
    String user = this.getServletContext().getInitParameter("user");
    String pass = this.getServletContext().getInitParameter("pass");
    db = new SOSDB(host, user, pass);
  }
  
  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    PrintWriter out = response.getWriter();
    String action = request.getParameter("action");
    response.setContentType("text/html");
    switch (action) {
      case "connect":
        // use for initialize server
        // try to create tables if not exists
        db.createTables();
        break;
      case "search":
        String keyword = request.getParameter("word");
        String which = request.getParameter("which");
        Pattern p = Pattern.compile("(Name|Price|Category)");
        Matcher m = p.matcher(which);
        if (null != keyword && m.find()) {
          String matched = m.group(1);
          request.getRequestDispatcher("/searchResult.jsp").forward(request, response);
        }
        break;
      default:
        break;
    }
  }
  
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    processRequest(request, response);
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    processRequest(request, response);
  }
  
}
