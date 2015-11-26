<%@page import="java.util.*, sos.bean.*"%>
<br>
<div class="ui two column centered grid">
  <div class="column">
    <h4 class="ui horizontal divider header">
      <i class="gift icon"></i>
      Gift details
    </h4>
    <div class="ui segment">
      <a class="ui basic teal ribbon label" onclick="history.go(-1)">
        <i class="arrow left icon"></i>
        Back
      </a>
      <br><br>
      <% ItemBean item = (ItemBean) request.getAttribute("gift"); %>
      <div class="ui equal width center aligned padded grid">
        <div class="row">
          <h2 class="ui center aligned header"><%=item.getName()%></h2>
        </div>
        <div class="row">
          <%=item.getDesc()%>
        </div>
        <div class="row">
          <div class="ui big list">
            <div class="item">
              <i class="bitcoin icon"></i>
              <div class="content"><%=item.getPrice()%></div>
            </div>
          </div>
        </div>
        <div class="row">
          <% IUserBean user = (IUserBean) request.getSession().getAttribute("user"); %>
          <% if (user != null && user instanceof ClientBean) { %>
            <a id="add-cart" class="ui orange button">
              <i class="add to cart icon"></i>
              Redeem
            </a>
            <script>
            $('#add-cart').click(function () {
              $.post('item?action=redeem&no=<%=item.getNo()%>', function (status) {
                if (+status === 0) {
                  alert('Redemption completed successfully');
                  location.href = 'client?action=bonus';
                }else if (+status === 1) {
                  alert('No enough bonus point to redeem');
                }
              });
            });
            </script>
          <% } %>
        </div>
      </div>
    </div>
  </div>
</div>