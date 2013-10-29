<html>
<body>
<center>
	<h1>Velkommen til din bank</h1><br><br>
<?php
    	$username = "root";
    	$password = "Glittertind";
    	$hostname = "localhost";

	$con = mysql_connect($hostname, $username, $password) or die("Unable to connecto to MySQL");
   	$selected = mysql_select_db("konto", $con) or die("Could not select konto");
   	$query = mysql_query("Select * FROM konto"); 
        echo "kake";
?>

</center>
</body>
</html>
