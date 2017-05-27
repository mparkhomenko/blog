<?php

include_once "/db/db.php";

$db = new db();

$idArticle = $_POST['idArticle'];
$email = $_POST['check'];
$count = 0;

$result = $db->loadArrayData("SELECT id_user FROM users WHERE email = '$email'");
$idUser = $result[0]['id_user'];

if($db->loadArrayData("SELECT id_user, id_article FROM likes WHERE id_user = '$idUser' AND id_article = '$idArticle'")) {
  return false;
} elseif($db->sqlQuery("INSERT INTO likes(uLike, id_article, id_user) VALUES (1, '$idArticle', '$idUser')")) {
  echo 1;
} else {
  echo 2;
}

?>
