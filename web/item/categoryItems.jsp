<%@page import="java.util.*, sos.bean.*"%>
<%@taglib uri="/WEB-INF/tlds/product-card" prefix="sos"%>
<br>
<div class="ui centered grid">
  <div class="twelve wide column">
    <h4 class="ui horizontal divider header">
      <i class="book icon"></i>
      Browse category
    </h4>
    <div class="ui segment">
      <a class="ui basic teal ribbon label" onclick="history.go(-1)">
        <i class="arrow left icon"></i>
        Back
      </a>
      <br><br>
      <% ArrayList<ItemBean> items = (ArrayList<ItemBean>) request.getAttribute("items"); %>
      <div class="ui equal width center aligned padded grid">
        <div class="row">
          <div class="ui tiny horizontal statistic">
            <div class="value"><%=items.size()%></div>
            <div class="label">item(s) found in this category</div>
          </div>
        </div>
      </div>
      <% for (int i = 0; i < items.size(); i++) { %>
        <% if (i % 5 == 0) { %>
          <div class="wall ui three column grid">
        <% } %>
          <sos:productCard item="<%=items.get(i)%>"/>
        <% if (i % 5 == 4) { %>
          </div>
        <% } %>
      <% } %>
    </div>
  </div>
</div>