<%@page import="java.util.*, sos.bean.*"%>
<%@taglib uri="/WEB-INF/tlds/product-card" prefix="sos"%>
<br>
<div class="ui centered grid">
  <div class="twelve wide column">
    <h4 class="ui horizontal divider header">
      <i class="gift icon"></i>
      Browse gifts
    </h4>
    <div class="ui segment">
      <a class="ui basic teal ribbon label" onclick="history.go(-1)">
        <i class="arrow left icon"></i>
        Back
      </a>
      <br><br>
      <% ArrayList<ItemBean> gifts = (ArrayList<ItemBean>) request.getAttribute("gifts"); %>
      <div class="ui equal width center aligned padded grid">
        <div class="row">
          <div class="ui tiny horizontal statistic">
            <div class="value"><%=gifts.size()%></div>
            <div class="label">gift(s) available</div>
          </div>
        </div>
      </div>
      <% for (int i = 0; i < gifts.size(); i++) { %>
        <% if (i % 5 == 0) { %>
          <div class="wall ui three column grid">
        <% } %>
          <sos:productCard item="<%=gifts.get(i)%>"/>
        <% if (i % 5 == 4) { %>
          </div>
        <% } %>
      <% } %>
    </div>
  </div>
</div>