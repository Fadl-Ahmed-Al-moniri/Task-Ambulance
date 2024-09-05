<?php
include "../../connect.php";
$booking_type=filterRequest("bookingType"); 
$quantity=filterRequest("quantity"); 
// $status_image=filterRequest("statusImage");
// $status_image=filterRequest("statusImage","../"); 
$location=filterRequest("location"); 
$user_id=filterRequest("userid");
$dateofbook=filterRequest("dateofbooking");
$booking_status=filterRequest("bookingstatus");
$status_image=filterRequest("image"); 
if(isset($_FILES["image"]))
{
    if ($status_image=!"") {
    deleteFile('../img/imgStatus',$status_image);
    $status_image=imageUpload("image",'');
    }
}
    $stmt=$con->prepare("
    INSERT INTO `ambulance_booking`(`booking_type`, `quantity`, `status_image`,`location`,`user_id`,`dateofbook`,`booking_status`) VALUES 
    (?,?,?,?,?,?,?)
    ");
    try {
    $stmt->execute(array($booking_type,$quantity,$status_image,$location,$user_id,$dateofbook,$booking_status));
    $result= $stmt->rowCount();
    echo json_encode(array("status" => "success"));
} catch (PDOException $e) {
    echo json_encode(array("status" => "fail", "error" => $e->getMessage()));
}
?>