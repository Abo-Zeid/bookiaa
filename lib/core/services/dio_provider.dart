import 'package:bokiaa/core/constant/constant.dart';
import 'package:dio/dio.dart';

class DioProvider {
  static late Dio dio;
  static init() {
    dio = Dio(BaseOptions(baseUrl: AppConstants.baseUrl));
  }

  static Future<Response> get({required String endPoint}) {
    return dio.get(endPoint);
  }

  static Future<Response> post(
      {required String endPoint, required Map<String, dynamic>? data}) {
    return dio.post(endPoint, data: data);
  }

  static Future<Response> put({required String endPoint}) {
    return dio.put(endPoint);
  }

  static Future<Response> delete(
      {required String endPoint, required Map<String, dynamic>? data}) {
    return dio.delete(endPoint, data: data);
  }
}
