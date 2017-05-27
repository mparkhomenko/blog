<?php

if (isset($_GET['page'])) {
    $page = $_GET['page'];
} else {
    $page = 1;
}

$kol = 5;
$art = ($page * $kol) - $kol;

$res = $db->loadArrayData("SELECT COUNT(*) as num FROM articles");
$total = $res[0]['num'];

$str_pag = ceil($total / $kol);

$articles = $db->loadArrayData("SELECT * FROM articles ORDER BY id_article DESC LIMIT $art, $kol");

?>
