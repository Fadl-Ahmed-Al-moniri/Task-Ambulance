// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:io';
import 'package:AmbulaceBooking/core/class/crud.dart';
import 'package:AmbulaceBooking/core/class/ststusrequst.dart';
import 'package:AmbulaceBooking/core/constant/routes.dart';
import 'package:AmbulaceBooking/core/functions/handlingdatacontroller.dart';
import 'package:AmbulaceBooking/core/services/services.dart';
import 'package:AmbulaceBooking/data/datasource/remote/booking/booking.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class BookcaseController extends GetxController {
  late String bookingType;
  String? bookingStatus;
  String? quantity;
  String? statusImage;
  LatLng? location;
  String? dateofbook;
  bool isselectedMinor = false;
  File? imagefiles;
  bool isselectedMajor = false;
  double? latitude;
  double? longitude;
  StatusRucust statusRucust = StatusRucust.initial;
  Booking bookingData = Booking(
    Get.find(),
  );
  Crud crud = Get.put(Crud());
  MyServices myServices = Get.find();

  final Completer<GoogleMapController> contr = Completer<GoogleMapController>();
  List<Marker> markers = [];
  @override
  void onInit() {
    bookingType = Get.arguments['bookingType'];
    markers.clear();
    // userId = Get.arguments['userId'];
    super.onInit();
  }

  @override
  void dispose() async {
    await imagefiles == null;
    update();
    super.dispose();
  }

  addTomarkers(LatLng newlatlng) {
    markers.add(Marker(
        markerId: MarkerId(
          '1',
        ),
        position: newlatlng));
    latitude = newlatlng.latitude;
    longitude = newlatlng.longitude;
    update();
  }

  CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(15.361284, 44.211571),
    zoom: 13,
  );

  void selectMinor(bool value) {
    isselectedMinor == true
        ? {isselectedMinor = false, isselectedMajor = value, update()}
        : {isselectedMajor = value, update()};
    quantity = "Major";
    update();
  }

  void selectMajor(bool value) {
    isselectedMajor == true
        ? {isselectedMajor = false, isselectedMinor = value, update()}
        : {isselectedMinor = value, update()};
    quantity = "Minor";
  }

  confirem() async {
    statusRucust = StatusRucust.loading;
    update();
    print("object");

    var id = myServices.sharedPreferences.getString('userid');
    print(id!);

    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);

    var response = await bookingData.postData(
      bookingType: bookingType,
      quantity: quantity!,
      location: "$latitude,$longitude",
      bookingStatus: 'new',
      userId: id,
      dateofbook: formattedDate,
      statusImage: imagefiles!,
    );
    print("==================================== controller $response");
    statusRucust = handlingData(response);

    if (statusRucust == StatusRucust.success) {
      if (response['status'] == 'success') {
        Get.offAndToNamed(AppRout.homepage);
        statusRucust = StatusRucust.success;
        update();
      } else {
        Get.defaultDialog(
            title: "warning", middleText: "Phone or email existing");
        statusRucust = StatusRucust.faliure;
        update();
      }
    }
  }

  canacl() {
    Get.back();
  }

  Future getimageformcamera() async {
    statusRucust = StatusRucust.loading;
    update();
    final ImagePicker picker = ImagePicker();
    final XFile? photocamara =
        await picker.pickImage(source: ImageSource.camera);
    imagefiles = File(photocamara!.path);
    statusRucust = StatusRucust.success;
    update();
  }
}
