//= require jquery
//= require jquery_ujs
//= require public/bootstrap.min
//= require public/modernizr.custom
//= require public/classie
//= require public/uisearch
//= require turbolinks

if(window.should_disable_scroll_inspector == undefined) {
  window.should_disable_scroll_inspector = true;
}

$(document).on('turbolinks:click', function() {
  window.should_disable_scroll_inspector = true;
});

$(document).on('turbolinks:load', function() {
  new UISearch(document.getElementById('sb-search'));

  $(window).scroll(function() {
    if(should_disable_scroll_inspector) {
      return;
    }

    var scroll = $(window).scrollTop();
    var limit = $(window).height() * 0.7;

    if(scroll >= limit) {
      $(".navbar-header").addClass("scrolled");
      $(".navbar-inverse").addClass("scrolled");
    }
    else {
      $(".navbar-header").removeClass("scrolled");
      $(".navbar-inverse").removeClass("scrolled");
    }
  });
});
