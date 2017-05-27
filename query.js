$(document).ready(function() {
  var check = localStorage.getItem("Email");
  console.log(check);
  if (check) {
    $(".form").css("display", "none");
    $(".add-article-link").css("display", "block");
    $(".my-article-link").css("display", "block");
    $(".my-favourites-link").css("display", "block");
    $(".add-comment").css("display", "block");
    $(".danger").css("display", "none");
    $(".email-check").html(check);
  }
  else {
    $(".form").css("display", "block");
    $(".email-check").css("display", "none");
    $(".add-article-link").css("display", "none");
    $(".my-article-link").css("display", "none");
    $(".my-favourites-link").css("display", "none");
    $(".add-comment").css("display", "none");
    $(".danger").css("display", "block");
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
    if (check) {
      var link = $(this);
      var idArticle = link.data('article');
      // var idUser = link.data('user');
      // console.log(idUser);
      console.log(idArticle);
      // console.log(link.find('i'));
      var child = link.find('i');
      $.ajax({
          url: "/php/like.php",
          type: "POST",
          data: {
            idArticle: idArticle,
            check: check
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
    } else {
      alert('Нельзя ставить лайк незарегестрировавшись!');
    }
  });

  $("#search-btn").on("click", function () {
    var text = $("#text-search").val();
    if(text != '') {
      $.ajax({
        type: "POST",
        url: "/php/searchScript.php",
        data: {
          text: text
        },
        success: function(msg) {
          if (msg == "2") {
            alert('Ничего не найдено!');
          } else {
            var result = $.parseJSON(msg);
            var resultLength = result.length;
            var id = 0;
            var header = '';
            var article = '';
            var theme = '';
            $('div.clone:not(#header-clone-0)').remove();
            for (var i = 0; i < resultLength; i++) {
              $('#header-clone-0').clone().attr('id', 'header-clone-' + (i + 1)).insertAfter('#header-clone-' + i);
              var s = $('#header-clone-' + (i + 1));
              console.log(s);
              id = result[i]['id_article'];
              header = result[i]['header'];
              article = result[i]['article'];
              s.find('h2 .header-article').html(header).attr('href', 'article.php?id=' + id);
              s.find('.article-text').html(article);
              s.find('.article-text').html(article);
              $('#header-clone-0').css('display', 'none');
              $('.clone').css('display', 'block');
              console.log(header);
              console.log(id);
            }
          }
        }
      });
    } else {
        alert("Поле поиска пустое.");
        return false;
      }
  });
});
