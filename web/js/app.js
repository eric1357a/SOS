(function() {
  var $main = $('main');
  var $content = $('#content');
  var $loading = $('#loading');
  var cp = location.pathname.split('/').splice(0,2).join('/') + '/';
  
  // set random wallpaper
  var wallpaper = (Math.random() * 6 + 1) | 0;
  $('body').css({backgroundImage: 'url(images/wallpaper/' + wallpaper + '.jpg)'});
  
  // shared function to load page
  function load (url) {
    $loading.fadeIn(250);
    return $.get(url, function (data) {
      $content.html(data);
      $loading.fadeOut(250);
      updateActiveMenu();
      $(document).trigger('reset');
    });
  }
  
  function updateActiveMenu () {
    var current = location.pathname + location.search;
    var item = $('#menu .item[href="' + current + '"]');
    if (!item.length) {
      var item = $('#menu .item[href="' + location.pathname + '"]');
      if (!item.length) return;
    }
    $('#menu .item').removeClass('active');
    item.addClass('active');
  }
  
  // initialize webpage
  function getMenu () {
    return $.get('menu.jsp', function (data) {
      $main.prepend(data);
      $('#menu .item').click(updateActiveMenu);
    });
  }
  function getIndex () {
    var controller = location.pathname.split('/').slice(2).toString();
    var top = !controller.length ? 'item' : controller + location.search;
    load(cp + top);
  }
  function initialized () {
    // hide loading after everything loaded
    $loading.fadeOut();
    // attach event listener for all link click event
    $(document).on('click', 'a[href]', function (e) {
      e.preventDefault();
      var page = this.pathname.split('/').slice(2) + this.search;
      load(!page ? cp + 'item' : cp + page);
      history.pushState(null, "SOS", cp + page);
    });
    window.onpopstate = getIndex;
  }
  getMenu().then(getIndex).done(initialized);
})();