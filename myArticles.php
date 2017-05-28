<?php

include_once "/php/db/db.php";

$db = new db();

include_once "/php/usersArticle.php";
include_once "/php/pagination.php";

$articlesUsers = $db->loadArrayData("SELECT * FROM articles WHERE id_user = '$idUser' ORDER BY id_article DESC LIMIT $art, $kol");
$countArt = $res[0]['num'];

$likes = $db->loadArrayData("SELECT uLike FROM likes");

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
                <li><a href="add.php" class="my-article-link" id="my-article">Мои статьи <span class="badge"><?= $countArt; ?></span></a></li>
                <li><a href="favourites.php" class="my-favourites-link">Избранное</a></li>
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
        <?php for($i = 0; $i < count($articlesUsers); $i++):?>
          <div class="article-index col-lg-8 col-md-8 col-sm-6 col-xs-4" data-id="<?= $articlesUsers[$i]["id_article"]; ?>">
            <h2><a href="article.php?id=<?= $articlesUsers[$i]["id_article"]; ?>"><?= $articlesUsers[$i]["header"]; ?></a></h2>
            <?php $theme = $articlesUsers[$i]["id_theme"]; $idTheme = $db->loadArrayData("SELECT id_theme, theme FROM themes WHERE id_theme = '$theme'"); ?>
            <?php for ($j=0; $j < count($idTheme); $j++): ?>
                <h4>Тема: <small><a href="theme.php?id=<?= $idTheme[$j]['id_theme']; ?>"><?= $idTheme[$j]['theme']; ?></a></small></h4>
            <? endfor; ?>
            <p>
              <?= $articlesUsers[$i]["article"]; ?>
            </p>
            <div class="star-block" data-article="<?= $articlesUsers[$i]["id_article"]; ?>" data-user="<?= $articlesUsers[$i]["id_user"]; ?>">
              <?php $article = $articlesUsers[$i]["id_article"]; $likesCount = count($db->loadArrayData("SELECT uLike FROM likes WHERE id_article = '$article'")); ?>
              <i class="fa fa-star-o"></i> <span class="star-count">Лайк <?= $likesCount; ?></span>
            </div>
            <div class="fav-block">
              <i class="fa fa-plus-square-o" aria-hidden="true"></i> <span>В избранное</span>
            </div>
            <div class="comments-block">
              <?php $article = $articlesUsers[$i]["id_article"]; $commentsCount = count($db->loadArrayData("SELECT comment FROM comments WHERE id_article = '$article'")); ?>
              <i class="fa fa-comments-o" aria-hidden="true"></i> <span class="comments-count">Комментарии <?= $commentsCount; ?></span>
            </div>
          </div>
        <? endfor; ?>

        <div class="pagination">
          <nav aria-label="...">
            <ul class="pagination pagination-sm">
              <?php for ($i = 1; $i <= $str_pag; $i++): ?>
                <li class="page-item"><?= "<a href=myArticles.php?page=".$i.">".$i."</a>" ?></li>
              <?php endfor; ?>
            </ul>
          </nav>
        </div>
      </div>
    </div>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="bootstrap/js/bootstrap.min.js"></script>
  <script src="md5.js" type="text/javascript"></script>
  <script src="query.js" type="text/javascript"></script>
  </body>
</html>
