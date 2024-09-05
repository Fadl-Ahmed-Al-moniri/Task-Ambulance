// ignore_for_file: body_might_complete_normally_nullable, unused_import, must_be_immutable, prefer_const_constructors

import 'package:AmbulaceBooking/controller/auth/singup_controller.dart';
import 'package:AmbulaceBooking/core/class/ststusrequst.dart';
import 'package:AmbulaceBooking/core/constant/color.dart';
import 'package:AmbulaceBooking/core/constant/imageasset.dart';
import 'package:AmbulaceBooking/core/functions/validinput.dart';
import 'package:AmbulaceBooking/view/widget/page/buttontxtWidget.dart';
import 'package:AmbulaceBooking/view/widget/page/iconWidget.dart';
import 'package:AmbulaceBooking/view/widget/page/imgWidget.dart';
import 'package:AmbulaceBooking/view/widget/page/phonefiledWidget.dart';
import 'package:AmbulaceBooking/view/widget/page/textWidget.dart';
import 'package:AmbulaceBooking/view/widget/page/textrichWidget.dart';
import 'package:AmbulaceBooking/view/widget/page/txtfieldWidget.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

// import 'package:intl_phone_field/countries.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SingupController());

    double height = MediaQuery.of(context)
        .size
        .height; //this the height of screen that ues the app
    double width = MediaQuery.of(context)
        .size
        .width; //this the width of screen that ues the app
    return GetBuilder<SingupController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: Form(
            key: controller.formstateforSingup,
            child: ListView(
                padding: EdgeInsets.symmetric(vertical: height / 30),
                children: [
                  Center(
                    child: CustomText(
                      str: "SIGNUP",
                      size: 26,
                    ),
                  ),
                  Images(
                    height: height,
                    width: width,
                    path: AppImageAsset.signup,
                  ),
                  CustomTextField(
                    controller: controller.email,
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
                    controller: controller.cnic,
                    icon: CustomIcon(
                      icon: Icons.credit_card,
                      size: width / 12,
                    ),
                    width: width,
                    hintText: "CNIC number",
                    keyboardType: TextInputType.number,
                    validator: (val) {
                      if (val == "") {
                        return validInput(val!, 3, 20, 'phone');
                      }
                    },
                  ),
                  CustomTextField(
                    controller: controller.fullname,
                    icon: CustomIcon(
                      icon: Icons.title,
                      size: width / 12,
                    ),
                    width: width,
                    hintText: "Full Name",
                    validator: (val) {
                      if (val == "") {
                        return validInput(val!, 3, 20, 'username');
                      }
                    },
                  ),
                  PhoneField(
                    width: width,
                    phonenumber: controller.phonenumber,
                    validator: (val) async {
                      if (val == null) {
                        return validInput(val!.number, 3, 20, 'phone');
                      }
                    },
                  ),
                  GetBuilder<SingupController>(builder: (controller) {
                    return CustomTextField(
                      controller: controller.password,
                      hintText: "Password",
                      obscureText: controller.isshowpassword,
                      icon: CustomIcon(
                        icon: Icons.password_rounded,
                        size: width / 12,
                      ),
                      iconapass: InkWell(
                        onTap: () async {
                          controller.showpassword();
                        },
                        child: CustomIcon(
                            icon: Icons.remove_red_eye, size: width / 12),
                      ),
                      validator: (val) {
                        if (val == "") {
                          return validInput(val!, 3, 20, 'password');
                        }
                      },
                      width: width,
                    );
                  }),
                  InkWell(
                    onTap: () {},
                    child: CustomTextField(
                        controller: controller.address,
                        icon: CustomIcon(
                          icon: Icons.location_pin,
                          size: width / 9,
                        ),
                        width: width,
                        hintText: "Address",
                        keyboardType: TextInputType.streetAddress,
                        validator: (val) {
                          if (val == "") {
                            return "Can't be Null Please Enter your Address!";
                          }
                        }),
                  ),
                  CustomTextField(
                    controller: controller.districts,
                    icon: CustomIcon(
                      icon: Icons.list,
                      size: width / 12,
                    ),
                    width: width,
                    iconapass: InkWell(
                      onTap: () {
                        CustomDropdownButton(
                          height: height / 1.2,
                          hintTextt: controller.districts.text,
                          items: null,
                          onChanged: (value) {},
                          suffixIcon: CustomIcon(
                            icon: Icons.download_rounded,
                          ),
                        );
                      },
                      child: CustomIcon(
                        icon: Icons.navigate_next,
                        size: width / 12,
                      ),
                    ),
                    hintText: "select your Districts",
                    keyboardType: TextInputType.streetAddress,
                    validator: (val) {
                      if (val == "") {
                        return "Can't be Null Please Enter your Districts!";
                      }
                    },
                  ),
                  controller.imagefiles == null
                      ? UplodImag(width: width, height: height)
                      : Container(
                          margin: EdgeInsets.symmetric(vertical: height / 50),
                          height: height / 2.89,
                          child: controller.statusRucust == StatusRucust.loading
                              ? Center(
                                  child: CircularProgressIndicator(
                                    color: AppColor.red_1,
                                  ),
                                )
                              : Image.file(
                                  controller.imagefiles!,
                                  fit: BoxFit.contain,
                                  alignment: Alignment.center,
                                ),
                        ),
                  ButtonCustomText(
                    title: CustomText(
                      str: "SIGNUP",
                      size: 26,
                      color: AppColor.white,
                      textAlign: TextAlign.center,
                    ),
                    width: width,
                    onTap: () {
                      controller.signup();
                    },
                    padding: EdgeInsets.symmetric(horizontal: width / 16),
                  ),
                  CustomTextrich(
                    part1: "You have already account?",
                    part2: "Login",
                    onTap: () {
                      controller.goToLogin();
                    },
                    width: width,
                  ),
                ]),
          ),
        ),
      );
    });
  }
}

