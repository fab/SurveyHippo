var login_click = function(e) {
  e.preventDefault();
  $('.register').hide();
};


$(document).ready(function() {
  $('.login').on('click', function(e){
    login_click(e);
  });

  $('.register').on('click', function(e){
    e.preventDefault();
    $('.login').hide();
  });
});