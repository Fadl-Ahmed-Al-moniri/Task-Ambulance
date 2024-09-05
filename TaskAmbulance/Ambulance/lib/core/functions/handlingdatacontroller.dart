import 'package:AmbulaceBooking/core/class/ststusrequst.dart';

// دالة الاخطا التي تضهر اذا كان هناك مشاكل في اتصال الهاتف با الي بي اي
handlingData(response) {
  if (response is StatusRucust) {
    return response;
  } else {
    return StatusRucust.success;
  }
}
