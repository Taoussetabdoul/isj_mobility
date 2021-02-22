<?php

    include "login.php";

    $requete=$conn->query("SELECT nom FROM users ");
    $resultat=array();

    while($row=$requete->fetch_assoc())
    {
        $resultat[]=$row;
    }

    echo json_encode($resultat);
?>
