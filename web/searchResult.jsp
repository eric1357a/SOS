<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  String resultId = "result" + System.currentTimeMillis();
%>
<div id="<%=resultId%>">
  <div class="category">
    <div class="name">Pen</div>
    <a class="result">
      <div class="content">
        <div class="title">Vault pen</div>
        <div class="description">Healthy Population</div>
      </div>
    </a>
  </div>
  <div class="category">
    <div class="name">Fucks</div>
    <a class="result">
      <div class="content">
        <div class="title">aaaaaa</div>
      </div>
    </a>
  </div>
</div>
<script>
$('#<%=resultId%> .category .result').click(function(){
  alert('sd');
})
</script>