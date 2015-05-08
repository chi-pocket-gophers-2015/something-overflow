$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()

  $(".post-div").click(function (event) {
    location.href='#'
  });

  $("#new-link").click(function(event) {
  	event.preventDefault();

  	var request = $.ajax({
  		url: 'contacts/new'
  	});

  	request.success(function(response){
  		$('main').append(response);
  	});

  	$(this).hide();
  });

  // $('form').submit(function(){});
  // $('body').on('submit', 'form', function(event) {
  // 	event.preventDefault();


  // 	var request = $.ajax({
  // 		url: 'contacts',
  // 		method: 'POST',
  // 		data: $(this).serialize()
  // 	});

  // 	request.done(function(response){
  // 		$('tbody').append(response);
  // 	});
  // });



$( "form.new_comment" ).hide()
$( '.new_comment_link').click(function(event) {
    event.preventDefault();
      $( "form.new_comment" ).show();
      $( ".new_comment_link" ).hide();
  });

  $( ".new_comment input[type=submit]" ).click(function(event){

    event.preventDefault();

    var text = $( "textarea[name=body]" ).val();

    if (text == "") {
      $( ".new_comment_link" ).show();
      $( "form.new_comment" ).hide();
    }

    else {
      $( ".new_comment_link" ).show();
      $( "<div>" + text + "</div>" ).prependTo( ".question-comments-container" );
      $("form.new_comment").hide();

    var route = $(this).parent().attr("action").toLowerCase();
    // console.log("the route: " + route);

    var request = $.ajax({
     url: "" + route,
     method: 'POST',
     data: {comment: text}
    });

    request.success(function(response){
      $(".question-comments-container").prepend(response);
    });

    };

  });

});
