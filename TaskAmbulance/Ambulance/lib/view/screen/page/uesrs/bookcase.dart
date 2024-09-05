// ignore_for_file: unused_field, prefer_const_constructors_in_immutables, must_be_immutable
import 'package:AmbulaceBooking/controller/page/user/bookcase_controller.dart';
import 'package:AmbulaceBooking/core/constant/color.dart';
import 'package:AmbulaceBooking/core/constant/imageasset.dart';
import 'package:AmbulaceBooking/view/widget/page/buttontxtWidget.dart';
import 'package:AmbulaceBooking/view/widget/page/dilogWidget.dart';
import 'package:AmbulaceBooking/view/widget/page/iconWidget.dart';
import 'package:AmbulaceBooking/view/widget/page/imgWidget.dart';
import 'package:AmbulaceBooking/view/widget/page/switchtileWidget.dart';
import 'package:AmbulaceBooking/view/widget/page/textWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BookCace extends StatelessWidget {
  BookCace({
    super.key,
  });

  BookcaseController controller = Get.put(BookcaseController());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context)
        .size
        .height; //this the height of screen that ues the app
    double width = MediaQuery.of(context)
        .size
        .width; //this the width of screen that ues the app
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
            preferredSize: Size(width / 8, height / 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: width / 15),
                    child: CustomText(
                      str: "BOOK AN \nAMBULANNCE",
                      size: 18,
                    ),
                  ),
                ),
                Expanded(
                  child: Images(
                      height: 254.32, width: 288, path: AppImageAsset.logo),
                ),
              ],
            )),
      ),
      body: GetBuilder<BookcaseController>(builder: (controller) {
        return ListView(
          padding: EdgeInsets.all(width / 20),
          children: [
            SizedBox(
              height: height / 30,
              child: Row(
                children: [
                  Expanded(
                    child: SwitchTile(
                      widget: CustomText(str: "Major", size: 18),
                      width: width,
                      onChanged: (value) {
                        controller.selectMinor(value);
                      },
                      isselected: controller.isselectedMajor,
                    ),
                  ),
                  Expanded(
                    child: SwitchTile(
                      widget: CustomText(str: "Minor", size: 18),
                      width: width,
                      onChanged: (value) {
                        controller.selectMajor(value);
                      },
                      isselected: controller.isselectedMinor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: height,
              margin: EdgeInsets.symmetric(vertical: width / 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: AppColor.red_1, width: 1)),
              child: GoogleMap(
                onTap: (argument) {
                  controller.addTomarkers(argument);
                },
                markers: controller.markers.toSet(),
                mapType: MapType.satellite,
                initialCameraPosition: controller.kGooglePlex,
                onMapCreated: (GoogleMapController controll) {
                  controller.contr.complete(controll);
                },
              ),
            ),
            SizedBox(
              height: height / 8,
              width: width,
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: ButtonCustomText(
                      title: CustomText(
                        str: "BOOK CASE",
                        color: AppColor.white,
                        size: 26,
                      ),
                      width: width,
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return ShowCusotmDilog(
                              str: "Are you sure to book this case?",
                              width: width,
                              onTapConfirm: () {
                                controller.confirem();
                              },
                              onTapclose: () {
                                controller.canacl();
                              },
                            );
                          },
                        );
                      },
                      leading: CustomIcon(
                        icon: Icons.location_on,
                        size: width / 10,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: width / 80,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: controller.imagefiles == null
                        ? Container(
                            height: height / 15,
                            decoration: BoxDecoration(
                                color: AppColor.red_1,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: AppColor.red_1, width: 1)),
                            child: InkWell(
                              onTap: () async {
                                controller.getimageformcamera();
                              },
                              child: CustomIcon(
                                icon: Icons.upload,
                                size: width / 12,
                              ),
                            ),
                          )
                        : Container(
                            height: height / 15,
                            decoration: BoxDecoration(
                                color: AppColor.green,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: AppColor.red_1, width: 1)),
                            child: CustomIcon(
                              icon: Icons.check,
                              size: width / 12,
                            ),
                          ),
                  )
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
