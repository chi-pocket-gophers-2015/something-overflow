$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()

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



  $( "form#new_comment" ).hide()
 $( '#new_comment_link').click(function(event) {
    event.preventDefault();
      $( "form#new_comment" ).show();
      $( "#new_comment_link" ).hide();
  });
  $( "#new_comment input[type=submit]" ).click(function(event){
    console.log("I was clicked!");

    event.preventDefault();
    var text = $( "textarea[name=body]" ).val();
    console.log("text is: " + text);

    if (text == "") {
      $( "#new_comment_link" ).show();
      $( "form#new_comment" ).hide();
    }
    else {
      $( "#new_comment_link" ).show();
      $( "<p>" + text + "</p>" ).appendTo( ".question_comments" );
      $("form#new_comment").hide();
      console.log("this is: " + $(this));
   var request = $.ajax({
     url: '/comments/new',
     method: 'POST',
     data: text //WHAT DO HERE I DONNO
   });
    };
  });

});
