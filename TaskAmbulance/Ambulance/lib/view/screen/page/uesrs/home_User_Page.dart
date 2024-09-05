// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, must_be_immutable

// ignore: implementation_imports
import 'package:AmbulaceBooking/controller/page/user/home_controller.dart';
import 'package:AmbulaceBooking/controller/page/user/record_controller.dart';
import 'package:AmbulaceBooking/core/constant/color.dart';
import 'package:AmbulaceBooking/core/constant/imageasset.dart';
import 'package:AmbulaceBooking/view/widget/page/buttontxtWidget.dart';
import 'package:AmbulaceBooking/view/widget/page/iconWidget.dart';
import 'package:AmbulaceBooking/view/widget/page/imgWidget.dart';
import 'package:AmbulaceBooking/view/widget/page/textWidget.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({
    super.key,
  });

  HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => RecordController());
    double height = MediaQuery.of(context)
        .size
        .height; //this the height of screen that ues the app
    double width = MediaQuery.of(context)
        .size
        .width; //this the width of screen that ues the app

    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
            preferredSize: Size(width / 8, height / 10),
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
                      height: 254.32, width: 288, path: AppImageAsset.logo),
                ),
              ],
            )),
      ),
      body: ListView(
        padding: EdgeInsets.all(width / 30),
        children: [
          Container(
            height: height / 2.1,
            margin: EdgeInsets.symmetric(vertical: width / 20),
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.imagesgroupe.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: width / 20,
                crossAxisSpacing: width / 18,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    controller.gotoBookpage(
                        bookType: controller.imagesgroupe[index]["type"]);
                  },
                  child: Container(
                    padding: EdgeInsets.all(width / 100),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: AppColor.red_1, width: 1)),
                    child: Images(
                      height: height / 43,
                      width: width,
                      path: controller.imagesgroupe[index]["path"],
                    ),
                  ),
                );
              },
            ),
          ),
          ButtonCustomText(
            title: CustomText(
              str: "1122 Call",
              size: 26,
              color: AppColor.white,
              textAlign: TextAlign.center,
            ),
            width: width,
            onTap: () async {
              controller.numberCall();
            },
            padding: EdgeInsets.symmetric(horizontal: 0),
          ),
          SizedBox(
            height: width / 3,
          ),
          Row(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                      top: -5,
                      right: 10,
                      child:
                          GetBuilder<RecordController>(builder: (controllerRe) {
                        return Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColor.green,
                              border:
                                  Border.all(color: AppColor.white, width: 1)),
                          child: CustomText(
                            // str: users.getpedinglist.length.toString(),
                            str: '${controllerRe.pending.length}',
                            size: 20,
                            textAlign: TextAlign.center,
                            color: AppColor.white,
                          ),
                        );
                      }),
                    ),
                    Positioned(
                      child: ButtonCustomText(
                        title: CustomText(
                          str: "MY RECORD",
                          size: 20,
                          color: AppColor.white,
                        ),
                        leading: CustomIcon(
                          icon: Icons.document_scanner_outlined,
                          size: width / 14,
                        ),
                        onTap: () async {
                          controller.gotoRecordpage();
                        },
                        width: width,
                        padding: EdgeInsets.symmetric(horizontal: width / 80),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ButtonCustomText(
                  title: CustomText(
                    str: "PROFILE",
                    size: 20,
                    color: AppColor.white,
                    textAlign: TextAlign.center,
                  ),
                  leading: CustomIcon(
                    icon: Icons.person,
                    size: width / 14,
                  ),
                  onTap: () async {
                    controller.gotoProfilepage();
                  },
                  width: width,
                  padding: EdgeInsets.symmetric(horizontal: width / 80),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
