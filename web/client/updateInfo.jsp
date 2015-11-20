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
      <form class="ui form" action="client?action=updateInfo">
        <!--  Tab bar  -->
        <div id="tabBar" class="ui top attached tabular menu">
          <a class="active item" data-tab="personal-info">Personal information</a>
          <a class="item" data-tab="delivery-addr">Delivery address</a>
        </div>
        <!--  Maintain personal information tab  -->
        <div class="ui bottom attached active tab segment" data-tab="personal-info">
          fuck
        </div>
        <!--  Maintain delivery address tab  -->
        <div class="ui bottom attached tab segment" data-tab="delivery-addr">
          vault
        </div>
      </form>
    </div>
  </div>
</div>

<script>
$('#tabBar .item').tab();
$('form').submit(function (e) {
  e.preventDefault();
  $.post(this.getAttribute('action'), $(this).serialize(), function (data) {
    
  })
});
</script>