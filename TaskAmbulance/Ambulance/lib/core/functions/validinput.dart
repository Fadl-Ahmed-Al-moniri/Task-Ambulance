import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "35".tr;
    }
  }

  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "36".tr;
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "37".tr;
    }
  }
  if (type == "password") {
    if (!GetUtils.isPassport(val)) {
      return "41".tr;
    }
  }

  if (val.isEmpty) {
    return "40".tr;
  }

  if (val.length < min) {
    return "38$min".tr;
  }
  if (val.length > max) {
    return "39$max".tr;
  }
}
