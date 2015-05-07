$(document).ready(function() {
  $("#login_link").click(function(event) {
    event.preventDefault();
    var request = $.ajax({
      url: '/login'
    });
    request.done(function(response){
      $('main').append("<div>" + response + "</div>")
    })
  });
});
