import 'dart:convert';
import 'dart:developer';

import 'package:bokiaa/core/constant/constant.dart';
import 'package:bokiaa/feature/auth/data/models/reguest/login_params.dart';
import 'package:bokiaa/feature/auth/data/models/reguest/register_params.dart';
import 'package:bokiaa/feature/auth/data/models/response/login_response_model/login_response_model.dart';
import 'package:bokiaa/feature/auth/data/models/response/register_response_model/register_response_model.dart';
import 'package:http/http.dart' as http;

class AuthRepoo {
  static Future<RegisterResponseModel?> register(RegisterParams params) async {
    try {
      Uri url =
          Uri.parse(AppConstants.baseUrl + AppConstants.registerEndpoints);
      var response = await http.post(url, body: params.tojson());
      if (response.statusCode == 201) {
        var jsonresponse = jsonDecode(response.body);
        return RegisterResponseModel.fromJson(jsonresponse);
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
    return null;
  }

  static Future<LoginResponseModel?> login(
    LoginParames parames,
  ) async {
    try {
      Uri url = Uri.parse(AppConstants.baseUrl + AppConstants.loginEndpoints);
      var response = await http.post(url, body: parames.tojson());
      if (response.statusCode == 201) {
        var jsonresponse = jsonDecode(response.body);
        return LoginResponseModel.fromJson(jsonresponse);
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
    return null;
  }
}
