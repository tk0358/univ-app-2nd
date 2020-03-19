$(document).on('turbolinks:load', function() {
  $(".dropdown-trigger").dropdown();
  $('.sidenav').sidenav();
  $('#fade-out-target').fadeOut(4000);
  $('select').formSelect();
})