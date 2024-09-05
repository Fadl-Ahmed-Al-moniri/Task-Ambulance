// ignore_for_file: must_be_immutable

import 'package:AmbulaceBooking/core/constant/color.dart';
import 'package:flutter/material.dart';

class SwitchTile extends StatelessWidget {
  SwitchTile({
    super.key,
    required this.widget,
    required this.width,
    required this.onChanged,
    required this.isselected,
  });
  final Widget widget;
  final double width;
  bool isselected;
  final void Function(bool value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        widget,
        Switch(
            activeTrackColor: AppColor.black,
            inactiveTrackColor: AppColor.white_2,
            inactiveThumbColor: AppColor.white,
            value: isselected,
            onChanged: onChanged),
      ],
    );
  }
}
