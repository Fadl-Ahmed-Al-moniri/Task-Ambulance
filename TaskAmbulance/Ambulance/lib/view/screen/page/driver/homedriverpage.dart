// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:AmbulaceBooking/controller/page/driver/homedrivre_controller.dart';
import 'package:AmbulaceBooking/core/constant/color.dart';
import 'package:AmbulaceBooking/core/constant/imageasset.dart';
import 'package:AmbulaceBooking/view/widget/page/completeddriverlistWidget.dart';
import 'package:AmbulaceBooking/view/widget/page/driverpendinglistWidget.dart';
import 'package:AmbulaceBooking/view/widget/page/iconWidget.dart';
import 'package:AmbulaceBooking/view/widget/page/imgWidget.dart';
import 'package:AmbulaceBooking/view/widget/page/textWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homedriver extends StatelessWidget {
  const Homedriver({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomedrivreController());

    double height = MediaQuery.of(context)
        .size
        .height; //this the height of screen that ues the app
    double width = MediaQuery.of(context)
        .size
        .width; //this the width of screen that ues the app
    return GetBuilder<HomedrivreController>(builder: (controller) {
      return Scaffold(
          appBar: AppBar(
            bottom: PreferredSize(
                preferredSize: Size(width / 8, height / 11),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width / 15),
                      child: CustomText(
                        str: "DRIVER",
                        size: 32,
                      ),
                    ),
                    Images(
                        height: 254.32, width: 267, path: AppImageAsset.logo),
                  ],
                )),
          ),
          body: ListView(
              padding: EdgeInsets.symmetric(horizontal: width / 15),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      str: "PENDING",
                      size: 28,
                    ),
                    InkWell(
                      onTap: () => controller.getDataForpending("pending"),
                      child: CustomIcon(
                        icon: Icons.refresh,
                        color: AppColor.black,
                        size: width / 10,
                      ),
                    ),
                    InkWell(
                      onTap: () => controller.logout(),
                      child: CustomIcon(
                        icon: Icons.logout_sharp,
                        color: AppColor.black,
                        size: width / 10,
                      ),
                    ),
                  ],
                ),
                controller.pending.isEmpty
                    ? Divider(
                        thickness: 5,
                        color: AppColor.grey,
                      )
                    : Column(
                        children: [
                          Container(
                            height: height / 1.82,
                            child: CompletedDriverlist(
                              width: width,
                              height: height,
                              title: "PENDING",
                              color: AppColor.yellow,
                            ),
                          ),
                          Divider(
                            thickness: 5,
                            color: AppColor.grey,
                          ),
                        ],
                      ),
                SizedBox(
                  height: height / 40,
                ),
                CustomText(
                  str: "COMPLETED",
                  size: 28,
                ),
                controller.completed.isEmpty
                    ? Divider(
                        thickness: 5,
                        color: AppColor.grey,
                      )
                    : Column(
                        children: [
                          Container(
                            height: height / 4,
                            child: PendingDriverlist(
                              width: width,
                              height: height,
                              recordlist: controller.completed,
                              title: "COMPLETED",
                              color: AppColor.green,
                              onTap: () {},
                            ),
                          ),
                          Divider(
                            thickness: 5,
                            color: AppColor.grey,
                          ),
                        ],
                      ),
                SizedBox(
                  height: height / 40,
                ),
                CustomText(
                  str: "CANCELED",
                  size: 28,
                ),
                controller.canceled.isEmpty
                    ? Divider(
                        thickness: 5,
                        color: AppColor.grey,
                      )
                    : Column(
                        children: [
                          Container(
                            height: height / 4,
                            child: PendingDriverlist(
                              width: width,
                              height: height,
                              recordlist: controller.canceled,
                              title: "CANCELED",
                              color: AppColor.red_1,
                              onTap: () {},
                            ),
                          ),
                          Divider(
                            thickness: 5,
                            color: AppColor.grey,
                          ),
                        ],
                      ),
              ]));
    });
  }
}
