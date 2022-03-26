import 'package:school_enhancer_app/common/service/user_data_service.dart';
import 'package:school_enhancer_app/core/dependency_injection/injection.dart';
import 'package:school_enhancer_app/core/model/base_view_model.dart';
import 'package:school_enhancer_app/features/home/homepage.dart';
import 'package:school_enhancer_app/features/login/login.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashViewModel extends BaseViewModel {
  final UserDataService? _userDataService = injection<UserDataService>();
  final NavigationService? _navigationService = injection<NavigationService>();

  splash() async {
    await Future.delayed(Duration(seconds: 2));

    _userDataService!.retrieveUser();

    if (_userDataService!.loginResponseModel == null) {
      //login
      _navigationService!.navigateToView(LoginPage());
    } else {
      //todo :home
      _navigationService!.navigateToView(HomePage());
    }
  }
}
