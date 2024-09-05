// ignore_for_file: sized_box_for_whitespace

import 'package:AmbulaceBooking/controller/page/user/record_controller.dart';
import 'package:AmbulaceBooking/core/constant/color.dart';
import 'package:AmbulaceBooking/view/widget/page/textWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemofRecord extends StatelessWidget {
  const ItemofRecord({
    super.key,
    required this.title,
    required this.width,
    required this.height,
    required this.recordlist,
    this.onTap,
    this.color,
  });
  final String title;
  final void Function()? onTap;
  final double width;
  final double height;
  final Color? color;
  final List recordlist;

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => RecordController());
    return ListView(
      children: [
        CustomText(
          str: title,
          size: 28,
        ),
        Container(
          height: height,
          child: ListView.builder(
            itemCount: recordlist.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: height / 4.5,
                child: Card(
                  color: AppColor.white_2,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width / 28, vertical: width / 20),
                    child: Stack(
                      children: [
                        Positioned(
                          child: CustomText(
                            str:
                                "Name:${recordlist[index].fullname}\nPhone:${recordlist[index].phone}\nAddress:${recordlist[index].location}\nType:${recordlist[index].bookingType}\nData:${recordlist[index].dateofbook}",
                            size: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Positioned(
                            top: 7,
                            height: 32,
                            width: 129,
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
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
