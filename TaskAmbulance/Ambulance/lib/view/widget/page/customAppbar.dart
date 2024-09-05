// ignore_for_file: prefer_const_constructors, file_names

import 'package:AmbulaceBooking/core/constant/imageasset.dart';
import 'package:AmbulaceBooking/view/widget/page/imgWidget.dart';
import 'package:AmbulaceBooking/view/widget/page/textWidget.dart';
import 'package:flutter/material.dart';
  AppBar customAppbarAdmin(double width,double hight) {
    return AppBar(
        bottom: PreferredSize(
            preferredSize: Size(width / 8, hight / 11),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: width / 15),
                  child: CustomText(
                    str: "ADMIN",
                    size: 32,
                  ),
                ),
                Images(height: 254.32, width: 267, path: AppImageAsset.logo),
              ],
            )),
      );
  }

