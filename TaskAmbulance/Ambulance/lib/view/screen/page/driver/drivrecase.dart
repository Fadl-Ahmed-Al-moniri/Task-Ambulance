// ignore_for_file: unused_field
import 'dart:async';

import 'package:AmbulaceBooking/controller/page/driver/drivrecase_controller.dart';
import 'package:AmbulaceBooking/core/constant/color.dart';
import 'package:AmbulaceBooking/view/widget/page/buttontxtWidget.dart';
import 'package:AmbulaceBooking/view/widget/page/dilogWidget.dart';
import 'package:AmbulaceBooking/view/widget/page/iconWidget.dart';
import 'package:AmbulaceBooking/view/widget/page/imgWidget.dart';
import 'package:AmbulaceBooking/view/widget/page/textWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DriverCase extends StatelessWidget {
  DriverCase({
    super.key,
  });
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => DrivrecaseController());

    double height = MediaQuery.of(context)
        .size
        .height; //this the height of screen that ues the app
    double width = MediaQuery.of(context)
        .size
        .width; //this the width of screen that ues the app
    return GetBuilder<DrivrecaseController>(builder: (controller) {
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
          padding: EdgeInsets.all(width / 20),
          children: [
            Container(
              height: height,
              margin: EdgeInsets.symmetric(vertical: width / 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: AppColor.red_1, width: 1)),
              child: GoogleMap(
                mapType: MapType.normal,
                markers: controller.markers.toSet(),
                initialCameraPosition: controller.kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            ),
            ButtonCustomText(
              title: CustomText(
                str: "Complete",
                color: AppColor.white,
                size: 26,
                textAlign: TextAlign.center,
              ),
              width: width,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return ShowCusotmDilog(
                      str: "Do you want to Complete the Case?",
                      width: width,
                      onTapConfirm: () {
                        controller.setDatapending(
                            bookingStatus: 'completed',
                            bookingId: controller.bookinId);
                      },
                      onTapclose: () {
                        controller.goBack();
                      },
                    );
                  },
                );
              },
              leading: CustomIcon(
                icon: Icons.check,
                size: width / 10,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: width / 80,
              ),
            ),
          ],
        ),
      );
    });
  }
}
