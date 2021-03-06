import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project_flutter/mydomain/Mydomain.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<dynamic> get(BuildContext context, String api, dynamic params) async {
  var dio = Dio();
  dio.options.baseUrl = '${Mydomain().domain}/';
  dio.options.validateStatus = (status) {
    return status! < 500;
  };
  print(dio.options.baseUrl);
  var response = await dio.get(api, queryParameters: params);
  print(response.data);
  if (response.statusCode! < 300) {
    var result = json.decode(response.data);
    return result;
  } else {
    return null;
  }
}

Future<dynamic> delete(BuildContext context, String api, dynamic params) async {
  var dio = Dio();
  dio.options.baseUrl = '${Mydomain().domain}/';
  dio.options.validateStatus = (status) {
    return status! < 500;
  };
  var response = await dio.delete(api, queryParameters: params);
  if (response.statusCode! < 300) {
    var result = json.decode(response.data);
    return result;
  } else {
    return null;
  }
}

Future<dynamic> put(BuildContext context, String api, dynamic params) async {
  try {
    var dio = Dio();
    dio.options.baseUrl = '${Mydomain().domain}/';
    dio.options.validateStatus = (status) {
      return status! < 500;
    };
    var response = await dio.put(api, queryParameters: params);

    if (response.statusCode! < 300) {
      var result = json.decode(response.data);
      return result;
    } else {
      return null;
    }
  } catch (e) {
    print(e.runtimeType);
    return null;
  }
}

Future<dynamic> post(BuildContext context, String api, dynamic params) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  try {
    var dio = Dio();
    dio.options.baseUrl = '${Mydomain().domain}/';
    dio.options.contentType= Headers.formUrlEncodedContentType;
    dio.options.validateStatus = (status) {
      return status! < 500;
    };
    var response = await dio.post(api, data: params);
    print(response.data);
    print('aowkdoawkdoawkdo');
    print(response.statusCode);
    if (response.statusCode! < 300) {
      var result = json.decode(response.data);
      return result;
    } else {
      return null;
    }
  } catch (e) {
    print(e.runtimeType);
    return null;
  }
}
