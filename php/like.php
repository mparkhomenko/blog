<?php

include_once "/db/db.php";

$db = new db();

$query = $db->sqlQuery("UPDATE likes SET uLike = count_like+1  WHERE id = :id");

?>
