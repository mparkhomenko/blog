<?php

include_once 'db/db.php';

$db = new db();

$email = $_POST['email'];
$name = $_POST['name'];
$pass = $_POST['passHex'];

if($db->sqlQuery("INSERT INTO users(name, email, password) VALUES ('$name', '$email', '$pass')"))
{
  echo 1;
}
else {
  echo 2;
}

?>
