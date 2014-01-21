<?
if(!isset($_POST['login'])){ //vis skjema
?>
    <center>
    <h1>Velkommen til innlogging</h1>
    <form action="" method="post">
        <table>
	<tr>
		<td>Brukernavn:</td>
		<td><input type="text" name="navn"></td>
	</tr>
	<tr>
		<td>Passord:</td>
		<td><input type="password" name="passord"></td>
	</tr>
        <td>
            <input type="submit" value="Logg inn" name="login">
        </td>
	</table>
    </form>
    </center>
<?
}else{
    echo "<center>"; 
    $db = new mysqli("localhost", "root", "Glittertind", "konto");
    
    $sqlsetning= "SELECT * FROM konto WHERE kontoeier = '" . $_POST["navn"] . "' ";
    $sqlsetning .= "AND passord= '" . $_POST["passord"] . "' ";
    
    echo $sqlsetning . "<p>";
    
    $resultat = $db->query($sqlsetning);
    
    $antall = $resultat->num_rows;
    if($antall >= 1){
  
        while($row = mysqli_fetch_array($resultat)){
            $kontoeier = $row["kontoeier"];
            $saldo = $row["saldo"];
        }
                
        echo "<h1>Velkommen til " . $kontoeier . " sin nettbank</h1><br>";
        echo "Din saldo er: " . $saldo;
        
    }else{
        echo "<strong>Feil brukernavn og passord</strong>";
    }
    
    $db->close();
    echo "</center>"; 
}
?>

