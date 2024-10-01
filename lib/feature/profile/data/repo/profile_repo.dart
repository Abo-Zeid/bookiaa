import 'dart:developer';

import 'package:bokiaa/core/constant/constant.dart';
import 'package:bokiaa/core/services/dio_provider.dart';
import 'package:bokiaa/core/services/local_storage.dart';
import 'package:bokiaa/feature/profile/data/models/profile_response_model/profile_response_model.dart';

class ProfileRepo {
  static Future<ProfileResponseModel?> getProfileDetails() async {
    try {
      var response = await DioProvider.get(
          endPoint: AppConstants.getProfileEndPoint,
          token: AppLocalStorage.getData(key: AppLocalStorage.token) ?? '');
      log("error $response ");
      if (response.statusCode == 200) {
        var model = ProfileResponseModel.fromJson(response.data);
        log(model.data?.image ?? "");
        return model;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
    return null;
  }
}
