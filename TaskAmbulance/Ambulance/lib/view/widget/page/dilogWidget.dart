// ignore_for_file: prefer_const_constructors

import 'package:AmbulaceBooking/core/constant/color.dart';
import 'package:AmbulaceBooking/view/widget/page/textWidget.dart';
import 'package:flutter/material.dart';

class ShowCusotmDilog extends StatelessWidget {
  const ShowCusotmDilog(
      {super.key,
      required this.str,
      required this.width,
      required this.onTapConfirm,
      required this.onTapclose});
  final String str;
  final double width;
  final void Function() onTapConfirm;
  final void Function() onTapclose;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: CustomText(
        str: "Alert",
        size: 24,
        textAlign: TextAlign.center,
      ),
      content: CustomText(
        str: str,
        size: 15,
        fontWeight: FontWeight.w400,
        textAlign: TextAlign.center,
      ),
      actions: [
        InkWell(
          onTap: onTapclose,
          child: CustomText(
            str: "Close",
            color: AppColor.purple,
            size: 21,
            fontWeight: FontWeight.w400,
          ),
        ),
        InkWell(
          onTap: onTapConfirm,
          child: CustomText(
            str: "Confirm",
            color: AppColor.purple,
            size: 21,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
      elevation: 2,
      contentPadding:
          EdgeInsets.symmetric(horizontal: width / 20, vertical: width / 20),
      actionsAlignment: MainAxisAlignment.spaceAround,
      shape: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.black, width: 1),
          borderRadius: BorderRadius.circular(
            15,
          )),
      backgroundColor: AppColor.white,
    );
  }
}
