// ignore_for_file: prefer_const_constructors

import 'package:AmbulaceBooking/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomTextrich extends StatelessWidget {
  const CustomTextrich({
    super.key,
    required this.part1,
    required this.part2,
    required this.onTap,
    required this.width,
  });
  final String part1;
  final String part2;
  final void Function() onTap;
  final double width;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: width / 30),
        child: Text.rich(TextSpan(children: [
          TextSpan(
              text: part1,
              style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 18,
                  color: AppColor.black,
                  fontWeight: FontWeight.w700)),
          TextSpan(
              text: part2,
              style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 18,
                  color: AppColor.blue,
                  fontWeight: FontWeight.w700)),
        ])),
      ),
    );
  }
}
