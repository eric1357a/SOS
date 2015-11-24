<%@page import="java.util.*, sos.bean.*"%>
<br>
<div class="ui two column centered grid">
  <div class="column">
    <h4 class="ui horizontal divider header">
      <i class="edit icon"></i>
      Update information
    </h4>
    <div class="ui segment">
      <a class="ui basic teal ribbon label" onclick="history.go(-1)">
        <i class="arrow left icon"></i>
        Back
      </a>
      <br><br>
      <% ClientBean client = (ClientBean) request.getAttribute("user"); %>
      <form class="ui form" action="client?action=updateInfo">
        <!--  Tab bar  -->
        <div id="tabBar" class="ui top attached tabular menu">
          <a class="active item" data-tab="personal-info">Personal information</a>
          <a class="item" data-tab="delivery-addr">Delivery address</a>
        </div>
        <!--  Maintain personal information tab  -->
        <div class="ui bottom attached active tab segment" data-tab="personal-info">
          <div class="field">
            <label>Forename</label>
            <input name="forename" type="text" autocomplete="off" value="<%=client.getName().split(" ")[0]%>">
          </div>
          <div class="field">
            <label>Surname</label>
            <input name="surname" type="text" autocomplete="off" value="<%=client.getName().split(" ")[1]%>">
          </div>
          <div class="field">
            <label>Phone number</label>
            <input name="phone" type="text" autocomplete="off" value="<%=client.getPhone()%>" maxlength="8">
          </div>
          <button class="ui button" type="submit">Submit</button>
        </div>
        <!--  Maintain delivery address tab  -->
        <div class="ui bottom attached tab segment" data-tab="delivery-addr">
          <div class="field">
            <label>Address</label>
            <input name="address" type="text" autocomplete="off" value="<%=client.getAddress()%>">
          </div>
          <button class="ui button" type="submit">Submit</button> 
        </div>
      </form>
    </div>
  </div>
</div>

<script>
$('#tabBar .item').tab();
$('form').submit(function (e) {
  e.preventDefault();
  $.post(this.getAttribute('action'), $(this).serialize(), function () {
    location.href = 'client';
  });
});
</script>