// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str, int status) =>
    LoginResponse.fromJson(json.decode(str), status);

class LoginResponse {
  int? id;
  String? username;
  String? email;
  String? firstName;
  String? lastName;
  String? gender;
  String? image;
  String? token;
  int? status;

  LoginResponse(
      {this.id,
      this.username,
      this.email,
      this.firstName,
      this.lastName,
      this.gender,
      this.image,
      this.token,
      this.status});

  factory LoginResponse.fromJson(Map<String, dynamic> json, status) =>
      LoginResponse(
          id: json["id"],
          username: json["username"],
          email: json["email"],
          firstName: json["firstName"],
          lastName: json["lastName"],
          gender: json["gender"],
          image: json["image"],
          token: json["token"],
          status: status);
}
