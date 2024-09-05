import 'package:AmbulaceBooking/core/class/crud.dart';
import 'package:AmbulaceBooking/linkapi.dart';

class Users {
  
  Crud crud;
  Users(this.crud);

  getDataofUser({required String userId })async{
     var response = await crud.postData(AppLink.getdatauser, {
      'userid': userId,
    });
    return response.fold((l) => l, (r) => r);
  }
}