(function() {
  var $main = $('main');
  var $content = $('#content');
  var $loading = $('#loading');
  
  // set random wallpaper
  var wallpaper = (Math.random() * 6 + 1) | 0;
  $('body').css({backgroundImage: 'url(images/wallpaper/' + wallpaper + '.jpg)'});
  
  // shared function to load page
  function load (url) {
    $loading.fadeIn(250);
    return $.get(url, function (data) {
      $content.html(data);
      $loading.fadeOut(250);
      $(document).trigger('reset');
    });
  }
  
  // initialize webpage
  function getMenu () {
    return $.get('menu.jsp', function (data) {
      $main.prepend(data);
    });
  }
  function getIndex () {
    var controller = location.pathname.split('/').slice(2).toString();
    var top = !controller.length ? 'item?action=featured' : controller + location.search;
    load(top);
  }
  function initialized () {
    // hide loading after everything loaded
    $loading.fadeOut();
    // attach event listener for all link click event
    $(document).on('click', 'a[href]', function (e) {
      e.preventDefault();
      var page = this.pathname.split('/').slice(2) + this.search;
      load(page);
      var root = this.pathname.split('/').slice(0, 2).join('/') + '/';
      history.pushState(null, "SOS", page === 'item?action=featured' ? root : page);
    });
    window.onpopstate = getIndex;
  }
  getMenu().then(getIndex).done(initialized);
})();