// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:AmbulaceBooking/core/class/crud.dart';
import 'package:AmbulaceBooking/core/class/ststusrequst.dart';
import 'package:AmbulaceBooking/core/constant/routes.dart';
import 'package:AmbulaceBooking/core/functions/handlingdatacontroller.dart';
import 'package:AmbulaceBooking/data/datasource/remote/auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class SingupController extends GetxController {
  StatusRucust? statusRucust;
  Crud crud = Get.put(Crud());
  SignupData signupData = SignupData(Get.find());
  GlobalKey<FormState> formstateforSingup = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController cnic;
  late TextEditingController fullname;
  late TextEditingController phonenumber;
  late TextEditingController password;
  late TextEditingController address;
  late TextEditingController districts;
  File? imagefiles;
  bool isshowpassword = true;

  @override
  void onInit() {
    email = TextEditingController();
    cnic = TextEditingController();
    fullname = TextEditingController();
    phonenumber = TextEditingController();
    password = TextEditingController();
    address = TextEditingController();
    districts = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    cnic.dispose();
    fullname.dispose();
    phonenumber.dispose();
    password.dispose();
    address.dispose();
    districts.dispose();
    super.dispose();
  }

  showpassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  signup() async {
    if (formstateforSingup.currentState!.validate()) {
      statusRucust = StatusRucust.loading;
      update(); // تأكد من تحديث الحالة هنا
      var response = await signupData.postData(
          email.text,
          cnic.text,
          fullname.text,
          phonenumber.text,
          password.text,
          address.text,
          districts.text,
          imagefiles!);
      print("==================================== controller $response");
      statusRucust = handlingData(response);
      if (statusRucust == StatusRucust.success) {
        if (response['status'] == 'success') {
          Get.offNamed(AppRout.login);
          statusRucust = StatusRucust.success;
          update();
        } else {
          Get.defaultDialog(
              title: "warning", middleText: "Phone or email existing");
          statusRucust = StatusRucust.faliure;
          update();
        }
      }
      update(); // تأكد من تحديث الحالة هنا
    } else {}
  }

  goToLogin() {
    Get.offAllNamed(AppRout.login);
  }

  Future getimageformCamera() async {
    statusRucust = StatusRucust.loading;
    update();
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? photocamara =
          await picker.pickImage(source: ImageSource.camera);
      imagefiles = File(photocamara!.path);
      basename(photocamara.path);
      statusRucust = StatusRucust.success;
    } catch (e) {
      Get.defaultDialog(title: "warning", middleText: "$e");
      statusRucust = StatusRucust.faliure;
      update();
    }
  }

  Future getimageformPhotogallery() async {
    statusRucust = StatusRucust.loading;
    update();
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? photocamara =
          await picker.pickImage(source: ImageSource.gallery);
      imagefiles = File(photocamara!.path);
      basename(photocamara.path);
      statusRucust = StatusRucust.success;
    } catch (e) {
      Get.defaultDialog(title: "warning", middleText: "$e");
      statusRucust = StatusRucust.faliure;
      update();
    }
  }
}

// Future<Map<String, dynamic>> getCountriesBySubRegion() async {
//   const String apiKey = 'YOUR_API_KEY'; // Replace with your actual API key
//   const String url =
//       'https://countrystats-api.p.rapidapi.com/getCountriesBySubRegion?sub_region=Western%20Europe';

//   final headers = {
//     'x-rapidapi-key': apiKey,
//     'x-rapidapi-host': 'countrystats-api.p.rapidapi.com',
//   };

//   final response = await http.get(Uri.parse(url), headers: headers);

//   if (response.statusCode == 200) {
//     return jsonDecode(response.body) as Map<String, dynamic>;
//   } else {
//     throw Exception('Failed to get countries: ${response.statusCode}');
//   }

