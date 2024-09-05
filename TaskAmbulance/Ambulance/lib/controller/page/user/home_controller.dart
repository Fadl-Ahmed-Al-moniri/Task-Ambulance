import 'package:AmbulaceBooking/core/constant/imageasset.dart';
import 'package:AmbulaceBooking/core/constant/routes.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController {
  
  numberCall() async {
    await launchUrl(Uri(scheme: 'tel', path: "1122"));
  }

  gotoBookpage({required String bookType}) {
    Get.toNamed(AppRout.bookcase, arguments: {'bookingType': bookType});
  }

  gotoProfilepage() {
    Get.toNamed(AppRout.profileuser);
  }

  gotoRecordpage() {
    Get.toNamed(AppRout.record);
  }

  List imagesgroupe = [
    {"path": AppImageAsset.medical, "type": "Medical"},
    {"path": AppImageAsset.accident, "type": "Accident"},
    {"path": AppImageAsset.fire, "type": "Fire"},
    {"path": AppImageAsset.other, "type": "Other"}
  ];
}
