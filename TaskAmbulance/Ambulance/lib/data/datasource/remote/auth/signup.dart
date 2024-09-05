import 'dart:io';

import 'package:AmbulaceBooking/core/class/crud.dart';
import 'package:AmbulaceBooking/linkapi.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);

  postData(
    String email,
    String cnicNumber,
    String fullname,
    String phone,
    String password,
    String address,
    String cityaddress,
    File cnicIMG,

    //  String email,
  ) async {
    var response = await crud.postDataWithFile(
        url: AppLink.signUp,
        data: {
          "email": email,
          'CNICnumber': cnicNumber,
          'fullname': fullname,
          'phone': phone,
          "password": password,
          "address": address,
          "city_address": cityaddress,
          "CNICimage": cnicIMG.absolute.path,
        },
        file: cnicIMG);

    print('cnicIMG.absolute.path${cnicIMG.absolute.path}');

    return response.fold((l) => l, (r) => r);
  }
}
