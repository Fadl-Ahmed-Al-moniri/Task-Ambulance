import 'dart:io';

import 'package:AmbulaceBooking/core/class/crud.dart';
import 'package:AmbulaceBooking/linkapi.dart';

class Booking {
  Crud crud;
  Booking(this.crud);

  postData({
    required String bookingType,
    required String quantity,
    required File statusImage,
    required String location,
    required dynamic userId,
    required String dateofbook,
    required String bookingStatus,
  }) async {
    var response = await crud.postDataWithFile(
        url: AppLink.addbookinguser,
        data: {
          "bookingType": bookingType,
          "quantity": quantity,
          "location": location,
          "userid": userId,
          'image': statusImage.absolute.path,
          "dateofbooking": dateofbook,
          "bookingstatus": bookingStatus,
        },
        file: statusImage);
    return response.fold((l) => l, (r) => r);
  }

  getDataByuserIdAndbookingStatus(
      {required String userId, required String bookingStatus}) async {
    var response = await crud.postData(AppLink.getBookingusres, {
      'bookingStatus': bookingStatus,
      'userid': userId,
    });
    return response.fold((l) => l, (r) => r);
  }

  getDataBybookingStatus({required String bookingStatus}) async {
    var response = await crud.postData(AppLink.getBookingDriver, {
      'bookingStatus': bookingStatus,
    });
    return response.fold((l) => l, (r) => r);
  }

  setDataByDriver(
      {required String bookingStatus, required String bookingId}) async {
    var response = await crud.postData(AppLink.setBookingStausDriver, {
      'bookingStatus': bookingStatus,
      'bookingId': bookingId,
    });
    return response.fold((l) => l, (r) => r);
  }

  getallDataByemail({required String email}) async {
    var response = await crud.postData(AppLink.getallDatabyemail, {
      'useremail': email,
    });
    return response.fold((l) => l, (r) => r);
  }

  getallData() async {
    var response = await crud.postData(AppLink.getallData, {});
    return response.fold((l) => l, (r) => r);
  }
}
