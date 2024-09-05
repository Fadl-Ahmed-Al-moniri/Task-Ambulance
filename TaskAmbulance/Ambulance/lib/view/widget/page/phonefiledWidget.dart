// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:AmbulaceBooking/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';


class PhoneField extends StatelessWidget {

  PhoneField(
      {super.key,
      required this.width,
      required this.phonenumber,
      this.validator});

  final double width;
  final TextEditingController phonenumber;
  Future<String?> Function(PhoneNumber?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: width / 16, vertical: width / 60),
      child: IntlPhoneField(
        validator: validator,
        disableLengthCheck: true,
        flagsButtonPadding: EdgeInsets.all(width / 28),
        dropdownTextStyle: const TextStyle(
          color:AppColor. white,
          fontWeight: FontWeight.w700,
          fontFamily: "Inter",
          fontSize: 18,
        ),
        textAlignVertical: TextAlignVertical.center,
        controller: phonenumber,
        showDropdownIcon: true,
        showCountryFlag: false,
        dropdownIcon: Icon(
          Icons.phone_in_talk,
          size: width / 12,
          color: AppColor.white,
        ),
        decoration: InputDecoration(
          fillColor:AppColor. red_1,
          filled: true,
          hintStyle: TextStyle(
            color: AppColor.white,
            fontWeight: FontWeight.w700,
            fontFamily: "Inter",
            fontSize: 18,
          ),
          hintText: "000 000000",
          contentPadding: EdgeInsets.all(width / 22),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
          errorStyle: const TextStyle(
              color: Colors.redAccent,
              fontSize: 12,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
