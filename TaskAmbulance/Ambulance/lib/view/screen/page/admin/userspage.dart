// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:AmbulaceBooking/controller/page/admin/admin_controller.dart';
import 'package:AmbulaceBooking/core/constant/color.dart';
import 'package:AmbulaceBooking/view/screen/page/admin/homeadminpage.dart';
import 'package:AmbulaceBooking/view/widget/page/customAppbar.dart';
import 'package:AmbulaceBooking/view/widget/page/iconWidget.dart';
import 'package:AmbulaceBooking/view/widget/page/txtfieldWidget.dart';
import 'package:AmbulaceBooking/view/widget/page/userslistWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => AdminController());

    double height = MediaQuery.of(context)
        .size
        .height; //this the height of screen that ues the app
    double width = MediaQuery.of(context).size.width;

    //this the width of screen that ues the app
    return GetBuilder<AdminController>(builder: (controller) {
      return Scaffold(
        appBar: customAppbarAdmin(width, height),
        body: ListView(
          children: [
            Container(
              width: width,
              height: height / 10,
              child: CustomTextField(
                icon: CustomIcon(
                  icon: Icons.search,
                ),
                onSaved: () => controller.getDatabyEmail(email: controller.byemail.text),
                width: width,
                hintText: 'Search by email',
                controller: controller.byemail,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: width / 16, vertical: width / 60),
              width: width,
              height: height,
              child: Userslist(
                width: width,
                height: height,
                recordlist: controller.allData,
                onTap: () {},
                title: "Active",
                color: AppColor.green,
                titleofbotton: "BlOCK",
                onTapblock: () {},
              ),
            )
          ],
        ),
        bottomNavigationBar: const CustomNavigationBar(
          index: 1,
        ),
      );
    });
  }
}
