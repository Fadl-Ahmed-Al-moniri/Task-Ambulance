import 'package:AmbulaceBooking/core/class/ststusrequst.dart';
import 'package:AmbulaceBooking/core/functions/handlingdatacontroller.dart';
import 'package:AmbulaceBooking/core/services/services.dart';
import 'package:AmbulaceBooking/data/datasource/remote/booking/booking.dart';
import 'package:AmbulaceBooking/data/model/ambulancebooking.dart';
import 'package:get/get.dart';

class RecordController extends GetxController {
  StatusRucust statusRucust = StatusRucust.initial;
  Booking bookingData = Booking(Get.find());
  MyServices myServices = Get.find();
  List<Ambulancebooking> pending = [];
  List<Ambulancebooking> completed = [];
  List<Ambulancebooking> canceled = [];

  @override
  void onInit() {
    getDataForpending('new');
    getDataForcompleted('completed');
    getDataForcanceled('canceled');
    super.onInit();
  }

  getDataForpending(bookingStatus) async {
    // pending.first.quantity
    var id = myServices.sharedPreferences.getString('userid')!;
    statusRucust = StatusRucust.loading;
    update();
    var response = await bookingData.getDataByuserIdAndbookingStatus(
        userId: id, bookingStatus: 'new');
    statusRucust = handlingData(response);
    pending.clear();
    if (response['status'] == 'success') {
      for (var element in response['data']) {
        pending.add(Ambulancebooking.fromjson(element));
      }
      statusRucust = StatusRucust.success;
      update();
    } else {
      Get.defaultDialog(title: "warning", middleText: "${response['status']}");
      statusRucust = StatusRucust.faliure;
      update();
    }
  }

  getDataForcompleted(bookingStatus) async {
    // pending.first.quantity
    var id = myServices.sharedPreferences.getString('userid')!;
    statusRucust = StatusRucust.loading;
    update();
    var response = await bookingData.getDataByuserIdAndbookingStatus(
        userId: id, bookingStatus: bookingStatus);
    statusRucust = handlingData(response);
    completed.clear();
    if (response['status'] == 'success') {
      for (var element in response['data']) {
        completed.add(Ambulancebooking.fromjson(element));
      }
      statusRucust = StatusRucust.success;
      update();
    } else {
      Get.defaultDialog(title: "warning", middleText: "${response['status']}");
      statusRucust = StatusRucust.faliure;
      update();
    }
  }

  getDataForcanceled(bookingStatus) async {
    // pending.first.quantity
    var id = myServices.sharedPreferences.getString('userid')!;
    statusRucust = StatusRucust.loading;
    update();
    var response = await bookingData.getDataByuserIdAndbookingStatus(
        userId: id, bookingStatus: bookingStatus);
    statusRucust = handlingData(response);
    canceled.clear();
    if (response['status'] == 'success') {
      for (var element in response['data']) {
        canceled.add(Ambulancebooking.fromjson(element));
      }
      statusRucust = StatusRucust.success;
      update();
    } else {
      Get.defaultDialog(title: "warning", middleText: "${response['status']}");
      statusRucust = StatusRucust.faliure;
      update();
    }
  }
}
