<br>
<div class="ui two column centered grid">
  <div class="column">
    <h4 class="ui horizontal divider header">
      <i class="file text outline icon"></i>
      Make down payment
    </h4>
    <div class="ui attached segment">
      <a class="ui basic teal ribbon label" onclick="history.go(-1)">
        <i class="arrow left icon"></i>
        Back
      </a>
      <br><br>
      <div class="ui warning message">
        $10,000 GBP will be charged from your credit card for registration fee.<br>
        We will reward you 10 bonus point for redeeming gifts.
      </div>
      <form class="ui form" action="client?action=register">
        <div class="field">
          <label>Credit card number</label>
          <input name="number" type="text" autocomplete="off" maxlength="16">
        </div>
        <div class="field">
          <label>Expiry date (YYMM)</label>
          <input name="date" type="text" autocomplete="off" maxlength="4">
        </div>
        <div class="field">
          <label>CVC</label>
          <input name="cvc" type="text" autocomplete="off" maxlength="3">
        </div>
        <button class="ui button" type="submit" name="act" value="cancel">Cancel</button>
        <button class="ui button" type="submit" name="act" value="submit">Submit</button>
      </form>
    </div>
    <!--  Register steps  -->
    <div class="ui bottom attached steps">
      <div class="disabled step">
        <i class="file text outline icon"></i>
        <div class="content">
          <div class="title">Step 1 of 2</div>
          <div class="detail">Fill information</div>
        </div>
      </div>
      <div class="step">
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
  if(!/\d/.test(String.fromCharCode(e.which))) e.preventDefault();
}).blur(function (e) {
  var dis = $(this);
  if(dis.val().length < +dis.attr('maxlength'))
    dis.parent().addClass('error');
  else if (dis.is('[name="date"]')) {
    var check = dis.val().match(/.{2}/g);
    var year = +/.{2}$/.exec((new Date).getFullYear());
    if (+check[0] < year || +check[0] > year + 10 || +check[1] < 1 || +check[1] > 12)
      dis.parent().addClass('error');
    else
      dis.parent().removeClass('error');
  } else
    dis.parent().removeClass('error');
});
$('form').submit(function (e) {
  e.preventDefault();
  var clicked = $(this).find('button[type="submit"]:focus').val().toLowerCase();
  if ($('.error input').length && clicked !== 'cancel') {
    alert('Some field contains invalid data.');
    return;
  }
  var data = $(this).serialize() + '&act=' + clicked;
  $.post(this.getAttribute('action'), data, function (target) {
    location.href = target;
  })
});
</script>