import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:school_enhancer_app/data/api_service/profile/model/parent_profile_response_model.dart';
import 'package:school_enhancer_app/data/api_service/profile/profile_api.dart';
import 'package:school_enhancer_app/data/models/api_failure.dart';

abstract class IProfileRepository {
  Future<Either<ApiFailure, ParentProfileResponseModel>> getParentProfile(
      String? parentId);
}

@Injectable(as: IProfileRepository)
class ProfileRepository implements IProfileRepository {
  final ProfileApi? profileApi;

  ProfileRepository(this.profileApi);

  @override
  Future<Either<ApiFailure, ParentProfileResponseModel>> getParentProfile(
      String? parentId) async {
    try {
      final response = await profileApi!.getParentProfile(parentId);
      return Right(response);
    } on ApiFailure catch (e) {
      return Left(e);
    }
  }
}
