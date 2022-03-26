import 'package:school_enhancer_app/common/service/toast_service.dart';
import 'package:school_enhancer_app/common/service/user_data_service.dart';
import 'package:school_enhancer_app/core/dependency_injection/injection.dart';
import 'package:school_enhancer_app/core/model/base_view_model.dart';
import 'package:school_enhancer_app/data/api_service/auth/models/login_request_model.dart';
import 'package:school_enhancer_app/data/repository/auth_repository.dart';
import 'package:school_enhancer_app/features/home/homepage.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  final NavigationService? _navigationService = injection<NavigationService>();
  final ToastService? _toastService = injection<ToastService>();
  final IAuthRepository? _authRepository = injection<IAuthRepository>();
  final UserDataService? _userDataService = injection<UserDataService>();

  login() async {
    // validate
    if (_phoneNumber.isEmpty) {
      _toastService!.e('Invalid phone number');
      return;
    }

    if (_password.isEmpty || _password.length < 6) {
      _toastService!.e('Password must be atleast 6 characters');
      return;
    }
    // set loading true
    setLoading(true);
    // login
    // login failure => error message

    final response = await _authRepository!.login(LoginRequestModel(
      phoneNumber: _phoneNumber,
      password: _password,
    ));

    response.fold(
      (l) => _toastService!.e(l.failure),
      (r) {
        _userDataService!.saveUser(r);
        _navigationService!.navigateToView(HomePage());
      },
    );

    // login success => home page
    //set loading false
    setLoading(false);
  }

  String _phoneNumber = "";
  String _password = "";

  void onPhoneChanged(String value) {
    _phoneNumber = value;
    notifyListeners();
  }

  void onPasswordChanged(String password) {
    _password = password;
    notifyListeners();
  }
}
