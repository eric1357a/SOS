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
      <% ClientBean client = (ClientBean) request.getAttribute("client"); %>
      <!-- Confirm -->
      <div class="ui equal width center aligned padded grid">
        <div class="row">
          <div class="ui tiny horizontal statistic">
            <div class="label">Order confirmation</div>
          </div>
        </div>
      </div>
      <!--  Client list  -->
      <form action="item?action=checkout">
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
            <!-- Self pickup  -->
            <div class="row">
              <div class="ui slider checkbox">
                <input id="pickup" class="hidden" type="checkbox">
                <label>Self pick-up</label>
              </div>
            </div>
            <div class="row">
              <div id="delivery" class="ui segment">
                Item(s) will deliver to the following address:
                <br><br>
                <b><%=client.getAddress()%></b>
                <br>
                <a href="client?action=updateInfo">Edit</a>
              </div>
              <div id="selfpick" class="ui segment" style="display: none">
                Select date and time to pick-up:
                <br><br>
                <b>Date<b>&emsp;
                <div class="ui input"><input type="date"></div>
                <br><br>
                <b>Time<b>&emsp;
                <div class="ui input" style="width:78px"><input type="number" min="0" max="23" maxlength="2"></div>&#65306;
                <div class="ui input" style="width:78px"><input type="number" min="0" max="59" maxlength="2"></div>
              </div>
            </div>
            <div class="row">
              <button class="ui basic brown button" type="submit">Confirm order</a>
            </div>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>

<script>
<% if (cart.size() < 1) { %>
location.href = 'item?action=cart';
<% } %>
$('.ui.checkbox').checkbox({
  onChange: function () {
    $('#delivery, #selfpick').toggle();
  }
});
$('form').submit(function (e) {
  e.preventDefault();
  $.post(this.getAttribute('action'), {totalCost: <%=total%>, pickup: $('#pickup').is(':checked')}, function () {
    location.href = 'client?action=orderHistory';
  });
});
</script>