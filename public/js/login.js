var login_click = function(e) {
  e.preventDefault();
  $('.register').hide();
  $('#login_box').show();
};

var register_click = function(e) {
  e.preventDefault();
  $('.login').hide();
  $('#register_box').show();
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