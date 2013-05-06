var login_click = function(e) {
  e.preventDefault();
  $('.register').hide();
  $('#login_box').show();
};


$(document).ready(function() {
  $('.hidden').hide();

  $('.login').on('click', function(e){
    login_click(e);
  });

  $('.register').on('click', function(e){
    e.preventDefault();
    $('.login').hide();
  });
});