class UplodImag extends StatelessWidget {
  const UplodImag({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    SingupController controller = Get.put(SingupController());
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: CustomText(
                  str: "Pleaes tack picture to CNIC",
                  color: AppColor.white,
                ),
                actions: [
                  InkWell(
                    onTap: () async {
                      await controller.getimageformCamera();
                    },
                    child: CustomIcon(
                      icon: Icons.camera_alt,
                      size: width / 10,
                      color: AppColor.white,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      await controller.getimageformPhotogallery();
                    },
                    child: CustomIcon(
                      icon: Icons.photo,
                      size: width / 10,
                      color: AppColor.white,
                    ),
                  ),
                ],
                actionsPadding: EdgeInsets.all(width / 20),
                actionsAlignment: MainAxisAlignment.spaceAround,
                titlePadding: EdgeInsets.all(width / 20),
                backgroundColor: AppColor.red_1,
              );
            });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width / 16),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Images(height: height, width: width, path: AppImageAsset.cardFack),
            Container(
              width: width,
              height: width / 6.7,
              margin: EdgeInsets.symmetric(
                  horizontal: width / 22, vertical: width / 60),
              decoration: BoxDecoration(
                  color: AppColor.red_1,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: CustomText(
                  str: "Upload your Personal CNIC",
                  color: AppColor.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDropdownButton extends StatelessWidget {
  CustomDropdownButton(
      {super.key,
      required this.hintTextt,
      required this.items,
      required this.onChanged,
      required this.height,
      required this.suffixIcon});
  final String hintTextt;
  final List<DropdownMenuItem<Object>>? items;
  final void Function(Object?)? onChanged;
  final double height;
  CustomIcon suffixIcon;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      itemHeight: height / 10,
      borderRadius: BorderRadius.circular(20),
      hint: CustomTextField(
        hintText: hintTextt,
        icon: suffixIcon,
        width: 40,
      ),
      icon: null,
      dropdownColor: AppColor.red_1,
      items: items,
      // value: controller.val,
      isExpanded: true,
      iconSize: 0,
      onChanged: onChanged,
    );
  }
}
