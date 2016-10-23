//= require jquery_ujs
//= require Chart.bundle
//= require chartkick
//= require ahoy
//= require ckeditor/init
//= require turbolinks

$(document).on('turbolinks:load', function() {
  // reattach callback
  $(".notification").fadeTo(3000, 500).slideUp(500, function() {
      $(".notification").slideUp(500);
  });

  // reattach chosen jquery
  $('.chosen').chosen({
    width: '100%',
    no_results_text: 'No tags matches',
    placeholder_text_multiple: 'Select tags'
  });

  // reinitialize ckeditor
  $('.ckeditor').each(function() {
    CKEDITOR.replace($(this).attr('id'));
  });
});

