// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ButtonCustomText extends StatelessWidget {
 
  ButtonCustomText({
    super.key,
    required this.title,
    required this.padding,
    required this.width,
    required this.onTap,
    this.leading,
    this.selectedTileColor = const Color(0xFFFF3F3F),
  });
  final Widget title;
  final void Function() onTap;
  final double width;
  final EdgeInsetsGeometry padding;
  Widget? leading;
  Color selectedTileColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: ListTile(
        minLeadingWidth: 1,
        minVerticalPadding: BorderSide.strokeAlignCenter,
        minTileHeight: width / 7,
        titleAlignment: ListTileTitleAlignment.center,
        contentPadding: EdgeInsets.only(left: 3),
        shape: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        selectedTileColor: selectedTileColor,
        selected: true,
        title: title,
        onTap: onTap,
        leading: leading,
      ),
    );
  }
}

 // child: Container(
      //     width: width / 2,
      //     height: width / 6.7,
      //     margin: margin,
      //     decoration: BoxDecoration(
      //         color: red_1, borderRadius: BorderRadius.circular(10)),
      //     child: Center(
      //       child: CustomText(
      //         str: str,
      //         size: 26,
      //         color: white,
      //       ),
      //     )),