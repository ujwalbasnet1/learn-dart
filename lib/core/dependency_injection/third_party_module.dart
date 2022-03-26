import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:school_enhancer_app/common/service/user_data_service.dart';
import 'package:school_enhancer_app/core/config/http_config.dart';
import 'package:school_enhancer_app/core/dependency_injection/api_error_interceptor.dart';
import 'package:school_enhancer_app/core/dependency_injection/injection.dart';
import 'package:school_enhancer_app/data/models/api_failure.dart';
import 'package:stacked_services/stacked_services.dart';

import 'api_request_interceptor.dart';

@module
abstract class ThirdPartyModule {
  @lazySingleton
  NavigationService get navigationService;

  @lazySingleton
  DialogService get dialogService;

  @lazySingleton
  SnackbarService get snackBarService;

  @lazySingleton
  BottomSheetService get bottomSheetService;

  @lazySingleton
  Dio get dio {
    Dio dio = Dio(BaseOptions(baseUrl: HttpConfig.baseUrl));
    // dio.interceptors.add(LogInterceptor());
    dio.interceptors.add(ApiRequestInterceptor());
    dio.interceptors.add(ApiErrorInterceptor());

    return dio;
  }
}
