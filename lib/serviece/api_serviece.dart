import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mision_text_webcastle/model/all_data_model.dart';
import 'package:mision_text_webcastle/serviece/api_endpoints.dart';

class ApiServices {
  final dio = Dio();
  final endpoints = ApiEndPoints();
  String accessToken = "";

  AllData? alldatamodel;

  Future<String> anonymousLogin() async {
    try {
      Response response = await dio.post(endpoints.baseUrl + endpoints.login,
          queryParameters: {"device_token": "test_token", "device_type": 1});

      print(response.data["data"]["access_token"]);
      accessToken = response.data["data"]["access_token"];
      log(accessToken);

      return accessToken;
    } catch (e) {
      if (e is DioException) {
        log(e.toString());
      } else {
        log(e.toString());
      }
      return "Somthing error";
    }
  }

  Future<AllData> getAllData() async {
    String token = await anonymousLogin();
    try {
      Response response = await dio.get(endpoints.baseUrl + endpoints.home,
          options: Options(headers: {
            "authorization": "Bearer $token",
          }));
     
      return AllData.fromJson(response.data);
    } catch (e) {
      if (e is DioException) {
        log(e.toString());
      } else {
        log(e.toString());
      }
      return alldatamodel!;
    }
  }

  getallFunction() async {
    alldatamodel = await getAllData();
    log(alldatamodel!.data.homeFields[0].carouselItems![0].image.toString());
  }
}
