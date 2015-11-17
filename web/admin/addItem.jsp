<div class="ui segment">
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
    <button class="ui button" type="submit">Submit</button>
  </form>
</div>

<script>
$('form').submit(function (e) {
  e.preventDefault();
  $.post(this.getAttribute('action'), $(this).serialize(), function (data) {
    alert(data);
  })
});
</script>