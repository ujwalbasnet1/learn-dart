import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:school_enhancer_app/data/api_service/annoucement/announcement_api.dart';
import 'package:school_enhancer_app/data/api_service/annoucement/model/announcement_response_model.dart';
import 'package:school_enhancer_app/data/models/api_failure.dart';

abstract class IAnnouncementRepository {
  Future<Either<ApiFailure, List<AnnouncementResponseModel>>>
      getAnnouncements();
}

@Injectable(as: IAnnouncementRepository)
class AnnouncementRepository implements IAnnouncementRepository {
  final AnnouncementApi? announcementApi;

  AnnouncementRepository(this.announcementApi);

  @override
  Future<Either<ApiFailure, List<AnnouncementResponseModel>>>
      getAnnouncements() async {
    try {
      final response = await announcementApi!.getAnnouncements();
      return Right(response);
    } on ApiFailure catch (e) {
      return Left(e);
    }
  }
}
