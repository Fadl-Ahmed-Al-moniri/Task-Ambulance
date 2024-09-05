// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, unused_local_variable

import 'package:AmbulaceBooking/controller/page/user/record_controller.dart';
import 'package:AmbulaceBooking/core/constant/color.dart';
import 'package:AmbulaceBooking/view/widget/page/ItemCard.dart';
import 'package:AmbulaceBooking/view/widget/page/imgWidget.dart';
import 'package:AmbulaceBooking/view/widget/page/textWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecordList extends StatelessWidget {
  const RecordList({super.key});

  @override
  Widget build(BuildContext context) {
    RecordController controller = Get.put(RecordController());

    double height = MediaQuery.of(context)
        .size
        .height; //this the height of screen that ues the app
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<RecordController>(builder: (controller) {
      return Scaffold(
          appBar: AppBar(
            bottom: PreferredSize(
                preferredSize: Size(width / 8, height / 11),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: width / 15),
                      child: CustomText(
                        str: "BOOK AN \nAMBULANNCE",
                        size: 32,
                      ),
                    ),
                    Expanded(
                      child: Images(
                          height: 254.32,
                          width: 288,
                          path: "asset/img/1719557186413.png"),
                    ),
                  ],
                )),
          ),
          body: ListView(
            padding: EdgeInsets.all(width / 15),
            children: [
              controller.pending.isEmpty
                  ? Divider(
                      thickness: 5,
                      color: AppColor.grey,
                    )
                  : Column(children: [
                      Container(
                          height: height / 4,
                          child: Container(
                            height: height / 4.5,
                            child: ItemofRecord(
                              width: width,
                              height: height,
                              recordlist: controller.pending,
                              title: "PENDING",
                              color: AppColor.yellow,
                              onTap: () {},
                            ),
                          )),
                      Divider(
                        thickness: 5,
                        color: AppColor.grey,
                      ),
                    ]),
              SizedBox(
                height: height / 40,
              ),
              controller.completed.isEmpty
                  ? Divider(
                      thickness: 5,
                      color: AppColor.grey,
                    )
                  : Column(children: [
                      Container(
                          height: height / 4,
                          child: Container(
                            height: height / 4.5,
                            child: ItemofRecord(
                              width: width,
                              height: height,
                              recordlist: controller.completed,
                              title: "COMPLETED",
                              color: AppColor.green,
                              onTap: () {},
                            ),
                          )),
                      Divider(
                        thickness: 5,
                        color: AppColor.grey,
                      ),
                    ]),
              SizedBox(
                height: height / 40,
              ),
              controller.canceled.isEmpty
                  ? Divider(
                      thickness: 5,
                      color: AppColor.grey,
                    )
                  : Column(children: [
                      Container(
                          height: height / 4,
                          child: Container(
                            height: height / 4.5,
                            child: ItemofRecord(
                              width: width,
                              height: height,
                              recordlist: controller.canceled,
                              title: "CANCELED",
                              color: AppColor.red_1,
                              onTap: () {},
                            ),
                          )),
                      Divider(
                        thickness: 5,
                        color: AppColor.grey,
                      ),
                    ]),
            ],
          ));
    });
  }
}
