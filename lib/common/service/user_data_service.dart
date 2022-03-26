import 'package:injectable/injectable.dart';
import 'package:school_enhancer_app/core/cache/local_cache_service.dart';
import 'package:school_enhancer_app/data/api_service/auth/models/login_response_model.dart';

@lazySingleton
class UserDataService {
  LoginResponseModel? _loginResponseModel;
  LoginResponseModel? get loginResponseModel => _loginResponseModel;

  saveUser(LoginResponseModel model) {
    _loginResponseModel = model;
    LocalCacheService.store("user", model.toJson());
  }

  retrieveUser() {
    final response = LocalCacheService.retrieve("user");
    if (response == null) {
      return null;
    }
    _loginResponseModel = LoginResponseModel.fromJson(response);
  }
}
