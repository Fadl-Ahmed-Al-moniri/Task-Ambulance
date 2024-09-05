// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {

  CustomIcon(
      {super.key,
      required this.icon,
      this.color = Colors.white,
      this.size = 15});

  final IconData icon;
  Color color;
  double size;

  @override
  Widget build(BuildContext context) {
    return Icon(
      
      icon,
      color: color,
      size: size,
    );
  }
}
