<?php
    $host = "localhost";
    $dbname = "test_mobility";
    $user = "root";
    $pass = "";
    
    try {
        $db = new PDO("mysql:host=$host; dbname=$dbname", $user, $pass);
    } catch (\Throwable $th) {
    }
?>