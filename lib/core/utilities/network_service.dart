import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:task_manager_app/core/constants/api-const.dart';
import 'package:task_manager_app/core/utilities/storage_helper.dart';

abstract class NetworkService {
  Future<Response> get(String url,
      {Map<String, dynamic>? headers, queryParameters});
  Future<Response> post(String url, dynamic body,
      {Map<String, dynamic>? headers, queryParameters});
  Future<Response> put(String url, Map<String, dynamic> body,
      {Map<String, dynamic>? headers, queryParameters});
  Future<Response> delete(String url, {Map<String, dynamic>? headers});
}

class ApiHelper implements NetworkService {
  late final Dio dio;
  ApiHelper() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        receiveDataWhenStatusError: true,
        validateStatus: (status) {
          return status! < 600;
        },
      ),
    );
  }

  @override
  Future<Response> get(String url,
      {Map<String, dynamic>? headers,
      queryParameters,
      bool auth = true}) async {
    late Response response;
    for (int tries = 1; tries <= 2; tries++) {
      if (auth) {
        headers = await addAuthToken(headers);
      }
      response = await dio
          .get(
        url,
        options: Options(headers: headers),
        queryParameters: queryParameters ?? {},
      )
          .onError((DioError error, stackTrace) {
        if (error.type == DioErrorType.connectionTimeout ||
            error.type == DioErrorType.receiveTimeout) {
          throw DioError(
              requestOptions: error.requestOptions, error: "no internet");
        }
        throw error;
      });
      if (response.statusCode == 401 && auth) {
        log('*** refreshing token ***');
        await _refreshToken();
        continue;
      }
    }
    return response;
  }

  @override
  Future<Response> post(String url, dynamic body,
      {Map<String, dynamic>? headers,
      queryParameters,
      bool auth = true}) async {
    log("post method");
    if (auth) {
      headers = await addAuthToken(headers);
    }
    return await dio.post(url,
        data: body,
        options: Options(headers: headers),
        queryParameters: queryParameters);
  }

  @override
  Future<Response> put(String url, dynamic body,
      {Map<String, dynamic>? headers,
      queryParameters,
      bool auth = true}) async {
    log("put method");
    if (auth) {
      headers = await addAuthToken(headers);
    }
    final response = await dio
        .put(url,
            data: body,
            options: Options(headers: headers),
            queryParameters: queryParameters)
        .onError((DioError error, stackTrace) {
      if (error.type == DioErrorType.connectionTimeout ||
          error.type == DioErrorType.receiveTimeout) {
        throw DioError(
            requestOptions: error.requestOptions, error: "no internet");
      }
      throw error;
    });
    return response;
  }

  @override
  Future<Response> delete(String url,
      {Map<String, dynamic>? headers, bool auth = true}) async {
    log("delete method");
    if (auth) {
      headers = await addAuthToken(headers);
    }
    return await dio.delete(url, options: Options(headers: headers));
  }

  Future<Map<String, dynamic>> addAuthToken(
      Map<String, dynamic>? headers) async {
    String token =
        await StorageHelper.readFromSecureStorage(ApiConstants.tokenAttribute);
    if (headers != null) {
      headers['Authorization'] = "Bearer $token";
    } else {
      headers = {'Authorization': "Bearer $token"};
    }
    return headers;
  }

  Future _refreshToken() async {
    final refreshToken =
        await StorageHelper.readFromSecureStorage(ApiConstants.tokenAttribute);
    await dio
        .post(
      ApiConstants.refreshToken,
      data: json.encode({
        "expiresInMins": 30,
      }),
      options: Options(
        headers: {'Authorization': 'Bearer $refreshToken'},
      ),
    )
        .then((response) async {
      await StorageHelper.writeToSecureStorage(ApiConstants.tokenAttribute,
          response.data[ApiConstants.refreshToken]);
      await StorageHelper.writeToSecureStorage(
          ApiConstants.refreshTokenAttribute,
          response.data[ApiConstants.refreshTokenAttribute]);
    });
  }
}
