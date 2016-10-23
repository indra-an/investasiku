//= require jquery_ujs
//= require Chart.bundle
//= require chartkick
//= require ahoy
//= require ckeditor/init
//= require turbolinks

$(document).on('turbolinks:load', function() {
  // reinitialize ckeditor
  $('.ckeditor').each(function() {
    CKEDITOR.replace($(this).attr('id'));
  });

  // reattach callback
  $(".notification").fadeTo(3000, 500).slideUp(500, function() {
      $(".notification").slideUp(500);
  });
});

