// admin javascript manifest
//= require_tree ./support
//= require pickadate.min
//= require jquery.timepicker
//= require selectize

$(function() {
  $('.datepicker').pickadate()
  $('.timepicker').timepicker()
  $('.text_copy').bind('click', function() {
    $(this).select()
  });

  $('#notice').bind('click', function() {
    $(this).fadeOut()
  })

  setTimeout(function() { $('#notice').fadeOut() }, 3500)
});
