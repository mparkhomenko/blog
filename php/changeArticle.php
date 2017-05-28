<?php

include_once "/db/db.php";

$db = new db();

$idArticle = $_POST['idArticle'];
$textHeader = $_POST['textHeader'];
$textArticle = $_POST['textArticle'];

if ($db->sqlQuery("UPDATE articles SET article = '$textArticle', header = '$textHeader' WHERE id_article = '$idArticle'")) {
  echo 1;
} else {
  echo 2;
}

?>
