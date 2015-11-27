<%@page import="java.util.*, sos.bean.*"%>
<%@taglib uri="/WEB-INF/tlds/search-result" prefix="sos"%>
<% ArrayList<ItemBean> items = (ArrayList<ItemBean>) request.getAttribute("items"); %>
<% if (items.size() > 0) { %>

<div id="sort" class="ui menu">
  <span class="item">Sort by</span>
  <a class="icon item" data-sort="name-asc" data-content="Sort by name ascending" data-position="bottom center">
    <i class="sort alphabet ascending icon"></i>
  </a>
  <a class="icon item" data-sort="name-desc" data-content="Sort by name ascending" data-position="bottom center">
    <i class="sort alphabet descending icon"></i>
  </a>
  <a class="icon item" data-sort="cost-asc" data-content="Sort by cost ascending" data-position="bottom center">
    <i class="sort numeric ascending icon"></i>
  </a>
  <a class="icon item" data-sort="cost-desc" data-content="Sort by cost descending" data-position="bottom center">
    <i class="sort numeric descending icon"></i>
  </a>
</div>

<div id="results">
<% for (ItemBean item : items) { %>
  <sos:searchResult  item="<%=item%>"/>
<% } %>
</div>

<script>
$('[data-content]').popup({
  duration: 0
});
$('#sort [data-sort]').click(function () {
  var list = $('#results .list-item').get();
  var sort = this.getAttribute('data-sort').split('-');
  list.sort(function (a, b) {
    var va = sort[1] === 'asc' ? a.getAttribute('data-' + sort[0]) : b.getAttribute('data-' + sort[0]);
    var vb = sort[1] === 'asc' ? b.getAttribute('data-' + sort[0]) : a.getAttribute('data-' + sort[0]);
    if (sort[0] === 'name')
      return va.replace(/\W+/g, '').toLowerCase().localeCompare(vb.replace(/\W+/g, '').toLowerCase());
    else
      return +va > +vb;
  });
  for (var i = 0; i < list.length; i++)
    list[i].parentNode.appendChild(list[i]);
});
</script>

<% } else { %>

<div class="ui equal width center aligned padded grid">
  <div class="row">
    <div class="ui tiny horizontal statistic">
      <div class="label">No related result found</div>
    </div>
  </div>
</div>

<% } %>