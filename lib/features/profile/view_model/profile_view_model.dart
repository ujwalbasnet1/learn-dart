import 'package:school_enhancer_app/common/service/user_data_service.dart';
import 'package:school_enhancer_app/core/dependency_injection/injection.dart';
import 'package:school_enhancer_app/core/model/base_view_model.dart';
import 'package:school_enhancer_app/data/api_service/profile/model/parent_profile_response_model.dart';
import 'package:school_enhancer_app/data/repository/profile_repository.dart';

class ProfileViewModel extends BaseViewModel {
  final UserDataService? _userDataService = injection<UserDataService>();
  final IProfileRepository? _profileRepository =
      injection<IProfileRepository>();

  ParentProfileResponseModel? _profileResponseModel;
  ParentProfileResponseModel? get profileResponseModel => _profileResponseModel;

  getProfile() async {
    //loading true
    setLoading(true);
    //get profile

    final parentId = _userDataService!.loginResponseModel?.payload?.id;
    print(parentId);
    final response = await _profileRepository!.getParentProfile(parentId);
    //error
    //success
    response.fold(
      (l) {
        setFailure(l.failure);
      },
      (r) {
        _profileResponseModel = r;
        notifyListeners();
      },
    );
    //loading false
    setLoading(false);
  }
}
