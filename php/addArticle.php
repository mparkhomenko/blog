<?php

include_once 'db/db.php';

$db = new db();

$text = mysql_real_escape_string($_POST['text']);
$header = mysql_real_escape_string($_POST['header']);
$theme = $_POST['theme'];
$email = $_POST['check'];

$idUser = $db->loadArrayData("SELECT id_user FROM users WHERE email = '{$email}'");
$id = $idUser[0]["id_user"];
if($db->sqlQuery("INSERT INTO articles(article, id_user, id_theme, header) VALUES ('$text', '$id', '$theme', '$header')")) {
  echo 1;
} else {
  echo 2;
}

?>
