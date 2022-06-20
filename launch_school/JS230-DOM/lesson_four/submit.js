'use strict';

let character;
$(function() {
  $('form').on('submit', function(event) {
    event.preventDefault();
    character = $('#key').val();

    $(document).off('keypress').on('keypress', function(event) {
      if (event.key !== character) {
        return;
      }

      $('a').trigger('click');
    });
  });

  $('a').on('click', function(event) {
    event.preventDefault();

    let $accordion = $('#accordion');
    $accordion.slideToggle();
  })
})
