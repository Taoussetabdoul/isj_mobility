<?php
    $host = "localhost";
    $dbname = "id16223351_isj_mobility";
    $user = "id16223351_root";
    $pass = "a_7dOaW*7oKRuQGH";
    
    try {
        $db = new PDO("mysql:host=$host; dbname=$dbname", $user, $pass);
    } catch (\Throwable $th) {
    }
?>