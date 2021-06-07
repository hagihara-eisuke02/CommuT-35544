$(function() {
  $('#ad-footer-explain').on('click',function(event){
    $('body, html').animate({
      scrollTop:0
    }, 400);
    event.preventDefault();
  });
});