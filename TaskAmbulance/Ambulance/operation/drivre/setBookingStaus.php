<?php
include "../../connect.php";

$booking_status=filterRequest('bookingStatus');
$booking_id=filterRequest('bookingId');

$stmt=$con->prepare('UPDATE ambulance_booking SET booking_status = ? WHERE booking_id =?');


try {
    $stmt->execute(array($booking_status,$booking_id));
    $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $result= $stmt->rowCount();
    if ($result<0) {
        echo json_encode(array("status" => "success", "data" => $data));
    }
    else
        {echo json_encode(array("status" => "success", "data" => $data));}
    } catch (PDOException $e) {
        echo json_encode(array("status" => "fail", "error" => $e->getMessage()));
}