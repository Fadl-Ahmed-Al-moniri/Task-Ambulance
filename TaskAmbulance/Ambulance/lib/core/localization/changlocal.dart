//صفحة اختيار اللغة

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:AmbulaceBooking/core/constant/appthem.dart';
import 'package:AmbulaceBooking/core/services/services.dart';

class LocalControllar extends GetxController {
  Locale? languag;

  MyServices myServices = Get.find();

  ThemeData appTheme = themeEnglish;

  changLang(String languageCode) {
    Locale locale = Locale(languageCode);
    myServices.sharedPreferences.setString("lang",
        languageCode); //اختيار اللغة وحفضها في الشارد برفرنس من ان جل حفظ الاختيار
    appTheme = languageCode == "ar" ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
    if (sharedPrefLang == "ar") {
      languag = const Locale("ar");
      appTheme = themeArabic;
    } else if (sharedPrefLang == "en") {
      languag = const Locale("en");
      appTheme = themeEnglish;
    } else {
      languag = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}
