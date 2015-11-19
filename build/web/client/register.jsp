<br>
<div class="ui two column centered grid">
  <div class="column">
    <h4 class="ui horizontal divider header">
      <i class="file text outline icon"></i>
      Register
    </h4>
    <div class="ui segment">
      <a class="ui basic teal ribbon label" onclick="history.go(-1)">
        <i class="arrow left icon"></i>
        Back
      </a>
      <br><br>
      <form class="ui form" action="client?action=register">
        <div class="field">
          <label>Item name</label>
          <input name="name" type="text">
        </div>
        <button class="ui button" type="submit">Submit</button>
      </form>
    </div>
  </div>
</div>

<script>
$('.ui.dropdown').dropdown();
$('form').submit(function (e) {
  e.preventDefault();
  $.post(this.getAttribute('action'), $(this).serialize(), function (data) {
    alert(data);
  })
});
</script>