import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:school_enhancer_app/data/api_service/profile/model/parent_profile_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'profile_api.g.dart';

@injectable
@RestApi()
abstract class ProfileApi {
  @factoryMethod
  factory ProfileApi(Dio dio) = _ProfileApi;

  @GET("parent/{id}")
  Future<ParentProfileResponseModel> getParentProfile(
      @Path("id") String? parentId);
}
