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


$(function () {
  $(document).on("mouseover", ".service-subtitle1", function () {
    $(".service-subtitle1").css({ "color": "yellow" });
  }).on("mouseout", ".service-subtitle1", function () {
    $(".service-subtitle1").css({ "color": "" });
  })
});

$(function () {
  $(document).on("mouseover", ".service-subtitle2", function () {
    $(".service-subtitle2").css({ "color": "red" });
  }).on("mouseout", ".service-subtitle2", function () {
    $(".service-subtitle2").css({ "color": "" });
  })
});


// $(function () {
//   $(document).on("mouseover", ".purchase-btn-icon2", function () {
//     $(".purchase-btn-icon2");
//   }).on("mouseout", ".purchase-btn-icon", function () {
//     $(".purchase-btn-icon");
//   })
// });
