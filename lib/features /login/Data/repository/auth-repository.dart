import 'dart:convert';

import 'package:task_manager_app/core/constants/api-const.dart';
import 'package:task_manager_app/core/networking/network_service.dart';
import 'package:task_manager_app/features%20/login/Data/model/login-response.dart';
import 'package:task_manager_app/features%20/login/Data/provider/Auth-provider.dart';

class AuthRepository {
  late final AuthProvider authenticationProvider;

  AuthRepository() {
    final ApiHelper apiHelper = ApiHelper();
    authenticationProvider = AuthProvider(apiHelper);
  }

  Future<LoginResponse> loginProvider(
      {final String? username, final String? password}) async {
    final response = await authenticationProvider.loginProvider(
        username: username, password: password);

    return LoginResponse.fromJson(response.data, response.statusCode);
  }
}
