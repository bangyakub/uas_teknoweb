<?php

$db_host='localhost';
$db_user='root';
$db_pass='';
$db_name='uas_teknoweb';

$koneksi= new PDO("mysql:host=$db_host; port=3306; dbname=$db_name", $db_user, $db_pass);
?>