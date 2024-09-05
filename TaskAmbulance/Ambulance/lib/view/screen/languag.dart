import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:AmbulaceBooking/core/constant/routes.dart';
import 'package:AmbulaceBooking/core/localization/changlocal.dart';
import 'package:AmbulaceBooking/view/widget/language/custombuttonland.dart';

class Languag extends GetView<LocalControllar> {
  const Languag({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("1".tr, style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(
              height: 20,
            ),
            CustomButtonLang(
              textbutton: "Ar",
              onPressed: () {
                controller.changLang("ar");
                Get.toNamed(AppRout.homepage);
              },
            ),
            CustomButtonLang(
              textbutton: "En",
              onPressed: () {
                controller.changLang("en");
                Get.toNamed(AppRout.homepage);
              },
            ),
          ],
        ),
      ),
    );
  }
}
