<?php
function connect_db(){
$val = 1; 
if($val==0){
$servername = "localhost";
$username = "root";
$password = "";
 $dbname = "chat";}
 if($val==1){
    $servername = "localhost";
   $username = "hoftnzmy_deevloo";
   $password = "waleed11";
   $dbname = "hoftnzmy_project_waleed";
 }

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    // echo "hello";
  die("Connection failed: " . $conn->connect_error);
}
// echo "Connected successfully";
return $conn;
}
?>