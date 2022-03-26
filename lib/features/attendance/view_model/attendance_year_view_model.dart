import 'package:school_enhancer_app/core/dependency_injection/injection.dart';
import 'package:school_enhancer_app/data/api_service/attendance/model/attendance_month_response_model.dart';
import 'package:school_enhancer_app/data/api_service/attendance/model/attendance_year_response_model.dart';
import 'package:school_enhancer_app/data/repository/attendance_repository.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AttendanceViewModel extends BaseViewModel {
  final NavigationService? _navigationService = injection<NavigationService>();

  final IAttendanceRepository _attendanceRepository =
      injection<IAttendanceRepository>();

  List<AttendanceYearResponseModel>? _yearAttendances;
  List<AttendanceMonthResponseModel>? _monthAttendances;

  int _year = DateTime.now().year;
  int _month = DateTime.now().month;

  bool _monthMode = false;

  initialize() {
    if (_monthMode) {
      getAttendancesOfMonth();
    } else
      getAttendanceOfYear();
  }
}

extension MonthLogicModule on AttendanceViewModel {
  List<AttendanceMonthResponseModel>? get monthAttendances => _monthAttendances;

  getAttendancesOfMonth() async {
    setError(null);
    setBusy(true);

    final response = await _attendanceRepository.getAttendanceOfMonth(
        'e0ae325b-3d2c-4046-962d-20f8bb283761', 10, 2020);

    response.fold(
      (l) => setError(l.failure),
      (List<AttendanceMonthResponseModel> r) {
        _monthAttendances = r;
        notifyListeners();
      },
    );

    setBusy(false);
  }
}

extension YearLogicModule on AttendanceViewModel {
  List<AttendanceYearResponseModel> get yearAttendances =>
      _yearAttendances ?? [];

  double get percentSum {
    double sum = 0;
    _yearAttendances?.forEach((element) {
      sum += element.presentPercent;
    });
    return sum;
  }

  double get averagePercent {
    return percentSum / (_yearAttendances?.length ?? 1);
  }

  AttendanceYearResponseModel? get minPresentPercent {
    return _yearAttendances?.reduce((value, element) =>
        (value.presentPercent < element.presentPercent) ? value : element);
  }

  AttendanceYearResponseModel? get maxPresentPercent {
    return _yearAttendances?.reduce((value, element) =>
        (value.presentPercent > element.presentPercent) ? value : element);
  }

  getAttendanceOfYear() async {
    setError(null);
    setBusy(true);

    final response = await _attendanceRepository.getAttendanceOfYear(
        'e0ae325b-3d2c-4046-962d-20f8bb283761', year);

    response.fold(
      (l) => setError(l.failure),
      (List<AttendanceYearResponseModel> r) {
        _yearAttendances = r;
        notifyListeners();
      },
    );

    setBusy(false);
  }
}

extension UIModule on AttendanceViewModel {
  int get year => _year;
  int get month => _month;
  bool get monthMode => _monthMode;

  selectAttendanceMode(bool monthMode) {
    _monthMode = monthMode;
    notifyListeners();
  }

  nextMonth() {
    // _month == 12 / year = +1 month = 1
    _month = _month + 1;
    if (_month == 12) {
      _year = _year + 1;
      _month = 1;
    }
    getAttendancesOfMonth();
    notifyListeners();
  }

  previousMonth() {
    // _month == 1 / year = -1 month = 1
    _month = _month - 1;
    if (_month == 0) {
      _year = _year - 1;
      _month = 1;
    }
    getAttendancesOfMonth();
    notifyListeners();
  }

  nextYear() {
    _year = _year + 1;
    getAttendanceOfYear();
    notifyListeners();
  }

  previousYear() {
    _year = _year - 1;
    getAttendanceOfYear();
    notifyListeners();
  }
}
