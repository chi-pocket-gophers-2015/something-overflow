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

    request.success(function(response){
      console.log(response);
      //  select something on page with jQuery and append response
      $('.question_comments').append(response);
      });
    });
  });



});
