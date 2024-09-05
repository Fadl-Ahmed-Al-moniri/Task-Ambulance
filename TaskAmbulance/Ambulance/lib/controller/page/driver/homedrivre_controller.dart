import 'package:AmbulaceBooking/core/class/ststusrequst.dart';
import 'package:AmbulaceBooking/core/constant/routes.dart';
import 'package:AmbulaceBooking/core/functions/handlingdatacontroller.dart';
import 'package:AmbulaceBooking/core/services/services.dart';
import 'package:AmbulaceBooking/data/datasource/remote/booking/booking.dart';
import 'package:AmbulaceBooking/data/model/ambulancebooking.dart';
import 'package:get/get.dart';

class MainforDriver extends GetxController {
  List<Ambulancebooking> pending = [];
  List<Ambulancebooking> completed = [];
  List<Ambulancebooking> canceled = [];
  List<Ambulancebooking> newlist = [];
  Booking bookingData = Booking(Get.find());
  StatusRucust statusRucust = StatusRucust.initial;

}

class HomedrivreController extends MainforDriver {
  // Booking bookingData = Booking(Get.find());
  MyServices myServices = Get.find();
  

  @override
  void onInit() {
    getDataForpending('pending');
    getDataForcompleted('completed');
    getDataForcanceled('canceled');
    super.onInit();
  }

  logout() {
    Get.offAndToNamed(AppRout.login);
  }

  gotoLocation({required String location, required String bookinId}) {
    Get.toNamed(AppRout.drivrecase, arguments: {
      'location': location,
      'bookinId': bookinId,
    });
    print(bookinId);
  }

  getDataForpending(bookingStatus) async {
    statusRucust = StatusRucust.loading;
    update();
    var response =
        await bookingData.getDataBybookingStatus(bookingStatus: bookingStatus);
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
    statusRucust = StatusRucust.loading;
    update();
    var response =
        await bookingData.getDataBybookingStatus(bookingStatus: bookingStatus);
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
    statusRucust = StatusRucust.loading;
    update();
    var response =
        await bookingData.getDataBybookingStatus(bookingStatus: bookingStatus);
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


  setDatapending(
      {required String bookingStatus, required String bookingId}) async {
    statusRucust = StatusRucust.loading;
    update();
    var response = await bookingData.setDataByDriver(
        bookingStatus: bookingStatus, bookingId: bookingId);
    statusRucust = handlingData(response);
    pending.clear();
    completed.clear();
    canceled.clear();
    if (response['status'] == 'success') {
      getDataForcompleted('completed');
      getDataForcanceled('canceled');
      getDataForpending('pending');
      statusRucust = StatusRucust.success;
      update();
    } else {
      Get.defaultDialog(title: "warning", middleText: "${response['status']}");
      statusRucust = StatusRucust.faliure;
      update();
    }
  }
}
