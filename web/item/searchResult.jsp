<%@page import="java.util.*, sos.bean.*"%>
<%@taglib uri="/WEB-INF/tlds/search-result" prefix="sos"%>
<% ArrayList<ItemBean> items = (ArrayList<ItemBean>) request.getAttribute("items"); %>
<% if (items.size() > 0) { %>

<div id="sort" class="ui menu">
  <a class="bug popup icon item" data-content="Edit This Page" href="https://github.com/Semantic-Org/Semantic-UI-Docs/edit/master/server/documents/elements/icon.html.eco">
    <i class="edit icon"></i>
  </a>

  <a class="bug popup icon item" data-content="Submit Bug Report" href="https://github.com/Semantic-Org/Semantic-UI/issues/new?title=[Icon] - Your Bug Name&amp;body=**Steps to Reproduce**%0A1. Do something%0A2. Do something else.%0A3. Do one last thing.%0A%0A**Expected**%0AThe Icon should do this%0A%0A**Result**%0AThe Icon does not do this%0A%0A**Testcase**%0A(fork this to get started)%0Ahttp://jsfiddle.net/rduvhn8u/1/">
    <i class="bug icon"></i>
  </a>

  <a class="github popup icon item" data-content="View project on GitHub" href="https://github.com/Semantic-Org/Semantic-UI">
    <i class="alternate github icon"></i>
  </a>
</div>

<% for (ItemBean item : items) { %>
  <sos:searchResult  item="<%=item%>"/>
<% } %>

<script>
  
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