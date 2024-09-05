// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'dart:io';
import 'package:AmbulaceBooking/core/class/ststusrequst.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class Crud {
  Future<Either<StatusRucust, Map>> postData(
    String linkurl,
    Map data,
  ) async {
    if (
        // await chickIntrnet()
        true) {
      var request = await http.post(Uri.parse(linkurl), body: data);
      print("postDatagetDataOfCity>>>>>>>>>>>>>>>>>>${request.body}");
      if (request.statusCode == 200 || request.statusCode == 201) {
        var requestbody = jsonDecode(request.body);
        print(requestbody);
        return Right(requestbody);
      } else {
        print(">>>>>>>>left(StatusRucust.serverfaliure)>>>>>>>>>>>${request}");
        return left(StatusRucust.serverfaliure);
      }
    }
    //  else {

    //   print(">>>>>>>>left(StatusRucust.offlinefaliure)>>>>>>>>>>>${"request"}");
    //   return left(StatusRucust.offlinefaliure);
    // }
  }

  Future<Either<StatusRucust, Map>> getData(String linkurl) async {
    if (
        // await chickIntrnet()
        true) {
      var response = await http.get(
        Uri.parse(linkurl),
      );
      print("response.statusCode>>>>>.>>>>>>>>>>${response.statusCode}");
      print("linkurl>>>>>>>>>>>>>>>>${linkurl}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        var responsebody = await jsonDecode(response.body);
        print("response>>>>>>>>>>>>>>>>>>$response");
        return Right(responsebody);
      } else {
        return left(StatusRucust.serverfaliure);
      }
    }
    // else {
    //   return left(StatusRucust.offlinefaliure);
    // }
  }

  postDataWithFile(
      {required String url, required Map data, required File file}) async {
    if (
        // await chickIntrnet()
        true) {
      var request = http.MultipartRequest("POST", Uri.parse(url));
      var length = await file.length();
      var stream = http.ByteStream(file.openRead());
      var multipartFile = http.MultipartFile("image", stream, length,
          filename: basename(file.path));
      request.files.add(multipartFile);
      data.forEach((key, value) {
        request.fields[key] = value;
      });
      var myRequest = await request.send();
      var respones = await http.Response.fromStream(myRequest);
      print(respones.body);
      if (myRequest.statusCode == 200 || myRequest.statusCode == 201) {
        var responsebody = await jsonDecode(respones.body);
        print(">>>>>>>>>>>>>>responsebody>>>>>>>>>>>>>>>>>.${responsebody}");
        return Right(responsebody);
      } else {
        return left(StatusRucust.serverfaliure);
      }
    }
    // else {
    //   return left(StatusRucust.offlinefaliure);
    // }N
  }
}
