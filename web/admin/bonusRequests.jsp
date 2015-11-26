<%@page import="java.util.*, sos.bean.*"%>
<%@taglib uri="/WEB-INF/tlds/bonus-request" prefix="sos"%>
<br>
<div class="ui two column centered grid">
  <div class="column">
    <h4 class="ui horizontal divider header">
      <i class="users icon"></i>
      Approve bonus requests
    </h4>
    <div class="ui segment">
      <a class="ui basic violet ribbon label" onclick="history.go(-1)">
        <i class="arrow left icon"></i>
        Back
      </a>
      <br><br>
      <% ArrayList<BonusRequestBean> requests = (ArrayList<BonusRequestBean>) request.getAttribute("requests"); %>
      <div class="ui equal width center aligned padded grid">
        <div class="row">
          <div class="ui tiny horizontal statistic">
            <div class="value"><%=requests.size()%></div>
            <div class="label">request(s) to be approved</div>
          </div>
        </div>
      </div>
      <!--  Client list  -->
      <div class="ui middle aligned divided list">
        <% for (BonusRequestBean req : requests) { %>
          <sos:bonusRequest request="<%=req%>"/>
        <% } %>
      </div>
    </div>
  </div>
</div>

<script>
$('[data-content]').popup();
$('.list .button').click(function () {
  var dis = $(this);
  $.post('admin?action=approveBonus&id=' + dis.data('id'), function () {
    location.href = 'admin?action=bonusRequests';
  });
});
</script>