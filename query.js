$(document).ready(function() {
  var check = localStorage.getItem("Email");
  if (check != '') {
    $(".form").css("display", "none");
    $(".email-check").html(check);
  }
  else {
    $(".form").css("display", "block");
    $(".email-check").css("display", "none");
  }
  $("#btn-login").on("click", function() {
    var email = $(".uEmail").val();
    var pass = $(".uPass").val();

    if (email != '' && pass != '') {
      var passHex = md5(pass);
      $.ajax({
        type: "POST",
        url: "php/login.php",
        data: {
          email: email,
          passHex: passHex
        },
        success: function(msg) {
          switch (msg) {
            case "1":
              localStorage.setItem("Email",email);
              $(".form").css("display", "none");
              alert("Всё ок!");
              break;
            case "2":
              alert("Что-то не так... попробуйте ещё раз.");
              break;
            default:
              alert("404");
          }
        }
      });
    }
    else {
      alert("Заполните все поля");
    }
  });
});
