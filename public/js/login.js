$(document).ready(function() {
  $("#login_link").click(function(event) {
    event.preventDefault();
    var request = $.ajax({
      url: '/login'
    });
    request.done(function(response){
      // console.log($(this).parent());
      $('#login_link').parent().hide();
      $('.login_box').append(response);
    });

    $('nav').on("submit", "form", function(event){
      event.preventDefault();
      $('form').remove();

      formContents = $(this).serialize();
      var request = $.ajax({
        url: '/login',
        method: 'POST',
        data: formContents
      });

      request.done(function(response){
        $('#login_box').remove();
        console.log(response);
      });
    });
  });
});
