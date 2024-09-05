
<?php
include "../../connect.php";

$booking_status=filterRequest('bookingStatus');
$stmt=$con->prepare('SELECT ambulance_booking.*, users.full_name, users.phone FROM ambulance_booking
                    INNER JOIN users ON ambulance_booking.user_id = users.user_id WHERE ambulance_booking.booking_status=?  ');

try {
    $stmt->execute(array($booking_status));
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