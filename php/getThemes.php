<?php

include_once "/db/db.php";

$db = new db();

$sectionId = $_POST['sectionId'];

$result = $db->loadArrayData("SELECT * FROM themes WHERE id_section = '$sectionId'");

echo json_encode($result);

?>
