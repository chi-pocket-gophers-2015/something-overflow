
$(document).ready(function () {
  var add_button_var

  $('.answer-comment-form').hide();
  $('.post_answer').hide();


  $('.answer-comment-form').submit(function (event) {
    event.preventDefault();
    //grab the route right quick
    var route = $(this).attr("action");
    //find value of what the user put as the comment.
    var commentText = $(this).find("textarea[name='body']").val();
    var posterId = route[1];
    // send request to server
    var request = $.ajax({
      method: 'post',
      url: route,
      data : {author_id: posterId, body: commentText},
    });

    request.done(function (response) {
      // var stuff = JSON.parse(response);
      $('.answer-comment-form').slideUp("fast", function () {
            add_button_var.delay(500).toggle("right");
            add_button_var = null;
      });

      $(".answer-comment-form").first().after(response);
    });

  });

  $('.add-comment-button').click(function  (event) {
    event.preventDefault();
    //grab the form with the correct id.
    add_button_var = $(this)
    var parObject = $(this).parent().find("form");

     add_button_var.toggle('right' , function (event) {
      $(parObject).toggle("slide");
     });
  });

$('.add_comment_link').click(function (event) {
    //grab parent with the form
    event.preventDefault();
    var parObject = $(this).parent();
    var textAreaObj = parObject.find("textarea");
    $('.answers-global-container').css("margin-top", "10em;");
    $(this).toggle("drop");
    $('.post_answer').toggle("drop");

});

$('.post_answer').click( function (event) {
      event.preventDefault();
        var route = $(this).attr("action");
    var commentText = $(this).find("textarea[name='body']").val();
    var posterId = route[1];
    var request = $.ajax({
      method: 'post',
      url: route,
      data : {posterId: posterId, body: commentText},
    });
        request.done(function (response) {
      $('.answers-global-container').css("margin-top", "0em;");
      $('.post_answer').toggle("fast");
      $('.add_comment_link').toggle("fast");
      $(".answer-container").first().before(response);

  });
});


});