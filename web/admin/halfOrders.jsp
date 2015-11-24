<%@page import="java.util.*, sos.bean.*"%>
<%@taglib uri="/WEB-INF/tlds/incomplete-order" prefix="sos"%>
<br>
<div class="ui two column centered grid">
  <div class="column">
    <h4 class="ui horizontal divider header">
      <i class="warning sign icon"></i>
      Incomplete orders
    </h4>
    <div class="ui segment">
      <a class="ui basic violet ribbon label" onclick="history.go(-1)">
        <i class="arrow left icon"></i>
        Back
      </a>
      <br><br>
      <% ArrayList<OrderBean> halfOrders = (ArrayList<OrderBean>) request.getAttribute("halfOrders"); %>
      <!--  Incomplete orders report  -->
      <div class="ui equal width center aligned padded grid">
        <div class="row">
          <div class="ui tiny horizontal statistic">
            <div class="label">Total</div>
            <div class="label"></div>
            <div class="value"><%=halfOrders.size()%></div>
            <div class="label">Incomplete orders</div>
          </div>
        </div>
      </div>
      <% if (halfOrders.size() > 0) { %>
      <div class="ui segment">
        <div class="ui divided list">
          <% for (OrderBean order : halfOrders) { %>
            <sos:incompleteOrder order="<%=order%>"/>
          <% } %>
        </div>
      </div>
      <% } %>
    </div>
  </div>
</div>