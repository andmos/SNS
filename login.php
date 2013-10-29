<?php

    $username = "root";
    $password = "Glittertind";
    $hostname = "localhost";	
    $database = "konto";

	$con = mysqli_connect($hostname, $username, $password) or die("Unable to connecto to MySQL");
        
        $selected = mysql_select_db($database, $con) or die("Could not select konto");

?>
