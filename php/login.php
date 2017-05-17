<?php

include_once 'db/db.php';

$db = new db();

$email = $_POST['email'];
$pass = $_POST['passHex'];

if(count($db->loadArrayData("SELECT email, password FROM users WHERE (email = '{$email}') AND (password = '{$pass}')")))
{
  echo 1;
}
else {
  echo 2;
}

?>
