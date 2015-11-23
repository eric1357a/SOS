<%@page import="java.util.*, sos.bean.*"%>
<%@taglib uri="/WEB-INF/tlds/product-card" prefix="sos"%>
<br>
<div class="ui centered grid">
  <div class="twelve wide column">
    <h4 class="ui horizontal divider header">
      <i class="home icon"></i>
      Pick for you
    </h4>
    <div class="ui segment">
      <% LinkedHashMap<CategoryBean, ArrayList<ItemBean>> map = (LinkedHashMap<CategoryBean, ArrayList<ItemBean>>) request.getAttribute("catSta"); %>
      <% for (CategoryBean category : map.keySet()) { %>
        <h3 class="ui dividing header"><%=category.getName()%></h3>
        <% if (map.get(category).size() < 1) { %>
          <h4 class="ui center aligned header">
            No item found in this category
          </h4>
        <% } else { %>
          <div class="wall ui three column grid">
          <% for (ItemBean item : map.get(category)) { %>
            <sos:productCard item="<%=item%>"/>
          <% } %>
          </div>
        <% } %>
      <% } %>
    </div>
  </div>
</div>
<br>