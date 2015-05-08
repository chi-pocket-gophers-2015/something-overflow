// $(document).ready(function() {

// $( "form.new_comment" ).hide()
// $( '.answer_comment_button').click(function(event) {
//     event.preventDefault();

//       console.log("answer button clicked");
//       current_target = $(event.target);

//       $( "form.new_comment" ).show();
//       $( ".answer_comment_button" ).hide();
//   });

//   $( ".new_comment input[data-parent=Answer]" ).click(function(event){
//     console.log("comment button clicked!");
//     event.preventDefault();

//     current_target = event.target;//.parent();

//     var all_context = current_target.parentElement.firstElementChild;

//     console.log("object is: " + current_target.parentElement.firstElementChild);//"textarea[name=body]"));
//     // debugger;
//     var text = $( current_target.parentElement.firstElementChild ).val();
//     console.log("text is: " + text);
//     if (text == "") {
//       $( ".answer_comment_button" ).show();
//       $( "form.new_comment" ).hide();
//     } else {
//       $( ".answer_comment_button" ).show();
//       $(text).prependTo( ".question-comments-container" );
//       $("form.new_comment").hide();
//       console.log("made it this far!");
//       console.log($(this).parent());

//     var route = $(this).parent().attr("action").toLowerCase();
//     // console.log("the route: " + route);

//     var request = $.ajax({
//      url: "" + route,
//      method: 'POST',
//      data: {comment: text}
//     });

//     request.success(function(response){
//       $(".question-comments-container").prepend(response);
//     });

//     };

//   });

// });
