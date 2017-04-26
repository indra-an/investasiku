//= require jquery
//= require jquery_ujs
//= require Chart.bundle
//= require chartkick
//= require ahoy
//= require chosen/chosen.jquery.min
//= require public/bootstrap.min
//= require ckeditor/init
//= require_self

$(document).on('ready', function() {
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

