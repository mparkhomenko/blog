<?php

include_once "/db/db.php";

$db = new db();

$idArticle = $_POST['idArticle'];

if ($db->sqlQuery("DELETE FROM favourites WHERE id_article = '$idArticle'")) {
  echo 1;
} else {
  echo 2;
}

?>
