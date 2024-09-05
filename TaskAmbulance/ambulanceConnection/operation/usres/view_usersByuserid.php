<?php
include "../../connect.php";

$user_id  = filterRequest("userid");

    $stmt=$con->prepare("SELECT * from users where user_id=? ");
    $stmt->execute(array($user_id));
    $data=$stmt->fetchAll(PDO::FETCH_ASSOC);
    $result= $stmt->rowCount(); 
       if($result> 0)
       {
           echo json_encode(array("status"=>"success","data"=>$data));
       }
       else
       {
           echo json_encode(array("status"=>"fail"));
       }


    ?>
    
 

