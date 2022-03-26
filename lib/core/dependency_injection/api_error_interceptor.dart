import 'package:dio/dio.dart';

import '../../data/models/api_failure.dart';

class ApiErrorInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response != null) {
      try {
        throw ApiFailure.fromJson(err.response!.data, err.requestOptions);
      } catch (e) {
        if (e is ApiFailure) {
          return handler.next(e);
        }

        return handler.next(
          ApiFailure(
            errors: [
              "Please check your internet connection and try again.",
            ],
            requestOptions: err.requestOptions,
          ),
        );
      }
    } else {
      return handler.next(
        ApiFailure(
          errors: [
            "Please check your internet connection and try again.",
          ],
          requestOptions: err.requestOptions,
        ),
      );
    }
  }
}
