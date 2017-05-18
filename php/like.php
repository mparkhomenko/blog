<?php

include_once "/db/db.php";

$db = new db();

$idArticle = $_POST['idArticle'];
$idUser = $_POST['idUser'];
$count = 0;

if($db->loadArrayData("SELECT id_user, id_article FROM likes WHERE id_user = '$idUser' AND id_article = '$idArticle'")) {
  return false;
} elseif($db->sqlQuery("INSERT INTO likes(uLike, id_article, id_user) VALUES (1, '$idArticle', '$idUser')")) {
  echo 1;
} else {
  echo 2;
}

?>
