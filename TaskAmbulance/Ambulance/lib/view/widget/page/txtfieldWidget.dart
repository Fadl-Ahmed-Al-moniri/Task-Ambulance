// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:AmbulaceBooking/core/constant/color.dart';
import 'package:AmbulaceBooking/view/widget/page/iconWidget.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.icon,
    required this.width,
    required this.hintText,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.iconapass,
    this.validator,
    this.onSaved
  });
  TextEditingController? controller;
  final String hintText;
  final CustomIcon icon;
  final double width;
  Function()? onSaved;
  TextInputType? keyboardType;
  bool obscureText;
  Widget? iconapass;
  String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: width / 16, vertical: width / 60),
      child: TextFormField(
        onEditingComplete: onSaved,
        cursorRadius: const Radius.circular(10),
        validator: validator,
        keyboardType: keyboardType,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          fillColor: AppColor.red_1,
          filled: true,
          suffixIcon: iconapass,
          suffixIconConstraints:
              // this condition for check if the filed doesn't has iconapassword ,
              //it doesn't take space from filed
              iconapass != null ? BoxConstraints(minWidth: width / 6) : null,
          prefixIcon: icon,
          prefixIconConstraints: BoxConstraints(minWidth: width / 6),
          hintText: hintText,
          hintStyle: TextStyle(
            color: AppColor.white,
            fontWeight: FontWeight.w700,
            fontFamily: "Inter",
            fontSize: 18,
          ),
          contentPadding: EdgeInsets.all(width / 22),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
          errorStyle: const TextStyle(
              color: AppColor.red_2, fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
