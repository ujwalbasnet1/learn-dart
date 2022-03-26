import 'package:school_enhancer_app/common/service/custom_dialogs.dart';
import 'package:school_enhancer_app/common/service/user_data_service.dart';
import 'package:school_enhancer_app/core/dependency_injection/injection.dart';
import 'package:school_enhancer_app/core/model/base_view_model.dart';
import 'package:school_enhancer_app/data/api_service/support/model/support_response_model.dart';
import 'package:school_enhancer_app/data/repository/support_repository.dart';
import 'package:school_enhancer_app/features/support/dialog.dart';
import 'package:school_enhancer_app/features/support/support_message.dart';
import 'package:stacked_services/stacked_services.dart';

class SupportViewModel extends BaseViewModel {
  final UserDataService? _userDataService = injection<UserDataService>();
  final NavigationService? _navigationService = injection<NavigationService>();
  final ISupportRepository? _supportRepository =
      injection<ISupportRepository>();

  List<SupportResponseModel>? _supports;

  List<SupportResponseModel>? get supports => _supports;

  getSupport() async {
    setFailure(null);
    setLoading(true);

    final response = await _supportRepository!.getSupport();

    response.fold((l) {
      setFailure(l.failure);
    }, (r) {
      _supports = r;
      notifyListeners();
    });

    setLoading(false);
  }

  void addSupport() async {
    final result = await showKDialog(AddSupportDialog());

    if (result != null && result is DialogResponse && result.confirmed) {
      getSupport();
    }
  }

  void onSupportClick(SupportResponseModel support) {
    _navigationService!.navigateToView(SupportMessagePage(support: support));
  }
}
