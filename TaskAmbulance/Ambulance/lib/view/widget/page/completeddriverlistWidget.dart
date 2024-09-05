// ignore_for_file: prefer_const_constructors

import 'package:AmbulaceBooking/controller/page/driver/homedrivre_controller.dart';
import 'package:AmbulaceBooking/core/constant/color.dart';
import 'package:AmbulaceBooking/view/widget/page/buttontxtWidget.dart';
import 'package:AmbulaceBooking/view/widget/page/iconWidget.dart';
import 'package:AmbulaceBooking/view/widget/page/imgWidget.dart';
import 'package:AmbulaceBooking/view/widget/page/textWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompletedDriverlist extends StatelessWidget {
  const CompletedDriverlist({
    super.key,
    required this.title,
    required this.width,
    required this.height,
    this.color,
  });
  final String title;
  final double width;
  final double height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomedrivreController());
    return GetBuilder<HomedrivreController>(builder: (controller) {
      return ListView.builder(
        itemCount: controller.pending.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: AppColor.white_2,
            child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width / 30, vertical: width / 10),
                child: Column(
                  children: [
                    SizedBox(
                      height: height / 6,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 2,
                            child: CustomText(
                              str:
                                  "Name:${controller.pending[index].fullname}\nPhone:${controller.pending[index].phone}\nAddress:${controller.pending[index].location}\nType:${controller.pending[index].bookingType}\nData:${controller.pending[index].dateofbook}\nQuantity:${controller.pending[index].quantity}",
                              size: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Positioned(
                              top: 7,
                              height: 32,
                              width: 100,
                              right: 0,
                              child: InkWell(
                                onTap: () {},
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
                    Row(
                      children: [
                        Expanded(
                            child: ButtonCustomText(
                                leading: CustomIcon(
                                  icon: Icons.arrow_back_rounded,
                                  size: width / 12,
                                ),
                                title: CustomText(
                                  str: "CONTINUE",
                                  color: AppColor.white,
                                  size: 15,
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                width: width,
                                onTap: () {
                                  controller.gotoLocation(
                                    location:
                                        controller.pending[index].location!,
                                    bookinId: controller
                                        .pending[index].bookinId!
                                        .toString(),
                                  );
                                })),
                        Expanded(
                            child: ButtonCustomText(
                                leading: CustomIcon(
                                  icon: Icons.arrow_back_rounded,
                                  size: width / 12,
                                ),
                                title: CustomText(
                                  str: "CANCEL",
                                  color: AppColor.white,
                                  size: 15,
                                  // textAlign: TextAlign.center,
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                width: width,
                                onTap: () {
                                  controller.setDatapending(
                                      bookingStatus: 'canceled',
                                      bookingId: controller
                                          .pending[index].bookinId
                                          .toString());
                                })),
                      ],
                    )
                  ],
                )),
          );
        },
      );
    });
  }
}
