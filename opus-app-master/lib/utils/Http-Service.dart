import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class ApiHandler {
  static String baseUrl = "http://192.168.3.121:5000";

  static Dio dio = new Dio();

  Future makeGetRequest(@required String getRoute) async {
    return await dio.get(baseUrl + getRoute);
  }

  Future makePostRequest(String getRoute, data) async {
    return await dio.post(baseUrl + getRoute, data: data).then((response) {
      log('[zeeshan] $response');
      return response;
    }).catchError((error) {
      log('[zeeshan] error $error');
    });
  }

  Future makePutRequest(@required String getRoute, @required data) async {
    var response = await dio.put(baseUrl + getRoute, data: data);
    return response;
  }
}
