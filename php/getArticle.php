<?php

include_once "/db/db.php";

$db = new db();

$idArticle = $_POST['idArticle'];

$result = $db->loadArrayData("SELECT * FROM articles WHERE id_article = '$idArticle'");

echo json_encode($result);

?>
