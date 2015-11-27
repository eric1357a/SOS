<%@page import="java.util.*, sos.bean.*"%>
<br>
<div class="ui two column centered grid">
  <div class="column">
    <h4 class="ui horizontal divider header">
      <i class="file text outline icon"></i>
      Update order
    </h4>
    <div class="ui segment">
      <a class="ui basic violet ribbon label" onclick="history.go(-1)">
        <i class="arrow left icon"></i>
        Back
      </a>
      <br><br>
      <% OrderBean order = (OrderBean) request.getAttribute("order"); %>
      <div class="ui equal width center aligned padded grid">
        <div class="row">
          <div class="ui tiny horizontal statistic">
            <div class="label">Select new order status for order #<%=order.getNo()%></div>
          </div>
        </div>
      </div>
      <form class="ui form" action="item?action=updateOrder&no=<%=order.getNo()%>">
        <div class="ui equal width center aligned padded grid">
          <div class="row">
            <select name="orderStatus" class="ui dropdown">
              <option value="process"<%=(order.getStatus().equals("process") ? " selected" : "")%>>Process</option>
              <option value="cancel"<%=(order.getStatus().equals("cancel") ? " selected" : "")%>>Cancel</option>
              <option value="delivered"<%=(order.getStatus().equals("delivered") ? " selected" : "")%>>Delivered</option>
              <option value="picked-up"<%=(order.getStatus().equals("picked-up") ? " selected" : "")%>>Picked-up</option>
            </select>
          </div>
          <div class="row">
            <button type="submit" class="ui violet button">Update</button>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>

<script>
$('.ui.dropdown').dropdown();
$('form').submit(function (e) {
  e.preventDefault();
  $.post(this.getAttribute('action'), $(this).serialize(), function (data) {
    location.href = "admin?action=manageOrders";
  })
});
</script>