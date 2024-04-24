import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

abstract class BaseHttp extends GetConnect {

  String get myBaseUrl;

  @override
  void onInit() {
    // baseUrl = 'https://api.covid19api.com'; // It define baseUrl to
    // Http and websockets if used with no [httpClient] instance
    httpClient.baseUrl = myBaseUrl;
    httpClient.timeout = Duration(seconds: 60);

    // ===== 登入驗證, 在addRequestModifier之前 =====
    //Autenticator will be called 3 times if HttpStatus is
    //HttpStatus.unauthorized
    // httpClient.maxAuthRetries = 3;
    // httpClient.addAuthenticator<Object?>((request) async {
    //   // final response = await get("http://yourapi/token");
    //   // final token = response.body['token'];
    //   // // Set the header
    //   // request.headers['Authorization'] = "$token";
    //   return request;
    // });

    // ===== request前 =====
    httpClient.addRequestModifier<Object?>((request) {
      debugPrint("|- (${request.method}) ${request.url.toString()}");
      request.headers.forEach((key, value) {
        debugPrint("|- $key: $value");
      });
      request.bodyBytes.bytesToString().then((body){
        debugPrint("|- data: $body");
      });
      return request;
    });

    // ===== response後 =====
    httpClient.addResponseModifier<Object?>((request, response) {
      debugPrint("|- Response: ${request.url.toString()}");
      response.headers?.forEach((name, values) {
        debugPrint("|- $name: $values");
      });
      debugPrint("|- data: ${response.body.toString()}");
      return response;
    });

    // 拿到的data可以預處理, ex. array to jsons
    httpClient.defaultDecoder = (body){
      if(body is String){
        try{
          body = jsonDecode(body);
        }catch(e){}
      }
      return body;
    };
  }
}