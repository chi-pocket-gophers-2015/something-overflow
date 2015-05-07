$(document).ready(function(){

  $( ".post_answer" ).on( "submit", function(event) {
    event.preventDefault();

    var body = $(this).serialize();
    var route = $(this).attr("action");

    var request = $.ajax({
      url: route,
      method: "POST",
      data: body
    });

  });



});
