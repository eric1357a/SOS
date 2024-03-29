<br>
<div class="ui two column centered grid">
  <div class="column">
    <h4 class="ui horizontal divider header">
      <i class="settings icon"></i>
      Administration
    </h4>
    <div class="ui segment">
      <a class="ui basic violet ribbon label" onclick="history.go(-1)">
        <i class="arrow left icon"></i>
        Back
      </a>
      <br><br>
      <!--  Row 1  -->
      <div class="grid menu ui three column grid">
        <!--  Manage items  -->
        <div class="column">
          <a class="basic violet ui icon button" href="admin?action=addItem">
            <i class="add icon"></i>
            <br>
            <span>Add item</span>
          </a>
        </div>
        <!--  Manage orders  -->
        <div class="column">
          <a class="basic violet ui icon button" href="admin?action=manageOrders">
            <i class="list icon"></i>
            <br>
            <span>Manage orders</span>
          </a>
        </div>
        <!--  Verify clients  -->
        <div class="column">
          <a class="basic violet ui icon button" href="admin?action=verify">
            <i class="users icon"></i>
            <br>
            <span>Verify clients</span>
          </a>
        </div>
      </div>
      <!--  Row 2  -->
      <div class="grid menu ui three column grid">
        <!--  Incomplete order  -->
        <div class="column">
          <a class="basic violet ui icon button" href="admin?action=halfOrders">
            <i class="warning sign icon"></i>
            <br>
            <span>Incomplete orders</span>
          </a>
        </div>
        <!--  Credit request  -->
        <div class="column">
          <a class="basic violet ui icon button" href="admin?action=bonusRequests">
            <i class="database icon"></i>
            <br>
            <span>Bonus requests</span>
          </a>
        </div>
      </div>
    </div>
  </div>
</div>