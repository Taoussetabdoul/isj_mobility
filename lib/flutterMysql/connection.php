<?php
    $host = "localhost";
    $dbname = "isj_mobile";
    $user = "root";
    $pass = "";
    
    try {
        $db = new PDO("mysql:host=$host; dbname=$dbname", $user, $pass);
    } catch (\Throwable $th) {
    }
?>