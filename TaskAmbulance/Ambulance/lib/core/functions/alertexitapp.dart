// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> AlertExitApp() {
  Get.defaultDialog(title: "42".tr, middleText: "43".tr, actions: [
    ElevatedButton(
        onPressed: () {
          exit(0);
        },
        child: Text("45".tr)),
    ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: Text("44".tr)),
  ]);
  return Future.value(true);
}
