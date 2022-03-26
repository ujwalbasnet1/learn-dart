import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:school_enhancer_app/data/api_service/annoucement/model/announcement_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'announcement_api.g.dart';

@injectable
@RestApi()
abstract class AnnouncementApi {
  @factoryMethod
  factory AnnouncementApi(Dio dio) = _AnnouncementApi;

  @GET("announcement")
  Future<List<AnnouncementResponseModel>> getAnnouncements();
}
