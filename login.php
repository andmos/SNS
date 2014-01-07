<!DOCTYPE html>
<html>
<head>
</head>
<body>
<center> 
        
<?php
        $username = "root";
    	$password = "Glittertind";
    	$hostname = "localhost";
        $loginUsername = $_POST["loginUsername"];

	$con = mysql_connect($hostname, $username, $password) or die("Unable to connecto to MySQL");
	$selected = mysql_select_db("konto", $con) or die("Could not select konto");
   
        /**
	$result = mysql_query("SELECT * FROM konto", $con);
	while($row = mysql_fetch_array($result)){
		echo $row['kontoeier'] . " " . $row['passord'];
		echo "<br>";
	}
        
         * 
         */
        
        //Denne fungerer no (simpel), utan feilmelding.
        $result = mysql_query("SELECT kontoeier, passord FROM konto", $con);
        while($row = mysql_fetch_array($result)){
            if($row['kontoeier'] == $loginUsername){
                if($row['passord'] == $_POST["loginPassword"]){
                    header("Location: http://localhost:8080/bank.php");
                }
            }
        }
        
        function hentUsername(){
            return $loginUsername;
        }
        
        function hentSaldo(){
            $result2 = mysql_query("SELECT saldo FROM konto WHERE kontoeier = '" . $loginUsername . "'", $con);
            while($row = mysql_fetch_array($result2)){
                if($row['saldo'] != null){
                    return $result2;
                }
            }
        }
        
        
        
?>

</center>
</body>
</html>
