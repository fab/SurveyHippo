$(document).ready(function() {
  q_num = 2
  addQuestion();
  addChoice();
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
};
