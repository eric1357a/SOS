<%@page isErrorPage="true" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>SOS</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="style/semantic.css">
    <link rel="stylesheet" href="style/app.css">
  </head>
  <body>
    <main>
      <div id="loading" class="ui active inverted dimmer" style="position: fixed">
        <div class="ui text loader">Loading</div>
      </div>
      <article id="content">
        <% if (response.getStatus() == 404) { %>
          <jsp:include page="/404.jsp"/>
        <% } %>
      </article>
    </main>
    <script src="js/jquery.js"></script>
    <script src="js/semantic.js"></script>
    <script src="js/app.js"></script>
  </body>
</html>
