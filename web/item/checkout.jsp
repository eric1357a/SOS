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
          <% for (int i = 0; i < cart.size(); i++) { %>
            <sos:checkoutListItem index="<%=(i + 1)%>" entry="<%=cart.get(i)%>"/>
            <% total += cart.get(i).getKey().getPrice() * cart.get(i).getValue(); %>
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
              <div class="ui segment">
                <div id="delivery">
                  Item(s) will deliver to the following address:
                  <br>
                  <b><%=client.getAddress()%></b> - <a href="client?action=updateInfo">Edit</a>
                  <br><br>
                  Select date and time for delivery:
                </div>
                <div id="selfpick" style="display: none">
                  <b>Self pick-up at Stationery Station main office</b>
                  <br><br>
                  Select date and time to pick-up:
                </div>
                <br><br>
                Date&emsp;
                <div class="ui input"><input id="timedat" type="date"></div>
                <br><br>
                Time&emsp;
                <div class="ui input" style="width:78px"><input id="timehrs" type="number" min="0" max="23" maxlength="2"></div>
                &#65306;
                <div class="ui input" style="width:78px"><input id="timemin" type="number" min="0" max="59" maxlength="2"></div>
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
  var date = $('#timedat').val() + ' ' + $('#timehrs').val() + ':' + $('#timemin').val();
  var chkDate = +new Date((date.replace(' ', 'T') + ':00').replace(/T(\d{1})\:/g, 'T0$1:').replace(/\:(\d{1})\:/g, ':0$1:'));
  if (isNaN(chkDate) || chkDate < +new Date) {
    alert('Invalid date input');
    return;
  }
  $.post(this.getAttribute('action'), {
    totalCost: <%=total%>,
    pickup: $('#pickup').is(':checked'),
    date: date
  }, function () {
    location.href = 'client?action=orderHistory';
  });
});
</script>