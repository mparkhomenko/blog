$(document).ready(function() {
  var check = localStorage.getItem("Email");
  if (check) {
    $(".form").css("display", "none");
    $(".add-article-link").css("display", "block");
    $(".my-article-link").css("display", "block");
    $(".my-favourites-link").css("display", "block");
    $(".add-comment").css("display", "block");
    $(".danger").css("display", "none");
    $(".add-to-favourites").css('display', 'inline-block');
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
    $(".add-to-favourites").css('display', 'none');
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
          console.log(msg);
          switch (msg) {
            case "1":
              localStorage.setItem("Email",email);
              document.cookie = "Email=" + email + "";
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
                $('.star-count', link).html("Лайк " + 1);
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
              id = result[i]['id_article'];
              header = result[i]['header'];
              article = result[i]['article'];
              s.find('h2 .header-article').html(header).attr('href', 'article.php?id=' + id);
              s.find('.article-text').html(article);
              s.find('.article-text').html(article);
              $('#header-clone-0').css('display', 'none');
              $('.clone').css('display', 'block');
            }
          }
        }
      });
    } else {
        alert("Поле поиска пустое.");
        return false;
      }
  });

  $(".delete-article").on("click", function () {
    var link = $(this);
    var idArticle = link.data('id');
    $.ajax({
      type: "POST",
      url: "/php/deleteArticle.php",
      data: {
        idArticle: idArticle
      },
      success: function(msg) {
        switch (msg) {
          case "1":
            alert("Запись успешно удалена!");
            location.reload();
            break;
          case "2":
            alert("Ошибка, попробуйте ещё раз!");
            break;
          default:
            alert("404");
        }
      }
    });
  });

  $(".get-article").on("click", function () {
    var link = $(this);
    var idArticle = link.data('id');
    $.ajax({
      type: "POST",
      url: "/php/getArticle.php",
      data: {
        idArticle: idArticle
      },
      success: function(msg) {
        var result = $.parseJSON(msg);
        $('#text-header-change').val(result[0]['header']);
        $('#text-article-change').html(result[0]['article']);
        $('#id-article-change').val(result[0]['id_article']);
      }
    });
  });

  $("#change-btn").on("click", function () {
    var idArticle = $('#id-article-change').val();
    var textHeader = $('#text-header-change').val();
    var textArticle = $('#text-article-change').html();
    $.ajax({
      type: "POST",
      url: "/php/changeArticle.php",
      data: {
        idArticle: idArticle,
        textHeader: textHeader,
        textArticle: textArticle
      },
      success: function(msg) {
        switch (msg) {
          case "1":
            alert("Запись успешно изменена!");
            location.reload();
            break;
          case "2":
            alert("Ошибка, попробуйте ещё раз!");
            break;
          default:
            alert("404");
        }
      }
    });
  });

  $(".add-to-favourites").on("click", function () {
    var link = $(this);
    var idArticle = link.data('id');
    var idUser = link.data('user');
    console.log(idArticle);
    console.log(idUser);
    $.ajax({
      type: "POST",
      url: "/php/addFavourites.php",
      data: {
        idArticle: idArticle,
        idUser: idUser
      },
      success: function(msg) {
        console.log(msg);
        switch (msg) {
          case "1":
            alert("Запись успешно добавлена в избранное!");
            break;
          case "2":
            alert("Видимо, запись уже в избранном.");
            break;
          default:
            alert("404");
        }
      }
    });
  });

  $(".delete-favourite").on("click", function () {
    var link = $(this);
    var idArticle = link.data('id');
    console.log(idArticle);
    $.ajax({
      type: "POST",
      url: "/php/deleteFavourites.php",
      data: {
        idArticle: idArticle
      },
      success: function(msg) {
        console.log(msg);
        switch (msg) {
          case "1":
            alert("Запись успешно удалена из избранного!");
            location.reload();
            break;
          case "2":
            alert("Ошибка, попробуйте ещё раз!");
            break;
          default:
            alert("404");
        }
      }
    });
  });
});
