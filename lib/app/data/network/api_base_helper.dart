import 'package:book_shop/app/data/network/api_config/api_config.dart';
import 'package:dio/dio.dart';

class ApiBaseHelper {
  static Dio createDio() {
    return Dio(ApiConfig.opts);
  }

  static final dio = createDio();
  static final baseAPI = ApiConfig.addInterceptors(dio);

  Future<Response?> get({required String url}) async {
    try {
      Response response = await baseAPI.get(url);
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }

  Future<Response?> getQueryParameter({required String url,required Map<String, dynamic> queryParams}) async {
    try {
      Response response = await baseAPI.get(url, queryParameters: queryParams);
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }

  Future<Response?> post({required String url, dynamic data}) async {
    try {
      Response response = await baseAPI.post(url, data: data);
      return response;
    } on DioError catch (e) {
      print(e);
      return e.response;
    }
  }

  Future<Response?> put(String url, dynamic data) async {
    try {
      Response response = await baseAPI.put(url, data: data);
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }

  Future<Response?> delete(String url) async {
    try {
      Response response = await baseAPI.delete(url);
      return response;
    } on DioError catch (e) {
      return e.response;
    }

  }
}