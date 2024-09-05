import 'package:AmbulaceBooking/core/constant/color.dart';
import 'package:AmbulaceBooking/view/widget/page/textWidget.dart';
import 'package:flutter/material.dart';

class PendingDriverlist extends StatelessWidget {
  PendingDriverlist({
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
    return ListView.builder(
      itemCount: recordlist.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: AppColor.white_2,
          child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width / 30, vertical: width / 10),
              child: Column(
                children: [
                  SizedBox(
                    height: height / 8,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 2,
                          child: CustomText(
                            str:
                                "Name:${recordlist[index].fullname}\nPhone:${recordlist[index].phone}\nAddress:${recordlist[index].location}\nType:${recordlist[index].bookingType}\nData:${recordlist[index].dateofbook}\nQuantity:${recordlist[index].quantity}",
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
                      ],
                    ),
                  ),
                ],
              )),
        );
      },
    );
  }
}
