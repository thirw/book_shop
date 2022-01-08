import 'package:book_shop/app/data/network/interceptors/api_request_interceptor.dart';
import 'package:book_shop/app/data/network/interceptors/api_response_interceptor.dart';
import 'package:dio/dio.dart';

class ApiConfig {
  static const BASE_URL = 'https://fyi-book-api.herokuapp.com/api';

  static BaseOptions opts = BaseOptions(
    baseUrl: BASE_URL,
    responseType: ResponseType.json,
  );

  static Dio addInterceptors(Dio dio) {
    return dio
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (
            RequestOptions options,
            RequestInterceptorHandler requestInterceptorHandler,
          ) async {
            await ApiRequestInterceptor.requestInterceptor(options);
            return requestInterceptorHandler.next(options);
          },
          onResponse: (response, handler) async {
            await ApiResponseInterceptor.responseInterceptor(response);
            return handler.next(response);
          },
          onError: (DioError e, ErrorInterceptorHandler errorInterceptorHandler) async {
            ApiResponseInterceptor.errorInterceptor(dio, e);
            return errorInterceptorHandler.next(e);
          }
        ),
      );
  }
}
