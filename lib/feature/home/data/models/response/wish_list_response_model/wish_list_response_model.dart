import 'data.dart';

class WishListResponseModel {
  Data? data;
  String? message;
  List<dynamic>? error;
  int? status;

  WishListResponseModel({this.data, this.message, this.error, this.status});

  factory WishListResponseModel.fromJson(Map<String, dynamic> json) {
    return WishListResponseModel(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      error: json['error'] as List<dynamic>?,
      status: json['status'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'data': data?.toJson(),
        'message': message,
        'error': error,
        'status': status,
      };
}
