
<?php
include "../../connect.php";

$booking_status = filterRequest("bookingStatus");
$user_id  = filterRequest("userid");
// $stmt=$con->prepare('SELECT * FROM `ambulance_booking` WHERE booking_status =? AND user_id=?');
$stmt=$con->prepare('SELECT ambulance_booking.*, users.full_name, users.phone FROM ambulance_booking
                    INNER JOIN users ON ambulance_booking.user_id = users.user_id WHERE
                    ambulance_booking.booking_status=? AND users.user_id =? ');

try {
    $stmt->execute(array($booking_status,$user_id));
    $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $result= $stmt->rowCount();
    if ($result<0) {
        echo json_encode(array("status" => "success", "data" => $data));
    }else
    {echo json_encode(array("status" => "success", "data" => $data));}
    } catch (PDOException $e) {
        echo json_encode(array("status" => "fail", "error" => $e->getMessage()));
}

// $stmt = $con->prepare("
//     SELECT hotel.*, IF(favorite.hotelid IS NOT NULL, 'true', 'false') AS is_favorite
//     FROM hotel 
//     LEFT JOIN favorite favorite ON hotel.hotelid = favorite.hotelid AND favorite.userid = ?
//     WHERE hotel.cityid = ?
// ");
// if($result >0)
// {
//     echo json_encode(array("status" => "success", "data" => $data));
// }
// else{
//     echo json_encode(array("status" => "fail", "data" => $data));

// }