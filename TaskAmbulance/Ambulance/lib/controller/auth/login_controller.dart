import 'package:AmbulaceBooking/core/class/crud.dart';
import 'package:AmbulaceBooking/core/class/ststusrequst.dart';
import 'package:AmbulaceBooking/core/constant/routes.dart';
import 'package:AmbulaceBooking/core/functions/handlingdatacontroller.dart';
import 'package:AmbulaceBooking/core/services/services.dart';
import 'package:AmbulaceBooking/data/datasource/remote/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final formstateforlogin = GlobalKey<FormState>();
  Crud crud = Get.put(Crud());
  late TextEditingController username;
  late TextEditingController password;
  bool isshowpassword = true;
  StatusRucust? statusRucust;
  LoginData loginData = LoginData(Get.find());
  MyServices myServices = Get.find();

  @override
  void onInit() {
    username = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();

    password.dispose();
    super.dispose();
  }

  showpassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  login() async {
    print("object");
    if (formstateforlogin.currentState!.validate()) {
      statusRucust = StatusRucust.loading;
      update(); // تأكد من تحديث الحالة هنا
      var response = await loginData.postData(
        username.text,
        password.text,
      );
      print("==================================== controller $response");
      statusRucust = handlingData(response);
      if (statusRucust == StatusRucust.success) {
        if (response['status'] == 'success') {
          if (response["data"]["role"] == 'admin' &&
              response["data"]['email'] == 'admin') {
            Get.offAndToNamed(AppRout.homeadminpage);
          } else if (response["data"]["role"] == 'driver' &&
              response["data"]['email'] == 'driver') {
            Get.offAndToNamed(AppRout.homedriverpage);
          } else {
            myServices.sharedPreferences
                .setString('userid', "${response["data"]["user_id"]}");
            Get.snackbar("message", 'Wellcome ${username.text}');
            Get.offAndToNamed(AppRout.homepage);
          }
        } else {
          Get.defaultDialog(
              title: "warning", middleText: "Phone or email existing");
          statusRucust = StatusRucust.faliure;
        }
      }
      update();
    }
  }

  goToSignup() {
    Get.offAndToNamed(AppRout.signup);
  }
}
