import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import 'models/login_request_model.dart';
import 'models/login_response_model.dart';

part 'auth_api.g.dart';

@injectable
@RestApi()
abstract class AuthApi {
  @factoryMethod
  factory AuthApi(Dio dio) = _AuthApi;

  @POST("auth/login")
  Future<LoginResponseModel> login(@Body() LoginRequestModel model);
}
