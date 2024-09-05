// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String str;
  double size;
  Color color;
  FontWeight fontWeight;
  TextAlign? textAlign;

  CustomText(
      {super.key,
      required this.str,
      this.size = 18,
      this.color = Colors.black,
      this.fontWeight = FontWeight.w700,
      this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      str,
      textAlign: textAlign,
      maxLines: 20,
      style: TextStyle(
          overflow: TextOverflow.ellipsis,
          fontFamily: "Inter",
          fontSize: size,
          color: color,
          fontWeight: fontWeight),
    );
  }
}
