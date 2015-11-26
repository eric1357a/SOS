<br>
<div class="ui two column centered grid">
  <div class="column">
    <h4 class="ui horizontal divider header">
      <i class="database icon"></i>
      Bonus Points
    </h4>
    <div class="ui segment">
      <a class="ui basic teal ribbon label" onclick="history.go(-1)">
        <i class="arrow left icon"></i>
        Back
      </a>
      <br><br>
      <div class="ui equal width center aligned padded grid">
        <div class="row">
          <div id="bonus" class="ui circular rotate left reveal image">
            <div class="visible content">
              <div class="ui circular segment">
                <h4 class="ui header">My Points</h4>
              </div>
            </div>
            <div class="hidden content">
              <div class="ui circular segment">
                <div class="ui massive star rating"></div>
                <br>
                <b><%=request.getAttribute("bonus")%> points</b>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <a class="ui pink button" href="gift">
            <i class="add to cart icon"></i>
            Shop gift now
          </a>
        </div>
      </div>
    </div>
  </div>
</div>

<script>
$('.ui.star.rating').rating({
  initialRating: 1,
  maxRating: 1,
  interactive: false
});
</script>