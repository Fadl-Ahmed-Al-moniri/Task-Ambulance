import 'package:AmbulaceBooking/controller/page/driver/homedrivre_controller.dart';
import 'package:AmbulaceBooking/core/class/ststusrequst.dart';
import 'package:AmbulaceBooking/core/constant/routes.dart';
import 'package:AmbulaceBooking/core/functions/handlingdatacontroller.dart';
import 'package:AmbulaceBooking/data/model/ambulancebooking.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminController extends MainforDriver {
  int index = 0;
  TextEditingController byemail = TextEditingController();
  @override
  void onInit() {
    getallData();
    getDataForNew('NEW');
    super.onInit();
  }

  List<Ambulancebooking> allData = [];
  List<Ambulancebooking> blocklist = [];
  clickMoreItem(int index) {
    switch (index) {
      case 0:
        Get.offAndToNamed(AppRout.homeadminpage);
        update();
        break;
      case 1:
        Get.offAndToNamed(AppRout.userspage);
        update();
        break;
      case 2:
        Get.offAndToNamed(AppRout.blockedpage);
        update();
        break;
    }
  }

  logut(){
            Get.offAndToNamed(AppRout.login);

  }

  getDataForNew(bookingStatus) async {
    statusRucust = StatusRucust.loading;
    update();
    var response =
        await bookingData.getDataBybookingStatus(bookingStatus: bookingStatus);
    statusRucust = handlingData(response);
    newlist.clear();
    if (response['status'] == 'success') {
      for (var element in response['data']) {
        newlist.add(Ambulancebooking.fromjson(element));
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
      statusRucust = StatusRucust.success;
      onInit();
      update();

      update();
    } else {
      Get.defaultDialog(title: "warning", middleText: "${response['status']}");
      statusRucust = StatusRucust.faliure;
      update();
    }
  }

  getallData() async {
    statusRucust = StatusRucust.loading;
    update();
    var response = await bookingData.getallData();
    statusRucust = handlingData(response);
    allData.clear();
    if (response['status'] == 'success') {
      for (var element in response['data']) {
        allData.add(Ambulancebooking.fromjson(element));
      }
      statusRucust = StatusRucust.success;
      update();
    } else {
      Get.defaultDialog(title: "warning", middleText: "${response['status']}");
      statusRucust = StatusRucust.faliure;
      update();
    }
  }

  getDatabyEmail({
    required String email,
  }) async {
    statusRucust = StatusRucust.loading;
    update();
    var response = await bookingData.getallDataByemail(
      email: email,
    );
    statusRucust = handlingData(response);
    allData.clear();
    if (response['status'] == 'success') {
      for (var element in response['data']) {
        allData.add(Ambulancebooking.fromjson(element));
      }
      statusRucust = StatusRucust.success;
      update();
      update();
    } else {
      Get.defaultDialog(title: "warning", middleText: "${response['status']}");
      statusRucust = StatusRucust.faliure;
      update();
    }
  }
}
