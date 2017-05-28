<?php

$emailUser = $_COOKIE['Email'];

$result = $db->loadArrayData("SELECT id_user FROM users WHERE email = '$emailUser'");

$idUser = $result[0]['id_user'];

$res = $db->loadArrayData("SELECT COUNT(*) as num FROM articles WHERE id_user = '$idUser'");

?>
