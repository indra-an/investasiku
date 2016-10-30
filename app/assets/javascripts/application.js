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

$(document).on("turbolinks:click", function() {
  window.should_disable_scroll_inspector = true;
});

$(document).on("turbolinks:load", function() {
  new UISearch(document.getElementById("sb-search"));

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

  $("#form-search-context #query").keypress(function(e) {
    if(e.which == 13) {
      $("#form-search-context button.invest-rad-30").click();
      return false;
    }
  });

  $("#form-search-context button.invest-rad-30").on("click", function() {
    $("#form-search-context i.fa").removeClass().addClass("fa fa-spinner fa-pulse fa-fw");
    $("#form-search-context").submit();
    $("#form-search-context .invest-rad-30").attr("disabled", "disabled");
  });

  var sideslider = $('[data-toggle=collapse-side]');
  var sel = sideslider.attr('data-target');
  var sel2 = sideslider.attr('data-target-2');
  sideslider.click(function(event) {
    $(sel).toggleClass('in');
    $(sel2).toggleClass('out');
  });
});

function enableFormSearchContext() {
  $("#form-search-context .invest-rad-30").removeAttr("disabled");
  $("#form-search-context i.fa").removeClass().addClass("fa fa-search");
}
