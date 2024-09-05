// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:AmbulaceBooking/controller/page/admin/admin_controller.dart';
import 'package:AmbulaceBooking/core/constant/color.dart';
import 'package:AmbulaceBooking/core/constant/imageasset.dart';
import 'package:AmbulaceBooking/linkapi.dart';
import 'package:AmbulaceBooking/view/widget/page/buttontxtWidget.dart';
import 'package:AmbulaceBooking/view/widget/page/iconWidget.dart';
import 'package:AmbulaceBooking/view/widget/page/imgWidget.dart';
import 'package:AmbulaceBooking/view/widget/page/textWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewDriverlist extends StatelessWidget {
  const NewDriverlist({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context)
        .size
        .height; //this the height of screen that ues the app
    double width = MediaQuery.of(context)
        .size
        .width; //this the width of screen that ues the app
    Get.lazyPut(
      () => AdminController(),
    );
    return GetBuilder<AdminController>(builder: (controller) {
      return ListView(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              str: "NEW",
              size: 28,
            ),
            InkWell(
              onTap: () {
                controller.logut();
              },
              child: CustomIcon(
                icon: Icons.logout_sharp,
                color: AppColor.black,
                size: width / 10,
              ),
            )
          ],
        ),
        Container(
          height: height / 1.5,
          child: ListView.builder(
            itemCount: controller.newlist.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                color: AppColor.white_2,
                child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width / 30, vertical: width / 10),
                    child: Column(
                      children: [
                        SizedBox(
                          height: height / 4,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 2,
                                child: CustomText(
                                  str:
                                      "Name:${controller.newlist[index].fullname}\nPhone:${controller.newlist[index].phone}\nAddress:${controller.newlist[index].location}\nType:${controller.newlist[index].bookingType}\nData:${controller.newlist[index].dateofbook}",
                                  size: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Positioned(
                                  top: 7,
                                  height: 32,
                                  width: 80,
                                  right: 0,
                                  child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: AppColor.yellow,
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: CustomText(
                                        str: "NEW",
                                        color: AppColor.white,
                                        size: 15,
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(
                            height: height / 8,
                            child: CircleAvatar(
                              radius: 28,
                              onBackgroundImageError: (exception, stackTrace) {
                                CircularProgressIndicator(
                                  color: AppColor.red_1,
                                );
                              },
                              onForegroundImageError: (exception, stackTrace) {
                                Icon(Icons.error);
                              },
                              backgroundImage:
                                  AssetImage(AppImageAsset.cardFack),
                              foregroundImage: NetworkImage(
                                "${AppLink.imgStatus}${controller.newlist[index].statusImage}",
                              ),
                            )),

                        // child: Images(
                        //     height: height,
                        //     width: width,
                        //     path: r"asset/img/1719329254389.png")

                        SizedBox(
                          height: 40,
                        ),
                        SizedBox(
                            height: height / 8,
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
                                      icon: Icons.arrow_right_alt_sharp,
                                      size: width / 15,
                                    ),
                                    title: CustomText(
                                      str: "CONTINUE",
                                      color: AppColor.white,
                                      size: 15,
                                      textAlign: TextAlign.start,
                                    ),
                                    padding: EdgeInsets.all(0),
                                    width: width,
                                    onTap: () {
                                      controller.setDatapending(
                                          bookingStatus: 'pending',
                                          bookingId: controller
                                              .newlist[index].bookinId!
                                              .toString());
                                    })),
                            Expanded(
                                child: ButtonCustomText(
                                    leading: CustomIcon(
                                      icon: Icons.arrow_right_alt_sharp,
                                      size: width / 15,
                                    ),
                                    title: CustomText(
                                      str: "CANCEL",
                                      color: AppColor.white,
                                      size: 15,
                                    ),
                                    padding: EdgeInsets.all(0),
                                    width: width,
                                    onTap: () {
                                      controller.setDatapending(
                                          bookingStatus: 'canceled',
                                          bookingId: controller
                                              .newlist[index].bookinId!
                                              .toString());
                                    })),
                          ],
                        )
                      ],
                    )),
              );
            },
          ),
        ),
      ]);
    });
  }
}
