import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:AmbulaceBooking/core/constant/routes.dart';
import 'package:AmbulaceBooking/core/services/services.dart';

class MymiDllWare extends GetMiddleware {
  @override
  int? get priority => 1;
  MyServices myServices = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString("onboarding") == "1") {
      return const RouteSettings(name: AppRout.homepage);
    }
    return null;
  }
}
