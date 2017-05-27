<?php

include_once "/db/db.php";

$db = new db();

$word = $_POST['text'];

$row = $db->loadArrayData("SELECT * FROM articles WHERE header LIKE '%".$word."%'");

if ($row != '') {
  echo json_encode($row);
} else {
  echo 2;
}

?>
