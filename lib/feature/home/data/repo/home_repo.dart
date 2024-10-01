import 'dart:developer';

import 'package:bokiaa/core/constant/constant.dart';
import 'package:bokiaa/core/services/dio_provider.dart';
import 'package:bokiaa/core/services/local_storage.dart';
import 'package:bokiaa/feature/home/data/models/response/best_seller_response_model/best_seller_response_model.dart';
import 'package:bokiaa/feature/home/data/models/response/cart_response_model/cart_response_model.dart';
import 'package:bokiaa/feature/home/data/models/response/home_banner_response_model/home_banner_response_model.dart';
import 'package:bokiaa/feature/home/data/models/response/wish_list_response_model/wish_list_response_model.dart';

class HomeRepo {
  //BestSeller

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

  //HomeBanner

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

  static Future<WishListResponseModel?> getWishList() async {
    try {
      var response = await DioProvider.get(
          endPoint: AppConstants.getWishListEndpoint,
          headers: {
            "Authorization":
                "Bearer ${AppLocalStorage.getData(key: AppLocalStorage.token)}"
          });
      if (response.statusCode == 200) {
        var model = WishListResponseModel.fromJson(response.data);
        log(model.toString());
        return model;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
    return null;
  }

  //WishList

  static Future<bool> addToWishList({required int productId}) async {
    try {
      var response = await DioProvider.post(
          endPoint: AppConstants.addToWishListEndpoint,
          data: {
            "product_id": productId
          },
          headers: {
            "Authorization":
                "Bearer ${AppLocalStorage.getData(key: AppLocalStorage.token)}"
          });
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }

  static Future<bool> removeFromWishList({required int productId}) async {
    try {
      var response = await DioProvider.post(
          endPoint: AppConstants.removeFromWishListEndpoint,
          data: {
            "product_id": productId,
          },
          headers: {
            "Authorization":
                "Bearer ${AppLocalStorage.getData(key: AppLocalStorage.token)}"
          });
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }

  static Future<CartResponseModel?> getCart() async {
    try {
      var response = await DioProvider.get(
          endPoint: AppConstants.getCartEndpoint,
          headers: {
            "Authorization":
                "Bearer ${AppLocalStorage.getData(key: AppLocalStorage.token)}"
          });
      if (response.statusCode == 200) {
        var model = CartResponseModel.fromJson(response.data);
        log(model.toString());
        return model;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
    return null;
  }

  //Cart

  static Future<bool> addToCart({required int productId}) async {
    try {
      var response = await DioProvider.post(
          endPoint: AppConstants.addToCartEndpoint,
          data: {
            "product_id": productId
          },
          headers: {
            "Authorization":
                "Bearer ${AppLocalStorage.getData(key: AppLocalStorage.token)}"
          });
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }

  static Future<bool> removeFromCart({required int cartId}) async {
    try {
      var response = await DioProvider.post(
          endPoint: AppConstants.removeFromCartEndpoint,
          data: {
            "cart_item_id": cartId,
          },
          headers: {
            "Authorization":
                "Bearer ${AppLocalStorage.getData(key: AppLocalStorage.token)}"
          });
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }
}
