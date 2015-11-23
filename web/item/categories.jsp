<%@page import="java.util.*, sos.bean.*"%>
<%@taglib uri="/WEB-INF/tlds/category-column" prefix="sos"%>
<br>
<div class="ui two column centered grid">
  <div class="column">
    <h4 class="ui horizontal divider header">
      <i class="home icon"></i>
      Browse categories
    </h4>
    <div class="ui segment">
      <a class="ui basic teal ribbon label" onclick="history.go(-1)">
        <i class="arrow left icon"></i>
        Back
      </a>
      <br><br>
      <%
        ArrayList<CategoryBean> categories = (ArrayList<CategoryBean>) request.getAttribute("categories");
        for (int i = 0; i < categories.size(); i++) {
      %>
        <% if (i % 4 == 0) { %>
          <div class="category grid ui four column grid">
        <% } %>
          <sos:categoryColumn category="<%=categories.get(i)%>"/>
        <% if (i % 4 == 3) { %>
          </div>
        <% } %>
      <% } %>
    </div>
  </div>
</div>