$(document).ready(function() {
  $('#question_by_dates').hide();
  $('#question_by_votes').show();

  $('#sortby').change(function() {
    $('#question_by_dates').toggle();
    $('#question_by_votes').toggle();
  });
});

