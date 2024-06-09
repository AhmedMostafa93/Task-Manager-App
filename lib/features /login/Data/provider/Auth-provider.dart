import 'dart:convert';

import 'package:dio/src/response.dart';
import 'package:task_manager_app/core/constants/api-const.dart';
import 'package:task_manager_app/core/networking/network_service.dart';

class AuthProvider {
  final ApiHelper apiHelper;

  AuthProvider(this.apiHelper);
  Future<Response> loginProvider(
      {final String? username, final String? password}) async {
    return await apiHelper.post(
      ApiConstants.login,
      json.encode({"username": username, "password": password}),
    );
  }
}
