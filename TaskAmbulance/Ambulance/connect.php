<?php


$dsn="mysql:host=localhost;dbname=ambulance";
$user="root";
$password="";
// $option=array(
    
//     // PDO::MYSQL_ATTR_INIT_COMAND=>'SET NAMES UTF8'
// );
try{
    include "functions.php";
    $con=new PDO($dsn,$user,$password);
    $con->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
}
catch(PDOException $e){
echo $e->getMessage();
}
?>