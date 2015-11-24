<%@page import="java.util.*, java.util.Map.*, sos.bean.*"%>
<%@taglib uri="/WEB-INF/tlds/cart-item" prefix="sos"%>
<br>
<div class="ui two column centered grid">
  <div class="column">
    <h4 class="ui horizontal divider header">
      <i class="cart icon"></i>
      Shopping cart
    </h4>
    <div class="ui segment">
      <a class="ui basic teal ribbon label" onclick="history.go(-1)">
        <i class="arrow left icon"></i>
        Back
      </a>
      <br><br>
      <% ArrayList<Entry<ItemBean, Integer>> cart = (ArrayList<Entry<ItemBean, Integer>>) request.getSession().getAttribute("cart"); %>
      <div class="ui equal width center aligned padded grid">
        <div class="row">
          <div class="ui tiny horizontal statistic">
            <div class="value"><%=cart.size()%></div>
            <div class="label">items in your cart</div>
          </div>
        </div>
      </div>
      <% if (cart.size() > 0) { %>
      <div class="ui segment">
        <div class="ui relaxed items">
          <div class="ui feed">
          <% for (Entry<ItemBean, Integer> entry : cart) { %>
          <sos:cartItem entry="<%=entry%>"/>
          <% } %>
          </div>
        </div>
        <button id="empty" class="ui basic red button">Empty</button>
        <a class="ui basic blue button" href="item?action=checkout">Checkout</a>
      </div>
      <% } %>
    </div>
  </div>
</div>

<script>
$('#empty').click(function () {
  $.post('item?action=emptyCart', function () {
    location.href = 'item?action=cart';
  });
});
</script>