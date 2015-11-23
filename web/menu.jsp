<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String cp = request.getContextPath(); %>
<div id="menu" class="ui secondary pointing menu">
  <a class="item" href="<%=cp%>/">Stationaries</a>
  <a class="item" href="<%=cp%>/item?action=categories">Categories</a>
  <a class="item" href="<%=cp%>/gift">Gifts</a>
  <a id="toggle-search" class="item">Search</a>
  <div class="right menu">
    <% if (request.getAttribute("user") != null) { %>
      <a class="item" href="<%=cp%>/admin">Admin</a>
      <a class="item" href="<%=cp%>/client">Home</a>
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
  var which = $('#search-input .dropdown .text').text();
  $.post('<%=cp%>/item?action=search&word=' + this.value + '&which=' + which, function(data) {
    $('#search-result').html(data);
  })
});
</script>