$(document).on('turbolinks:load', function () {
  $("#theTarget").skippr({

    transition : 'fade',
    speed : 1500,
    easing : 'easeOutQuart',
    navType : 'block',
    childrenElementType : 'div',
    arrows : true,
    autoPlay : true,
    autoPlayDuration : 4000,
    keyboardOnAlways : false,
    hidePrevious : false
  });
});