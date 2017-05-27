<?php

if (isset($_GET['page'])) {
    $page = $_GET['page'];
} else {
    $page = 1;
}

$kol = 5;
$art = ($page * $kol) - $kol;

$total = $res[0]['num'];

$str_pag = ceil($total / $kol);

?>
