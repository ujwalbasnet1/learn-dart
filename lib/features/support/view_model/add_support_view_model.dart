import 'package:school_enhancer_app/common/service/toast_service.dart';
import 'package:school_enhancer_app/core/dependency_injection/injection.dart';
import 'package:school_enhancer_app/core/model/base_view_model.dart';
import 'package:school_enhancer_app/data/api_service/support/model/add_support_request_model.dart';
import 'package:school_enhancer_app/data/repository/support_repository.dart';
import 'package:stacked_services/stacked_services.dart';

class AddSupportViewModel extends BaseViewModel {
  final NavigationService? _navigationService = injection<NavigationService>();
  final ISupportRepository? _supportRepository = injection<ISupportRepository>();
  final ToastService? _toastService = injection<ToastService>();

  String? _description;
  void onDescriptionChanged(String value) {
    _description = value;
  }

  String? _subject;
  String? get subject => _subject;

  void onSubjectChanged(String? value) {
    _subject = value;
    notifyListeners();
  }

  List<String> _subjects = ["Examination Date", "Fee Structure"];
  List<String> get subjects => _subjects;

  addSupport() async {
    if (subject == null) {
      _toastService!.e('Please select any one subject.');
      return;
    }
    setLoading(true);

    final response = await _supportRepository!.addSupport(
        AddSupportRequestModel(subject: _subject, description: _description));

    response.fold((l) {
      _toastService!.e(l.failure);
    }, (r) {
      _toastService!.s(r.message!);
      _navigationService!.back(
        result: DialogResponse(confirmed: true),
      );
    });

    setLoading(false);
  }
}
