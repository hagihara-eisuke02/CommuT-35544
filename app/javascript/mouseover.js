$(function () {
  $(document).on("mouseover", ".login-btn", function () {
    $(".login-bull-btn").css({ "background-color": "red" });
  }).on("mouseout", ".login-btn", function () {
    $(".login-bull-btn").css({ "background-color": "" });
  })
});



$(function () {
  $(document).on("mouseover", ".register-btn", function () {
    $(".register-red-btn").css({ "background-color": "blue" });
  }).on("mouseout", ".register-btn", function () {
    $(".register-red-btn").css({ "background-color": "" });
  })
});


$(function () {
  $(document).on("mouseover", ".service-title", function () {
    $(".service-title").css({ "color": "blue" });
  }).on("mouseout", ".service-title", function () {
    $(".service-title").css({ "color": "" });
  })
});
