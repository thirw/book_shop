import 'package:dio/dio.dart';

class ApiRequestInterceptor {
  static dynamic requestInterceptor(RequestOptions options) async {
    return options;
  }
}