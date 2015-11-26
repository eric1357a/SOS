<%@page import="java.util.*, sos.bean.*"%>
<%@taglib uri="/WEB-INF/tlds/order-listitem" prefix="sos"%>
<br>
<div class="ui two column centered grid">
  <div class="column">
    <h4 class="ui horizontal divider header">
      <i class="list icon"></i>
      Manage orders
    </h4>
    <div class="ui segment">
      <a class="ui basic violet ribbon label" onclick="history.go(-1)">
        <i class="arrow left icon"></i>
        Back
      </a>
      <br><br>
      <div class="ui equal width center aligned padded grid">
        <div class="row">
          <div class="ui tiny horizontal statistic">
            <div class="label">Last</div>
            <div class="label"></div>
            <div class="value">10</div>
            <div class="label">order history</div>
          </div>
        </div>
      </div>
      <% ArrayList<OrderBean> orders = (ArrayList<OrderBean>) request.getAttribute("orders"); %>
      <div class="ui segment">
        <% if (orders.isEmpty()) { %>
        No order records found
        <% } else { %>
        <div class="ui relaxed items">
          <div class="ui feed">
            <% for (int i = 0; i < orders.size(); i++) { %>
              <%=(i > 0 ? "<div class='ui divider'></div>" : "")%>
              <sos:orderListItem order="<%=orders.get(i)%>" admin="true"/>
            <% } %>
          </div>
        </div>
        <% } %>
      </div>
    </div>
  </div>
</div>