<%@page import="java.util.*, sos.bean.*"%>
<br>
<div class="ui two column centered grid">
  <div class="column">
    <h4 class="ui horizontal divider header">
      <i class="remove icon"></i>
      Cancel order
    </h4>
    <div class="ui attached segment">
      <a class="ui basic teal ribbon label" onclick="history.go(-1)">
        <i class="arrow left icon"></i>
        Back
      </a>
      <br><br>
      <% OrderBean order = (OrderBean) request.getAttribute("order"); %>
      <div class="ui error message">
        You can cancel the order within 24 hours after ordered at least 24 hours before deliver date.
        In addition, $50 will be charged from your credit card for handling fee.
      </div>
      <form class="ui form" action="item?action=cancelOrder&no=<%=order.getNo()%>">
        <div class="ui equal width center aligned padded grid">
          <div class="row">
            <button class="center aligned red ui button" type="submit">Confirm cancel order</button>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>

<script>
$('form').submit(function (e) {
  e.preventDefault();
  $.post(this.getAttribute('action'), function (target) {
    location.href = 'client?action=orderHistory';
  });
});
</script>