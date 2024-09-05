// ignore_for_file: must_be_immutable, body_might_complete_normally_nullable

import 'package:AmbulaceBooking/controller/auth/login_controller.dart';
import 'package:AmbulaceBooking/core/constant/color.dart';
import 'package:AmbulaceBooking/core/constant/imageasset.dart';
import 'package:AmbulaceBooking/core/functions/validinput.dart';
import 'package:AmbulaceBooking/view/widget/page/buttontxtWidget.dart';
import 'package:AmbulaceBooking/view/widget/page/dilogWidget.dart';
import 'package:AmbulaceBooking/view/widget/page/iconWidget.dart';
import 'package:AmbulaceBooking/view/widget/page/imgWidget.dart';
import 'package:AmbulaceBooking/view/widget/page/textWidget.dart';
import 'package:AmbulaceBooking/view/widget/page/textrichWidget.dart';
import 'package:AmbulaceBooking/view/widget/page/txtfieldWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  Login({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => LoginController());

    double height = MediaQuery.of(context)
        .size
        .height; //this the height of screen that ues the app
    double width = MediaQuery.of(context)
        .size
        .width; //this the width of screen that ues the app
    return GetBuilder<LoginController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: CustomText(
            str: "LOGIN",
            size: 26,
          ),
          centerTitle: true,
        ),
        body: Form(
          key: controller.formstateforlogin,
          
          child: ListView(
            children: [
              Images(path: AppImageAsset.login, height: height, width: width),
              CustomTextField(
                controller: controller.username,
                icon: CustomIcon(
                  icon: Icons.email_outlined,
                  size: width / 12,
                ),
                width: width,
                hintText: "Enter your email",
                validator: (val) {
                  if (val == "") {
                    return validInput(val!, 3, 20, 'email');
                  }
                },
              ),
              CustomTextField(
                controller: controller.password,
                icon: CustomIcon(
                  icon: Icons.password_outlined,
                  size: width / 12,
                ),
                width: width,
                hintText: "Password",
                iconapass: InkWell(
                  onTap: () {
                    print("object");
                    controller.showpassword();
                  },
                  child:
                      CustomIcon(icon: Icons.remove_red_eye, size: width / 12),
                ),
                obscureText: controller.isshowpassword,
                validator: (val) {
                  if (val == "") {
                    return validInput(val!, 3, 20, 'password');
                  }
                },
              ),
              Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.symmetric(
                      horizontal: width / 16, vertical: width / 15),
                  child: InkWell(
                      onTap: () {},
                      child: CustomText(
                        str: "Forgot Password?",
                      ))),
              ButtonCustomText(
                title: CustomText(
                  str: "LOGIN",
                  size: 26,
                  color: AppColor.white,
                  textAlign: TextAlign.center,
                ),
                width: width,
                onTap: () {
                  controller.login();
                },
                padding: EdgeInsets.symmetric(horizontal: width / 16),
              ),
              CustomTextrich(
                part1: "Don't hava an account?",
                part2: "SignUP",
                onTap: () {
                  controller.goToSignup();
                },
                width: width,
              ),
              SizedBox(
                height: width / 5,
              )
            ],
          ),
        ),
      );
    });
  }
}
