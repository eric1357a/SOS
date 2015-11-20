<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, sos.bean.*"%>
<%@taglib uri="/WEB-INF/tlds/search-result" prefix="sos"%>
<div>
<% for (ItemBean item : (ArrayList<ItemBean>) request.getAttribute("items")) { %>
  <sos:searchResult id="1" title="<%=item.getName()%>" desc="fuck"/>
<% } %>
</div>