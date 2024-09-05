import 'package:AmbulaceBooking/controller/auth/login_controller.dart';
import 'package:get/get.dart';

class InitalBunding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
