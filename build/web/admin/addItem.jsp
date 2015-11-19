<br>
<div class="ui two column centered grid">
  <div class="column">
    <h4 class="ui horizontal divider header">
      <i class="add square icon"></i>
      Add item
    </h4>
    <div class="ui segment">
      <a class="ui basic violet ribbon label" onclick="history.go(-1)">
        <i class="arrow left icon"></i>
        Back
      </a>
      <br><br>
      <form class="ui form" action="admin?action=addItem">
        <div class="field">
          <label>Item name</label>
          <input name="name" type="text">
        </div>
        <div class="field">
          <label>Item description</label>
          <input name="desc" type="text">
        </div>
        <div class="field">
          <label>Item price</label>
          <div class="ui labeled input">
            <div class="ui label">$</div>
            <input name="price" type="text">
          </div>
        </div>
        <div class="field">
          <label>Item brand</label>
          <select class="ui dropdown">
            <option value="1">AP</option>
            <option value="0">Fuck</option>
          </select>
        </div>
        <div class="field">
          <label>Item category</label>
          <select class="ui dropdown">
            <option value="1">Penis</option>
            <option value="0">Manko</option>
          </select>
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