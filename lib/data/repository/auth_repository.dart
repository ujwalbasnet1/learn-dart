import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:school_enhancer_app/data/api_service/auth/auth_api.dart';
import 'package:school_enhancer_app/data/api_service/auth/models/login_request_model.dart';
import 'package:school_enhancer_app/data/api_service/auth/models/login_response_model.dart';
import 'package:school_enhancer_app/data/models/api_failure.dart';

abstract class IAuthRepository {
  Future<Either<ApiFailure, LoginResponseModel>> login(LoginRequestModel model);
}

@Injectable(as: IAuthRepository)
class AuthRepository implements IAuthRepository {
  final AuthApi? authApi;

  AuthRepository(this.authApi);
  @override
  Future<Either<ApiFailure, LoginResponseModel>> login(
      LoginRequestModel model) async {
    try {
      final response = await authApi!.login(model);
      return Right(response);
    } on ApiFailure catch (e) {
      return Left(e);
    }
  }
}
