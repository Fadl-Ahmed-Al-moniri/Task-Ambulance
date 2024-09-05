import 'package:AmbulaceBooking/core/class/ststusrequst.dart';
import 'package:AmbulaceBooking/core/constant/routes.dart';
import 'package:AmbulaceBooking/core/functions/handlingdatacontroller.dart';
import 'package:AmbulaceBooking/core/services/services.dart';
import 'package:AmbulaceBooking/data/datasource/remote/booking/users.dart';
import 'package:AmbulaceBooking/data/model/user_model.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  StatusRucust statusRucust = StatusRucust.initial;
  Users dataUser = Users(Get.find());
  MyServices myServices = Get.find();
  List<UserModel> userdata = [];

  
  @override
  void onInit() {
    getDataOfUser();
    super.onInit();
  }
  

  getDataOfUser() async {
    statusRucust = StatusRucust.loading;
    var id = myServices.sharedPreferences.getString('userid')!;
    update();

    var response = await dataUser.getDataofUser(userId: id);
    statusRucust = handlingData(response);
    userdata.clear();
    if (response['status'] == 'success') {
      for (var element in response['data']) {
        userdata.add(UserModel.fromjson(element));
      }
      statusRucust = StatusRucust.success;
      update();
    } else {
      Get.defaultDialog(title: "warning", middleText: "${response['status']}");
      statusRucust = StatusRucust.faliure;
      update();
    }
  }

  logout() {
    Get.toNamed(AppRout.login);
  }
}
