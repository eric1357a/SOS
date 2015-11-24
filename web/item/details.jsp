<%@page import="java.util.*, sos.bean.*"%>
<br>
<div class="ui two column centered grid">
  <div class="column">
    <h4 class="ui horizontal divider header">
      <i class="info icon"></i>
      Item details
    </h4>
    <div class="ui segment">
      <a class="ui basic teal ribbon label" onclick="history.go(-1)">
        <i class="arrow left icon"></i>
        Back
      </a>
      <br><br>
      <% ItemBean item = (ItemBean) request.getAttribute("item"); %>
      <% CategoryBean category = (CategoryBean) request.getAttribute("category"); %>
      <div class="ui equal width center aligned padded grid">
        <div class="row">
          <div class="ui centered two stackable cards">
            <div class="card">
              <div class="image">
                <img src="<%=item.getPicture()%>">
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <h2 class="ui center aligned header"><%=item.getName()%></h2>
        </div>
        <div class="row">
          <%=item.getDesc()%>
        </div>
        <div class="row">
          <div class="ui big list">
            <div class="item">
              <i class="tag icon"></i>
              <div class="content"><%=item.getBrand()%></div>
            </div>
            <div class="item">
              <i class="dollar icon"></i>
              <div class="content"><%=item.getPrice()%></div>
            </div>
            <div class="item">
              <i class="book icon"></i>
              <div class="content"><%=category.getName()%></div>
            </div>
          </div>
        </div>
        <div class="row">
          <% IUserBean user = (IUserBean) request.getSession().getAttribute("user"); %>
          <% if (user != null && user instanceof ClientBean) { %>
            <a id="add-cart" class="ui orange button">
              <i class="add to cart icon"></i>
              Add to cart
            </a>
            <script>
            $('#add-cart').click(function () {
              $.post('item?action=cart&no=<%=item.getNo()%>', function () {
                location.href = 'item?action=cart';
              });
            });
            </script>
          <% } else { %>
            <a id="edit-item" class="ui violet button" href="item?action=edit&no=<%=item.getNo()%>">
              <i class="edit icon"></i>
              Edit details
            </a>
          <% } %>
        </div>
      </div>
    </div>
  </div>
</div>