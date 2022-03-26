import 'package:school_enhancer_app/core/dependency_injection/injection.dart';
import 'package:school_enhancer_app/data/api_service/annoucement/model/announcement_response_model.dart';
import 'package:school_enhancer_app/data/repository/announcement_repository.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AnnouncementViewModel extends BaseViewModel {
  final NavigationService? _navigationService = injection<NavigationService>();

  final IAnnouncementRepository? _announcementRepository =
      injection<IAnnouncementRepository>();

  List<AnnouncementResponseModel>? _announcements;
  List<AnnouncementResponseModel>? get announcements => _announcements;

  List<AnnouncementCategory?> get categories {
    if (announcements == null) {
      return [];
    }

    List<AnnouncementCategory?> categories = _announcements!
        .map((e) {
          return e.category;
        })
        .toSet()
        .toList();

    return categories..insert(0, AnnouncementCategory(title: "All items"));
  }

  List<AnnouncementResponseModel>? getAnnouncementOfType(
      AnnouncementCategory e) {
    if (e.title == "All items") {
      return announcements;
    }

    return announcements!.where((element) {
      return element.category!.title == e.title;
    }).toList();
  }

  getAnnouncements() async {
    // set loading true
    setError(null);
    setBusy(true);

    final response = await _announcementRepository!.getAnnouncements();

    response.fold(
      (l) => setError(l.failure),
      (List<AnnouncementResponseModel> r) {
        _announcements = r;
        notifyListeners();
      },
    );

    //set loading false
    setBusy(false);
  }
}
