<br>
<div class="ui two column centered grid">
  <div class="column">
    <h4 class="ui horizontal divider header">
      <i class="file text outline icon"></i>
      Register
    </h4>
    <div class="ui attached segment">
      <a class="ui basic teal ribbon label" onclick="history.go(-1)">
        <i class="arrow left icon"></i>
        Back
      </a>
      <br><br>
      <form class="ui form" action="client?action=register">
        <div class="field">
          <label>Forename</label>
          <input name="forename" type="text" autocomplete="off">
        </div>
        <div class="field">
          <label>Surname</label>
          <input name="surname" type="text" autocomplete="off">
        </div>
        <div class="field">
          <label>Phone number</label>
          <input name="phone" type="text" autocomplete="off" maxlength="8">
        </div>
        <div class="field">
          <label>Address</label>
          <input name="address" type="text" autocomplete="off">
        </div>
        <button class="ui button" type="submit">Submit</button>
      </form>
    </div>
    <!--  Register steps  -->
    <div class="ui bottom attached steps">
      <div class="step">
        <i class="file text outline icon"></i>
        <div class="content">
          <div class="title">Step 1 of 2</div>
          <div class="detail">Fill information</div>
        </div>
      </div>
      <div class="disabled step">
        <i class="dollar icon"></i>
        <div class="content">
          <div class="title">Step 2 of 2</div>
          <div class="detail">Make a down payment</div>
        </div>
      </div>
    </div>
  </div>
</div>

<script>
$('.ui.dropdown').dropdown();
$('input').keypress(function (e) {
  var index = $(this).parent().index();
  if (index === 2 && !/\d/.test(String.fromCharCode(e.which)))
    e.preventDefault();
}).blur(function (e) {
  var dis = $(this);
  var index = $(this).parent().index();
  if(dis.val().length < 2 || index === 2 && $(this).val().length !== 8)
    dis.parent().addClass('error');
  else
    dis.parent().removeClass('error');
});
$('form').submit(function (e) {
  e.preventDefault();
  $.post(this.getAttribute('action'), $(this).serialize(), function (target) {
    location.href = target;
  })
});
</script>