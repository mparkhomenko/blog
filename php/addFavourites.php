<?php

include_once "/db/db.php";

$db = new db();

$idArticle = $_POST['idArticle'];
$idUser = $_POST['idUser'];

// if ($db->sqlQuery()) {
//   echo 1;
// } else {
//   echo 2;
// }

if($db->loadArrayData("SELECT id_user, id_article FROM favourites WHERE id_user = '$idUser' AND id_article = '$idArticle'")) {
  echo 2;
  return false;
} elseif($db->sqlQuery("INSERT INTO favourites(id_article, id_user) VALUES ('$idArticle', '$idUser')")) {
  echo 1;
} else {
  echo 3;
}

?>
