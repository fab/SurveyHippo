var login_click = function(e) {
  e.preventDefault();
  $('#login_box').slideToggle();
};

var register_click = function(e) {
  e.preventDefault();
  $('#register_box').slideToggle();
};

var register_submit = function(e) {
  e.preventDefault();
  $.ajax({
    type: 'post',
    url: '/register',
    data: $('#register_box').find('form').serialize()
  }).done(function(response){
    console.log(repsonse);
  });
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