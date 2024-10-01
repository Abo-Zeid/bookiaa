import 'package:bokiaa/core/constant/constant.dart';
import 'package:dio/dio.dart';

class DioProvider {
  static late Dio dio;
  static init() {
    dio = Dio(BaseOptions(baseUrl: AppConstants.baseUrl));
  }

  static Future<Response> get(
      {required String endPoint,
      String? token,
      Map<String, dynamic>? query,
      Map<String, dynamic>? headers}) {
    dio.options.headers = {
      'content-type': 'application/json',
      'authorization': 'Bearer $token',
    };
    return dio.get(endPoint,
        queryParameters: query, options: Options(headers: headers));
  }

  static Future<Response> post(
      {required String endPoint,
      Map<String, dynamic>? data,
      Map<String, dynamic>? headers}) {
    return dio.post(endPoint, data: data, options: Options(headers: headers));
  }

  static Future<Response> put(
      {required String endPoint, Map<String, dynamic>? headers}) {
    return dio.put(endPoint, options: Options(headers: headers));
  }

  static Future<Response> delete(
      {required String endPoint, required Map<String, dynamic>? headers}) {
    return dio.delete(endPoint, options: Options(headers: headers));
  }
}
