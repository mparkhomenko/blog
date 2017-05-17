<?php

include_once "/php/db/db.php";

$db = new db();

$articles = $db->loadArrayData("SELECT id_article, article, id_theme, header FROM articles");

?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <link rel="shortcut icon" href="/images/tux.png" type="image/png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/font-awesome/css/font-awesome.min.css">
    <title>Linux blog</title>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/main.css">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    <div class="container">
      <div class="row">
        <h1>Linux blog</h1>
        <div class="navbar navbar-inverse">
          <div class="container">
            <div class="navbar-header">
              <button type="button" name="button" class="navbar-toggle" data-toggle="collapse" data-target="#responsive-menu">
                <span class="sr-only">Открыть навигацию</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a href="/" class="navbar-brand">
                <img src="/images/tux.png" class="brand-image" alt="tux">
              </a>
            </div>
            <div class="collapse navbar-collapse" id="responsive-menu">
              <ul class="nav navbar-nav">
                <li><a href="blogs.php">Блоги</a></li>
                <li><a href="search.php">Поиск</a></li>
                <li><a href="add.php" class="add-article-link">Добавить статью</a></li>
              </ul>
              <div class="form navbar-form navbar-right">
                <div class="form-group">
                  <input type="text" name="userEmail" placeholder="E-mail" value="" class="form-control uEmail">
                </div>
                <div class="form-group">
                  <input type="password" name="userPass" placeholder="Password" value="" class="form-control uPass">
                </div>
                <button type="button" name="buttonLogin" class="btn btn-primary" id="btn-login">
                  <i class="fa fa-sign-in" aria-hidden="true"></i> Войти
                </button>
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal-1">Регистрация</button>
              </div>
              <div class="navbar-right">
                <span class="email-check"></span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="container">
      <div class="row">
        <?php for($i = 0; $i < count($articles); $i++):?>
          <div class="article-index col-lg-8 col-md-8 col-sm-6 col-xs-4" id="<?= $articles[$i]["id_article"]; ?>">
            <h2><a href="article.php?id=<?= $articles[$i]["id_article"]; ?>"><?= $articles[$i]["header"]; ?></a></h2>
            <?php $theme = $articles[$i]["id_theme"]; $idTheme = $db->loadArrayData("SELECT theme FROM themes WHERE id_theme = '$theme'"); ?>
            <?php for ($j=0; $j < count($idTheme); $j++): ?>
                <h4>Тема: <small><a href="theme.php"><?= $idTheme[$j]['theme']; ?></a></small></h4>
            <? endfor; ?>
            <p>
              <?= $articles[$i]["article"]; ?>
            </p>
            <div class="star-block">
              <i class="fa fa-star-o"></i> <span class="star-count">100</span>
            </div>
            <div class="comments-block">
              <i class="fa fa-comments-o" aria-hidden="true"></i> <span class="comments-count">10</span>
            </div>
          </div>
        <? endfor; ?>
        <!-- <ul class="pagination">
          <li class="disabled"><a href="#">«</a></li>
          <li class="active"><a href="#">1</a></li>
          <li><a href="#">2</a></li>
          <li><a href="#">3</a></li>
          <li><a href="#">4</a></li>
          <li><a href="#">5</a></li>
          <li><a href="#">»</a></li>
        </ul> -->
      </div>
    </div>

    <div class="modal fade" id="modal-1">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Регистрация</h4>
          </div>
          <div class="modal-body">
            <div class="form-horizontal">
              <div class="form-group">
                <label for="inputName3" class="col-sm-2 control-label">Имя</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control" id="inputName3" placeholder="Name">
                </div>
              </div>
              <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
                <div class="col-sm-10">
                  <input type="email" class="form-control" id="inputEmail3" placeholder="Email">
                </div>
              </div>
              <div class="form-group">
                <label for="inputPassword3" class="col-sm-2 control-label">Пароль</label>
                <div class="col-sm-10">
                  <input type="password" class="form-control" id="inputPassword3" placeholder="Password">
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                  <button type="submit" class="btn btn-default">Зарегистрироваться</button>
                </div>
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <button class="btn btn-danger" type="button" data-dismiss="modal">Закрыть</button>
          </div>
        </div>
      </div>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="md5.js" type="text/javascript"></script>
    <script src="query.js" type="text/javascript"></script>
  </body>
</html>
