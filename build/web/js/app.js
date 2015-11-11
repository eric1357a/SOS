(function() {
  var $main = $('main');
  var $content = $('#content');
  var $loading = $('#loading');
  
  // set random wallpaper
  var wallpaper = (Math.random() * 6 + 1) | 0;
  $('body').css({backgroundImage: "url(images/wallpaper/" + wallpaper + ".jpg)"});
  
  // initialize webpage
  function getMenu () {
    return $.get("menu.jsp", function (e) {
      $main.prepend(e);
    });
  }
  function getFeatured () {
    return $.get("stationeries.jsp", function (e) {
      $content.html(e);
    });
  }
  function initialized () {
    // hide loading after everything loaded
    $loading.fadeOut();
  }
  $.get("ajax?action=connect").then(getMenu).then(getFeatured).done(initialized);
})();