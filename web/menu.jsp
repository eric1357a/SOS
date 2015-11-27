<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="sos.bean.*"%>
<% String cp = request.getContextPath(); %>
<div id="menu" class="ui secondary pointing menu">
  <div class="left menu">
    <a class="item" href="<%=cp%>/">Stationaries</a><br>
    <a class="item" href="<%=cp%>/item?action=categories">Categories</a><br>
    <a class="item" href="<%=cp%>/item?action=gifts">Gifts</a><br>
    <a id="toggle-search" class="item">Search</a><br>
  </div>
  <div class="right menu">
    <%
      IUserBean user = (IUserBean) request.getSession().getAttribute("user");
      if (user != null) {
        if (user instanceof AdminBean) {
    %>
        <a class="item" href="<%=cp%>/admin">Admin</a>
      <% } else { %>
        <a class="item" href="<%=cp%>/client">Home</a>
      <% } %>
      <a class="item" id="sign-out">Sign out</a>
    <% } else { %>
      <a class="item" href="<%=cp%>/client?action=register">Register</a>
      <a class="item" href="<%=cp%>/client?action=signIn">Sign in</a>
    <% } %>
  </div>
</div>

<div class="ui category search">
  <div id="search" class="ui results transition invisible">
    <!-- search input -->
    <div id="search-input">
      <div class="ui fluid right labeled input">
        <input placeholder="Enter keyword or number expression" type="text">
        <div class="ui dropdown label">
          <div class="text">Item name</div>
          <i class="dropdown icon"></i>
          <div class="menu">
            <div class="item">Item name</div>
            <div class="item">Item price</div>
            <div class="item">Item type</div>
            <div class="item">Gift points</div>
          </div>
        </div>
      </div>
    </div>
    <!-- search result set -->
    <div id="search-result"></div>
  </div>
</div>

<script>
var searchInput = $('#search-input input');
$('#search-input .dropdown').dropdown({
  onChange: function(){
    if (searchInput.val().length > 0)
      searchInput.trigger('keyup');
  }
});
$(document).on('click reset', function (e) {
  var target = $(e.target);
  if (!target.closest('#search').length && $('#search').hasClass('visible'))
    $('#search').toggleClass('visible invisible');
  else if (target.is('#toggle-search')) {
    var rect = target.get(0).getBoundingClientRect();
    $('#search').toggleClass('visible invisible').css({
      left: rect.left,
      top: rect.height
    });
  }
})
searchInput.keyup(function () {
  if (this.value.length > 0) {
    var which = $('#search-input .dropdown .text').text();
    $.post('<%=cp%>/item?action=search&word=' + this.value + '&which=' + which, function(data) {
      $('#search-result').html(data);
    });
  }
  else $('#search-result').empty();
});
$('#sign-out').click(function () {
  $.post('<%=cp%>/client?action=signOut', function(data) {
    location.href = '<%=cp%>';
  });
});
</script>