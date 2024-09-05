<?php
include '../connect.php';
$email=filterRequest("email");
$cnic_number=filterRequest("CNICnumber"); 
$full_name=filterRequest("fullname"); 
$phone=filterRequest("phone"); 
$password=filterRequest("password");
$address=filterRequest("address");
$city_address=filterRequest("city_address");
$cnic_image=filterRequest("CNICimage");
$isSign=$con->prepare(
    "SELECT * from users where email=?"
);
$isSign->execute(array($email));

$count=$isSign->rowCount();

if($count>0)
{
 echo json_encode(array("status"=>"هذا المستخدم موجود"));
}

else{

    if(isset($_FILES["CNICimage"]))
{
    if ($cnic_image=!"") {
    deleteFile('../img',$CNICimage);
    $status_image=imageUpload("CNICimage",'');
    }
}
    $stmt=$con->prepare("
    INSERT INTO `users`(`email`, `cnic_number`, `full_name`,`phone`,`password`,`address`,`city_address`,`cnic_image`)
     VALUES 
     (?,?,?,?,?,?,?,?)
     ");
     $stmt->execute(array($email,$cnic_number,$full_name,$phone,$password,$address,$city_address,$cnic_image));
     $result= $stmt->rowCount();
        if($result> 0)
        {
            echo json_encode(array("status"=>"success"));
        }
        else
        {
            echo json_encode(array("status"=>"fail"));
        }
}

?>


