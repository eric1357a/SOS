<br>
<div class="ui two column centered grid">
  <div class="column">
    <h4 class="ui horizontal divider header">
      <i class="home icon"></i>
      Home
    </h4>
    <div class="ui segment">
      <a class="ui basic teal ribbon label" onclick="history.go(-1)">
        <i class="arrow left icon"></i>
        Back
      </a>
      <br><br>
      <!--  Row 1  -->
      <div class="grid menu ui three column grid">
        <!--  Shopping cart  -->
        <div class="column">
          <a class="basic teal ui icon button" href="item?action=cart">
            <i class="cart icon"></i>
            <br>
            <span>Shopping cart</span>
          </a>
        </div>
        <!--  Update info  -->
        <div class="column">
          <a class="basic teal ui icon button" href="client?action=updateInfo">
            <i class="edit icon"></i>
            <br>
            <span>Update info</span>
          </a>
        </div>
        <!--  Order history  -->
        <div class="column">
          <a class="basic teal ui icon button" href="client?action=orderHistory">
            <i class="time icon"></i>
            <br>
            <span>Order history</span>
          </a>
        </div>
      </div>
      <!--  Row 2  -->
      <div class="grid menu ui three column grid">
        <!--  Bonus points  -->
        <div class="column">
          <a class="basic teal ui icon button" href="client?action=bonus">
            <i class="database icon"></i>
            <br>
            <span>Bonus Points</span>
          </a>
        </div>
      </div>
    </div>
  </div>
</div>