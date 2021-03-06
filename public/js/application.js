$(document).ready(function() {
  q_num = 2
  addQuestion();
  addChoice();
  hideChoices();
  unhideChoices();

});

  addQuestion = function(){
    $('form').on('click', '.add_q', function(e) {
      e.preventDefault();
      console.log('q_num is ' + q_num);
      console.log('clicked add_q');
      var htmlString = "<div class='create_q'>" +
        "<p><input type='text' name='question[]' placeholder='Type in a question...'></p>" +
        "<p><input type='text'" + "name='choice_q" + q_num + "[]'" + "placeholder='Type in a choice...'></p>" +
        "<p><a class='add_c' href='#'>Add another choice</a></p>" +
      "</div>"
      $(this).parent().before(htmlString)
      q_num += 1
    });
  };


  addChoice = function(){
    $('form').on('click', '.add_c', function(e) {
      e.preventDefault();
      console.log('clicked add_c');
      var name_attr = $(this).parent().prev().children().attr('name');
      console.log(name_attr);
      var htmlString = "<p><input type='text'" + "name='" +
      name_attr + "' placeholder='Type in a choice...'></p>"
      $(this).parent().prev().after(htmlString)
    });

  hideChoices = function(){
    $('input').on('click', function(){
      $(this).parent().removeClass('disabled');
      $(this).parent().addClass('active');
      $(this).parent().parent().find('.disabled').hide();
    });

  };

  unhideChoices = function(){
    $('ul li').on('click', function(e) {
      var ellEye = $(e.target)
      ellEye.removeClass('active');
      ellEye.addClass('disabled');      
      ellEye.parent().find('.disabled').show();
    });

  };
};
