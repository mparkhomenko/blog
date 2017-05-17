$(document).ready(function() {
  var check = localStorage.getItem("Email");
  if (check != '') {
    $(".form").css("display", "none");
    $(".add-article-link").css("display", "block");
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
              $(".add-article-link").css("display", "block");
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

  $("#add-article-btn").on("click", function() {
    var text = $("#text-article").val();
    var selind = document.getElementById("select-theme").options.selectedIndex;
    var theme = document.getElementById("select-theme").options[selind].value;
    console.log(text);
    console.log(theme);

    if (text != '' && theme != '') {
      $.ajax({
        type: "POST",
        url: "php/addArticle.php",
        data: {
          text: text,
          theme: theme,
          check: check
        },
        success: function(msg) {
          console.log(msg);
          switch (msg) {
            case "1":
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
