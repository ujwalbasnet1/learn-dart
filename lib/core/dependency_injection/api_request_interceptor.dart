import 'package:dio/dio.dart';
import 'package:school_enhancer_app/common/service/user_data_service.dart';

class ApiRequestInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({
      'Authorization':
          'Bearer ${UserDataService().loginResponseModel?.accessToken ?? ""}',
      'Content-Type': 'application/json; charset=utf-8',
      'Accept': 'application/json, */*',
    });

    return handler.next(options);
  }
}
