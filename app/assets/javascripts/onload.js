import $ from 'jquery';

$(function() {
  $('.flash').on('click', function() {
    $(this).fadeOut();
  });
  $('.flash').each(function(idx, el) {
    var $el;
    $el = $(el);
    const classes = Array.from(el.classList)
    if (classes.includes('alert') || classes.includes('error')) {
      return;
    }
    return setTimeout(function() {
      $el.fadeOut();
    }, 3500);
  });
});

