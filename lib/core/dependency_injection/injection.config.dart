// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:stacked_services/stacked_services.dart' as _i3;

import '../../common/service/toast_service.dart' as _i17;
import '../../common/service/user_data_service.dart' as _i18;
import '../../data/api_service/annoucement/announcement_api.dart' as _i6;
import '../../data/api_service/attendance/attendance_api.dart' as _i8;
import '../../data/api_service/auth/auth_api.dart' as _i10;
import '../../data/api_service/profile/profile_api.dart' as _i12;
import '../../data/api_service/result/result_api.dart' as _i14;
import '../../data/api_service/support/support_api.dart' as _i16;
import '../../data/repository/announcement_repository.dart' as _i5;
import '../../data/repository/attendance_repository.dart' as _i7;
import '../../data/repository/auth_repository.dart' as _i9;
import '../../data/repository/profile_repository.dart' as _i11;
import '../../data/repository/result_repository.dart' as _i13;
import '../../data/repository/support_repository.dart' as _i15;
import 'third_party_module.dart'
    as _i19; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final thirdPartyModule = _$ThirdPartyModule();
  gh.lazySingleton<_i3.BottomSheetService>(
      () => thirdPartyModule.bottomSheetService);
  gh.lazySingleton<_i3.DialogService>(() => thirdPartyModule.dialogService);
  gh.lazySingleton<_i4.Dio>(() => thirdPartyModule.dio);
  gh.factory<_i5.IAnnouncementRepository>(
      () => _i5.AnnouncementRepository(get<_i6.AnnouncementApi>()));
  gh.factory<_i7.IAttendanceRepository>(
      () => _i7.AttendanceRepository(get<_i8.AttendanceApi>()));
  gh.factory<_i9.IAuthRepository>(
      () => _i9.AuthRepository(get<_i10.AuthApi>()));
  gh.factory<_i11.IProfileRepository>(
      () => _i11.ProfileRepository(get<_i12.ProfileApi>()));
  gh.factory<_i13.IResultRepository>(
      () => _i13.ResultRepository(get<_i14.ResultApi>()));
  gh.factory<_i15.ISupportRepository>(
      () => _i15.SupportRepository(get<_i16.SupportApi>()));
  gh.lazySingleton<_i3.NavigationService>(
      () => thirdPartyModule.navigationService);
  gh.factory<_i12.ProfileApi>(() => _i12.ProfileApi(get<_i4.Dio>()));
  gh.factory<_i14.ResultApi>(() => _i14.ResultApi(get<_i4.Dio>()));
  gh.lazySingleton<_i3.SnackbarService>(() => thirdPartyModule.snackBarService);
  gh.factory<_i16.SupportApi>(() => _i16.SupportApi(get<_i4.Dio>()));
  gh.factory<_i17.ToastService>(
      () => _i17.ToastService(get<_i3.SnackbarService>()));
  gh.lazySingleton<_i18.UserDataService>(() => _i18.UserDataService());
  gh.factory<_i6.AnnouncementApi>(() => _i6.AnnouncementApi(get<_i4.Dio>()));
  gh.factory<_i8.AttendanceApi>(() => _i8.AttendanceApi(get<_i4.Dio>()));
  gh.factory<_i10.AuthApi>(() => _i10.AuthApi(get<_i4.Dio>()));
  return get;
}

class _$ThirdPartyModule extends _i19.ThirdPartyModule {
  @override
  _i3.BottomSheetService get bottomSheetService => _i3.BottomSheetService();
  @override
  _i3.DialogService get dialogService => _i3.DialogService();
  @override
  _i3.NavigationService get navigationService => _i3.NavigationService();
  @override
  _i3.SnackbarService get snackBarService => _i3.SnackbarService();
}
