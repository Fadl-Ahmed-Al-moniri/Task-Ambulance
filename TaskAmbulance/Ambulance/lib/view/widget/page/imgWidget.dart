// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class Images extends StatelessWidget {
  Images(
      {super.key,
      required this.height,
      required this.width,
      required this.path,
      this.alignment = Alignment.center});
  final String path;
  final double height;
  final double width;
  AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      // this
      margin: EdgeInsets.symmetric(vertical: height / 50),
      height: height / 2.89,
      child: Image.asset(
        path,
        fit: BoxFit.contain,
        alignment: alignment,
      ),
    );
  }
}
