var login_click = function(e) {
  e.preventDefault();
  $('#login_box').slideToggle();
};

var register_click = function(e) {
  e.preventDefault();
  $('#register_box').slideToggle();
};


$(document).ready(function() {
  $('.hidden').hide();

  $('.login').on('click', function(e){
    login_click(e);
  });

  $('.register').on('click', function(e){
    register_click(e);
  });
});