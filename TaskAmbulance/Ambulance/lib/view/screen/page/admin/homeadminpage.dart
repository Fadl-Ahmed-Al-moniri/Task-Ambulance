// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, must_be_immutable

import 'package:AmbulaceBooking/controller/page/admin/admin_controller.dart';
import 'package:AmbulaceBooking/core/constant/color.dart';
import 'package:AmbulaceBooking/core/constant/imageasset.dart';
import 'package:AmbulaceBooking/view/widget/page/customAppbar.dart';

import 'package:AmbulaceBooking/view/widget/page/iconWidget.dart';
import 'package:AmbulaceBooking/view/widget/page/imgWidget.dart';
import 'package:AmbulaceBooking/view/widget/page/itemofnewWidget.dart';
import 'package:AmbulaceBooking/view/widget/page/textWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAdmin extends StatelessWidget {
  HomeAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => AdminController());
    double height = MediaQuery.of(context)
        .size
        .height; //this the height of screen that ues the app
    double width = MediaQuery.of(context)
        .size
        .width; //this the width of screen that ues the app

    return GetBuilder<AdminController>(builder: (controller) {
      return Scaffold(
        appBar: customAppbarAdmin(width, height),
        body: Padding(
            padding: EdgeInsets.all(width / 20), child: NewDriverlist()),
        bottomNavigationBar: CustomNavigationBar(
          index: 0,
        ),
      );
    });
  }
}

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminController>(builder: (controller) {
      return BottomNavigationBar(
          selectedItemColor: AppColor.black,
          unselectedItemColor: AppColor.black,
          unselectedLabelStyle: TextStyle(
            color: AppColor.black,
            fontWeight: FontWeight.w400,
            fontFamily: "Inter",
          ),
          onTap: (value) {
            controller.index = index;
            controller.clickMoreItem(value);
            controller.update();
          },
          currentIndex: index,
          items: [
            BottomNavigationBarItem(
                icon: CustomIcon(
                  icon: Icons.home,
                  color: AppColor.red_1,
                  size: 30,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: CustomIcon(
                  icon: Icons.person,
                  color: AppColor.red_1,
                  size: 30,
                ),
                label: "Users"),
            BottomNavigationBarItem(
                icon: CustomIcon(
                  icon: Icons.block,
                  color: AppColor.red_1,
                  size: 30,
                ),
                label: "Bloked"),
          ]);
    });
  }
}
