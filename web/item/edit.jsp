<%@page import="java.util.*, sos.bean.*"%>
<br>
<div class="ui two column centered grid">
  <div class="column">
    <h4 class="ui horizontal divider header">
      <i class="edit icon"></i>
      Edit details
    </h4>
    <div class="ui segment">
      <a class="ui basic violet ribbon label" onclick="history.go(-1)">
        <i class="arrow left icon"></i>
        Back
      </a>
      <br><br>
      <% ItemBean item = (ItemBean) request.getAttribute("item"); %>
      <form class="ui form" action="item?action=edit&no=<%=item.getNo()%>">
        <div class="ui equal width center aligned padded grid">
          <div class="row">
            <div class="ui middle list">
              <div class="item" data-content="Name">
                <i class="large write middle aligned icon"></i>
                <div class="content">
                  <div class="ui input">
                    <input type="text" name="name" value="<%=item.getName()%>">
                  </div>
                </div>
              </div>
              <div class="item" data-content="Description">
                <i class="large align text left middle aligned icon"></i>
                <div class="content">
                  <div class="ui form">
                    <div class="field">
                      <textarea rows="2" name="desc" style="resize:none"><%=item.getDesc()%></textarea>
                    </div>
                  </div>
                </div>
              </div>
              <div class="item" data-content="Brand">
                <i class="large tag middle aligned icon"></i>
                <div class="content">
                  <div class="ui input">
                    <input type="text" name="brand" value="<%=item.getBrand()%>">
                  </div>
                </div>
              </div>
              <div class="item" data-content="Price">
                <i class="large dollar middle aligned icon"></i>
                <div class="content">
                  <div class="ui input">
                    <input type="text" name="price" value="<%=item.getPrice()%>">
                  </div>
                </div>
              </div>
              <div class="item" data-content="Category">
                <i class="large book middle aligned icon"></i>
                <div class="content">
                  <% ArrayList<CategoryBean> categories = (ArrayList<CategoryBean>) request.getAttribute("categories"); %>
                  <select name="catNo" class="ui dropdown">
                    <% for (CategoryBean category : categories) { %>
                    <option value="<%=category.getNo()%>"<%=category.getNo().equals(item.getCatNo()) ? " selected" : ""%>><%=category.getName()%></option>
                    <% } %>
                  </select>
                </div>
              </div>
              <div class="item" data-content="Picture">
                <i class="large photo middle aligned icon"></i>
                <div class="content">
                  <div class="ui input">
                    <input type="text" name="pic" value="<%=item.getPicture()%>">
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <button id="edit-item" class="ui violet button" type="submit">
              <i class="save icon"></i>
              Update details
            </button>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>

<script>
$('[data-content]').popup();
$('.ui.dropdown').dropdown();
$('form').submit(function (e) {
  e.preventDefault();
  $.post(this.getAttribute('action'), $(this).serialize(), function () {
    location.href = 'item?action=details&no=<%=item.getNo()%>';
  })
});
</script>