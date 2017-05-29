<?php

include_once "/db/db.php";

$db = new db();

$themeId = $_POST['themeId'];
// $themeId = 13;

$result = $db->loadArrayData("SELECT * FROM articles WHERE id_theme = '$themeId'");

if ($result != '') {
  echo json_encode($result);
} else {
  echo 2;
}

?>
