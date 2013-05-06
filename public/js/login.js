var login_click = function(e) {
  e.preventDefault();
  $('#login_box').slideToggle();
};

var register_click = function(e) {
  e.preventDefault();
  $('#register_box').slideToggle();
};

var login_submit = function(e) {
  e.preventDefault();
  $.ajax({
    type: 'post',
    url: '/login_ajax',
    data: $('#login_box').find('form').serialize()
  }).done(function(response){
    console.log(response);
    if (response.length<200){
      $('#login_box').find('.errors').text(response);
    }
    else{
      console.log('else route');
      $('html').html(response);
    }
  });
};

var register_submit = function(e) {
  e.preventDefault();
  $.ajax({
    type: 'post',
    url: '/register',
    data: $(this).serialize()
  }).done(function(response){
    console.log(repsonse);
  });
};


$(document).ready(function() {
  $('.hidden').hide();

  $('.login').on('click', function(e){
    login_click(e);
  });

  $('#login_box').on('submit', function(e){
    login_submit(e);
  });

  $('.register').on('click', function(e){
    register_click(e);
  });

  $('#register_box').on('submit', function(e){
    register_submit(e);
  });
});