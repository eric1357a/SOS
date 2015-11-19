<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="menu" class="ui secondary pointing menu">
  <a class="item active" href="item?action=featured">SOS Home</a>
  <a id="toggle-search" class="item">Search</a>
  <div class="right menu">
    <a class="ui item" href="admin">Admin</a>
    <a class="ui item" href="client">Home</a>
    <a class="ui item" href="client?action=register">Register</a>
    <a class="ui item" href="client?action=signIn">Sign in</a>
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
$('#search-input .dropdown').dropdown({
  onChange: function(){
    $('#search-input input').trigger('keyup');
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
$('#search-input input').keyup(function () {
  var which = $('#search-input .dropdown .text').text();
  $.post('item?action=search&word=' + this.value + '&which=' + which, function(data) {
    $('#search-result').html(data);
  })
});
</script>