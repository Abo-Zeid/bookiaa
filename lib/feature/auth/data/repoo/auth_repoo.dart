import 'dart:developer';

import 'package:bokiaa/core/constant/constant.dart';
import 'package:bokiaa/core/services/dio_provider.dart';
import 'package:bokiaa/feature/auth/data/models/reguest/login_params.dart';
import 'package:bokiaa/feature/auth/data/models/reguest/register_params.dart';
import 'package:bokiaa/feature/auth/data/models/response/login_response_model/login_response_model.dart';

class AuthRepoo {
  static Future<LoginResponseModel?> register(RegisterParams params) async {
    try {
      var response = await DioProvider.post(
          endPoint: AppConstants.registerEndpoints, data: params.tojson());
      if (response.statusCode == 201) {
        var model = LoginResponseModel.fromJson(response.data);
        return model;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<LoginResponseModel?> login(LoginParames parames) async {
    try {
      var response = await DioProvider.post(
          endPoint: AppConstants.loginEndpoints, data: parames.tojson());
      if (response.statusCode == 200) {
        var model = LoginResponseModel.fromJson(response.data);
        return model;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
    return null;
  }
}
