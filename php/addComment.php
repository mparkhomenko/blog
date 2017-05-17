<?php

include_once 'db/db.php';

$db = new db();

$text = mysql_real_escape_string($_POST['text']);
$idArticle = $_POST['idArticle'];
$email = $_POST['check'];

$idUser = $db->loadArrayData("SELECT id_user FROM users WHERE email = '{$email}'");
$id = $idUser[0]["id_user"];
if($db->sqlQuery("INSERT INTO comments(comment, id_user, id_article) VALUES ('$text', '$id', '$idArticle')")) {
  echo 1;
} else {
  echo 2;
}

?>
