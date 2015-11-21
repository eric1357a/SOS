<%@page import="sos.bean.*"%>
<% ItemBean item = (ItemBean) request.getAttribute("item"); %>
<br>
<div class="ui two column centered grid">
  <div class="column">
    <h4 class="ui horizontal divider header">
      <i class="remove icon"></i>
      Delete item #<%=item.getId()%>
    </h4>
    <div class="ui segment">
      <a class="ui basic violet ribbon label" onclick="history.go(-1)">
        <i class="arrow left icon"></i>
        Back
      </a>
      <br><br>
      <div class="ui negative message">
        <div class="header">Delete item</div>
        <p>
          Are you sure you want to delete the item "<%=item.getName()%>"?
          <br><br>
          <button class="ui green button">No</button>
          <button class="ui red button">Yes</button>
        </p>
      </div>
    </div>
  </div>
</div>