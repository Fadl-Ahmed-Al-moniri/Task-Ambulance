<?php
include "../connect.php";
$email=filterRequest("email"); 
$password=filterRequest("password"); 
$stmt=$con->prepare("SELECT * from users where `email` =? And `password`=?");
try {
    $stmt->execute(array($email,$password));
    $data=$stmt->fetch(PDO::FETCH_ASSOC);
    $result= $stmt->rowCount();
    if ($result<0) {
        echo json_encode(array("status" => "success", "data" => $data));
    }
    else
        {echo json_encode(array("status" => "success", "data" => $data));}
} 
catch (PDOException $e) {
        echo json_encode(array("status" => "fail", "error" => $e->getMessage()));
}

?>


