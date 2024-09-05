import 'package:AmbulaceBooking/view/screen/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:AmbulaceBooking/bunding/initalbunding.dart';
import 'package:AmbulaceBooking/core/localization/changlocal.dart';
import 'package:AmbulaceBooking/core/localization/transliation.dart';
import 'package:AmbulaceBooking/core/services/services.dart';
import 'package:AmbulaceBooking/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initalServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocalControllar controllar =
        Get.put(LocalControllar()); //استدعا صفحة اختيار الترجمة
    return GetMaterialApp(
      initialBinding: InitalBunding(),
      locale: controllar.languag,
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Login(),
      theme: controllar.appTheme,
      getPages: routes,
    );
  }
}
