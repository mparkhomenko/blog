$(document).ready(function() {
  var check = localStorage.getItem("Email");
  if (check) {
    $(".form").css("display", "none");
    $(".add-article-link").css("display", "block");
    $(".email-check").html(check);
  }
  else {
    $(".form").css("display", "block");
    $(".email-check").css("display", "none");
    $(".add-article-link").css("display", "none");
  }

  $("#btn-reg").on("click", function() {
    var email = $("#inputEmail3").val();
    var name = $("#inputName3").val();
    var pass = $("#inputPassword3").val();

    if (email != '' && pass != '' && name != '') {
      var passHex = md5(pass);
      $.ajax({
        type: "POST",
        url: "php/registration.php",
        data: {
          email: email,
          name: name,
          passHex: passHex
        },
        success: function(msg) {
          switch (msg) {
            case "1":
              alert("Всё ок! Теперь вы можете войти в систему.");
              location.reload();
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
              location.reload();
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
    var header = $("#text-header").val();
    var selind = document.getElementById("select-theme").options.selectedIndex;
    var theme = document.getElementById("select-theme").options[selind].value;

    if (text != '' && theme != '') {
      $.ajax({
        type: "POST",
        url: "php/addArticle.php",
        data: {
          text: text,
          theme: theme,
          header: header,
          check: check
        },
        success: function(msg) {
          switch (msg) {
            case "1":
              alert("Всё ок!");
              location.reload();
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

  $("#add-comment-button").on("click", function() {
    var text = $("#text-comment").val();
    var idArticle = $(".hidden").val();
    console.log(idArticle);

    if (text != '') {
      $.ajax({
        type: "POST",
        url: "php/addComment.php",
        data: {
          text: text,
          check: check,
          idArticle: idArticle
        },
        success: function(msg) {
          switch (msg) {
            case "1":
              alert("Всё ок!");
              location.reload();
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

  $(".star-block").bind("click", function() {
        var link = $(this);
        var idArticle = link.data('article');
        var idUser = link.data('user');
        console.log(idUser);
        console.log(idArticle);
        console.log(link.find('i'));
        var child = link.find('i');
        $.ajax({
            url: "/php/like.php",
            type: "POST",
            data: {
              idArticle: idArticle,
              idUser: idUser
            },
            success: function(msg) {
              console.log(msg);
              switch (msg) {
                case "1":
                  $('.star-count', link).html(1);
                  break;
                case "2":
                  alert('Что-то пошло не так...');
                  break;
              }
            }
        });
    });
});
