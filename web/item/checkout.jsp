<%@page import="java.util.*, java.util.Map.*, sos.bean.*"%>
<%@taglib uri="/WEB-INF/tlds/checkout-listitem" prefix="sos"%>
<br>
<div class="ui two column centered grid">
  <div class="column">
    <h4 class="ui horizontal divider header">
      <i class="shop icon"></i>
      Checkout
    </h4>
    <div class="ui segment">
      <a class="ui basic teal ribbon label" onclick="history.go(-1)">
        <i class="arrow left icon"></i>
        Back
      </a>
      <br><br>
      <% ArrayList<Entry<ItemBean, Integer>> cart = (ArrayList<Entry<ItemBean, Integer>>) request.getSession().getAttribute("cart"); %>
      <!--  Client list  -->
      <div class="ui middle aligned divided list">
        <% int total = 0; %>
        <% for (Entry<ItemBean, Integer> entry : cart) { %>
          <sos:checkoutListItem entry="<%=entry%>"/>
          <% total += entry.getKey().getPrice() * entry.getValue(); %>
        <% } %>
        <div class="ui divider"></div>
        <div class="ui equal width center aligned padded grid">
          <div class="row">
            <div class="ui tiny horizontal statistic">
              <div class="label">Total:</div>
              <div class="label"></div>
              <div class="value">$<%=total%></div>
            </div>
            <br>
          </div>
          <a class="ui basic brown button" href="item?action=checkout">Choose delivery method</a>
        </div>
      </div>
    </div>
  </div>
</div>

<script>
<% if (cart.size() < 1) { %>
location.href = 'item?action=cart';
<% } %>
</script>