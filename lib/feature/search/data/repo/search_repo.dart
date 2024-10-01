import 'dart:developer';

import 'package:bokiaa/core/constant/constant.dart';
import 'package:bokiaa/core/services/dio_provider.dart';
import 'package:bokiaa/feature/search/data/models/response/search_response_model/search_response_model.dart';

class SearchRepo {
  static Future<SearchResponseModel?> getSearchBooks(String searchName) async {
    try {
      var response = await DioProvider.get(
        endPoint: AppConstants.getSearchEndPoint,
        query: {"name": searchName},
      );
      log("Response: $searchName");
      if (response.statusCode == 200) {
        var model = SearchResponseModel.fromJson(response.data);
        log("Sucsess${model.data?.products?.length}");

        return model;
      } else {
        log("Error: Unexpected status code: ${response.statusCode}");
      }
    } catch (e) {
      log("Error in API request: $e");
    }
    return null;
  }
}
