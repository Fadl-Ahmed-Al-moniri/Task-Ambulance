// ignore_for_file: prefer_const_constructors

import 'package:AmbulaceBooking/controller/page/driver/homedrivre_controller.dart';
import 'package:AmbulaceBooking/core/class/ststusrequst.dart';
import 'package:AmbulaceBooking/core/constant/routes.dart';
import 'package:AmbulaceBooking/core/functions/handlingdatacontroller.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DrivrecaseController extends MainforDriver {
  late List<String> location;
  late String bookinId;
  List<Marker> markers = [];

  @override
  void onInit() {
    bookinId = Get.arguments['bookinId'];
    location =
        Get.arguments['location'].replaceAll(RegExp(r'\[|\]'), '').split(',');
    addTomarkers(double.tryParse(location[0])!, double.tryParse(location[1])!);
    kGooglePlex = CameraPosition(
      target:
          LatLng(double.tryParse(location[0])!, double.tryParse(location[1])!),
      zoom: 16,
    );

    
    super.onInit();
  }

  // @override
  // void dispose() {
  //   bookinId;
  //   pending.clear();
  //   canceled.clear();
  //   completed.clear();
  //   super.dispose();
  // }

  late CameraPosition kGooglePlex;

  addTomarkers(double latitude, double longitude) {
    markers.add(Marker(
        markerId: MarkerId(
          '1',
        ),
        position: LatLng(latitude, longitude)));
    update();
  }

  confirm() {}

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
      update();
      Get.offAndToNamed(
        AppRout.homedriverpage,
      );
      update();
    } else {
      Get.defaultDialog(title: "warning", middleText: "${response['status']}");
      statusRucust = StatusRucust.faliure;
      update();
    }
  }

  goBack() {
    Get.back();
  }
}
