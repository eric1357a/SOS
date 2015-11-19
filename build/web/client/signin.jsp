<br>
<div class="ui two column centered grid">
  <div class="column">
    <h4 class="ui horizontal divider header">
      <i class="sign in icon"></i>
      Sign in
    </h4>
    <div class="ui segment">
      <a class="ui basic teal ribbon label" onclick="history.go(-1)">
        <i class="arrow left icon"></i>
        Back
      </a>
      <br><br>
      <form class="ui form" action="client?action=signIn">
        <div class="field">
          <label>Username</label>
          <input name="username" type="text">
        </div>
        <div class="field">
          <label>Password</label>
          <input name="password" type="password">
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
    if (JSON.parse(data)
      location.href = "<%=request.getContextPath()%>";
    else
      alert("Incorrect username or password");
  })
});
</script>