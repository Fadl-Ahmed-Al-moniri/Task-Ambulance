// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'dart:io';

import 'package:AmbulaceBooking/controller/page/user/profile_controller.dart';
import 'package:AmbulaceBooking/core/class/ststusrequst.dart';
import 'package:AmbulaceBooking/core/constant/color.dart';
import 'package:AmbulaceBooking/core/constant/imageasset.dart';
import 'package:AmbulaceBooking/linkapi.dart';
import 'package:AmbulaceBooking/view/widget/page/buttontxtWidget.dart';
import 'package:AmbulaceBooking/view/widget/page/iconWidget.dart';
import 'package:AmbulaceBooking/view/widget/page/imgWidget.dart';
import 'package:AmbulaceBooking/view/widget/page/textWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  Profile({
    super.key,
  });
  ProfileController controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ProfileController());
    double height = MediaQuery.of(context)
        .size
        .height; //this the height of screen that ues the app
    double width = MediaQuery.of(context)
        .size
        .width; //this the width of screen that ues the app
    return GetBuilder<ProfileController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: CustomIcon(
              icon: Icons.arrow_back_sharp,
              color: AppColor.black,
              size: width / 12,
            ),
          ),
        ),
        body: controller.statusRucust == StatusRucust.loading
            ? Center(
                child: CircularProgressIndicator(
                color: AppColor.red_1,
              ))
            : SafeArea(
                child: Center(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: width / 20),
                    child: Column(
                      children: [
                        Container(
                          width: width / 1,
                          height: height / 6,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.pink,
                          ),
                          child: CustomIcon(
                            icon: Icons.person,
                            size: width / 5,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: width / 20,
                          ),
                          child: CustomText(
                            str: controller.userdata.first.fullName!,
                            size: 32,
                          ),
                        ),
                        CustomText(
                          str: controller.userdata.first.cnicnumber!,
                          size: 18,
                          fontWeight: FontWeight.w400,
                        ),
                        CustomText(
                          str: controller.userdata.first.phone!,
                          size: 18,
                          fontWeight: FontWeight.w400,
                        ),
                        CustomText(
                          str: controller.userdata.first.email!,
                          size: 18,
                          fontWeight: FontWeight.w400,
                        ),
                        CustomText(
                          str: controller.userdata.first.address!,
                          size: 18,
                          fontWeight: FontWeight.w400,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: height / 20,
                          ),
                          child: CustomText(
                            str: "YOUR CNIC",
                            size: 32,
                          ),
                        ),
                        // controller.userdata.first.cnicImage != null
                        //     ? Container(
                        //         // padding: EdgeInsets.symmetric(vertical: height / 50),
                        //         height: height / 2.7,
                        //         child: Image.file(
                        //           File(
                        //               "${AppLink.imgCNIC}${controller.userdata.first.cnicImage!}"),
                        //           fit: BoxFit.contain,
                        //         ),
                        //       )
                        //     :
                        Container(
                            // height: height / 6,
                            child: Images(
                                height: height,
                                width: width,
                                path: AppImageAsset.cardFack)),
                        SizedBox(
                          height: height / 20,
                        ),
                        ButtonCustomText(
                          title: CustomText(
                            str: "LOGOUT",
                            color: AppColor.white,
                            size: 26,
                            textAlign: TextAlign.center,
                          ),
                          width: width,
                          onTap: () {
                            controller.logout();
                          },
                          leading: CustomIcon(
                            icon: Icons.logout,
                            size: width / 12,
                          ),
                          padding: EdgeInsets.all(0),
                        ),
                        SizedBox(
                          height: height / 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      );
    });
  }
}
