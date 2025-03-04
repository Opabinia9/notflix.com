<?php
$db_server = "localhost";
$db_user = "Notflix";
$db_pass = "TgbzP4xPHw";
$db_name = "NotflixDB";
$conn = "";
try{
  $conn = mysqli_connect($db_server, $db_user, $db_pass, $db_name);
} catch (mysqli_sql_exception $e) {
  echo "Could not connect: " . $e->getMessage();
}
 ?>
