<%@page import="java.util.*, sos.bean.*"%>
<%@taglib uri="/WEB-INF/tlds/pending-client" prefix="sos"%>
<br>
<div class="ui two column centered grid">
  <div class="column">
    <h4 class="ui horizontal divider header">
      <i class="users icon"></i>
      Verify new clients
    </h4>
    <div class="ui segment">
      <a class="ui basic violet ribbon label" onclick="history.go(-1)">
        <i class="arrow left icon"></i>
        Back
      </a>
      <br><br>
      <% ArrayList<ClientBean> clients = (ArrayList<ClientBean>) request.getAttribute("clients"); %>
      <div class="ui equal width center aligned padded grid">
        <div class="row">
          <div class="ui tiny horizontal statistic">
            <div class="value"><%=clients.size()%></div>
            <div class="label">client(s) to be verified</div>
          </div>
        </div>
      </div>
      <!--  Client list  -->
      <div class="ui middle aligned divided list">
        <% for (ClientBean client : clients) { %>
          <sos:pendingClient client="<%=client%>"/>
        <% } %>
      </div>
    </div>
  </div>
</div>

<script>
$('[data-content]').popup();
$('.list .button').click(function () {
  var dis = $(this);
  $.post('admin?action=verify&id=' + dis.data('id'), function () {
    location.href = 'admin?action=verify';
  });
});
</script>