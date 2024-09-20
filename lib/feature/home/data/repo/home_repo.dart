import 'dart:developer';

import 'package:bokiaa/core/constant/constant.dart';
import 'package:bokiaa/core/services/dio_provider.dart';
import 'package:bokiaa/feature/home/data/models/response/best_seller_response_model/best_seller_response_model.dart';
import 'package:bokiaa/feature/home/data/models/response/home_banner_response_model/home_banner_response_model.dart';

class HomeRepo {
  static Future<BestSellerResponseModel?> getBestSellerBooks() async {
    try {
      var response =
          await DioProvider.get(endPoint: AppConstants.getBestSellerEndPoint);
      if (response.statusCode == 200) {
        var model = BestSellerResponseModel.fromJson(response.data);
        return model;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<HomeBannerResponseModel?> getHomeBanner() async {
    try {
      var response =
          await DioProvider.get(endPoint: AppConstants.getHomeBannerEndPoint);
      if (response.statusCode == 200) {
        var model = HomeBannerResponseModel.fromJson(response.data);
        return model;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
    return null;
  }
}
