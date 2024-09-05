// ignore_for_file: prefer_const_constructors

import 'package:AmbulaceBooking/controller/page/admin/admin_controller.dart';
import 'package:AmbulaceBooking/core/constant/color.dart';
import 'package:AmbulaceBooking/view/widget/page/buttontxtWidget.dart';
import 'package:AmbulaceBooking/view/widget/page/iconWidget.dart';
import 'package:AmbulaceBooking/view/widget/page/imgWidget.dart';
import 'package:AmbulaceBooking/view/widget/page/textWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Userslist extends StatelessWidget {
  const Userslist({
    super.key,
    required this.width,
    required this.height,
    required this.recordlist,
    this.onTap,
    this.color,
    required this.title,
    required this.onTapblock,
    required this.titleofbotton,
  });
  final void Function()? onTap;
  final String title;
  final String titleofbotton;
  final void Function() onTapblock;

  final double width;
  final double height;
  final Color? color;
  final List recordlist;

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => AdminController());

    return GetBuilder<AdminController>(builder: (controller) {
      return ListView.builder(
        itemCount: recordlist.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: AppColor.white_2,
            child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width / 20, vertical: width / 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: height / 6,
                      child: Stack(
                        children: [
                          Positioned(
                              top: 1,
                              height: 32,
                              width: 80,
                              right: 0,
                              child: InkWell(
                                onTap: onTap,
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: color,
                                      borderRadius: BorderRadius.circular(50)),
                                  child: CustomText(
                                    str: title,
                                    color: AppColor.white,
                                    size: 15,
                                  ),
                                ),
                              )),
                          Positioned(
                            left: 2,
                            child: CustomText(
                              str:
                                  "Name:${controller.allData[index].fullname}\nPhone:${controller.allData[index].phone}\nAddress:${controller.allData[index].location}\nType:${controller.allData[index].bookingType}\nData:${controller.allData[index].dateofbook}",
                              size: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                        height: height / 6,
                        child: Images(
                            height: height,
                            width: width,
                            path: r"asset/img/1719329254389.png")),
                    SizedBox(
                      height: 40,
                    ),
                    ButtonCustomText(
                        leading: CustomIcon(
                          icon: Icons.arrow_right_alt_sharp,
                          size: width / 14,
                        ),
                        title: CustomText(
                          str: titleofbotton,
                          color: AppColor.white,
                          size: 20,
                          textAlign: TextAlign.center,
                        ),
                        padding: EdgeInsets.all(0),
                        width: width,
                        onTap: onTapblock)
                  ],
                )),
          );
        },
      );
    });
  }
}
