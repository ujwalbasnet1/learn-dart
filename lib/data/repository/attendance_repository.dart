import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:school_enhancer_app/data/api_service/attendance/attendance_api.dart';
import 'package:school_enhancer_app/data/api_service/attendance/model/attendance_month_response_model.dart';
import 'package:school_enhancer_app/data/api_service/attendance/model/attendance_year_response_model.dart';
import 'package:school_enhancer_app/data/models/api_failure.dart';

abstract class IAttendanceRepository {
  Future<Either<ApiFailure, List<AttendanceYearResponseModel>>>
      getAttendanceOfYear(String userId, int year);
  Future<Either<ApiFailure, List<AttendanceMonthResponseModel>>>
      getAttendanceOfMonth(String userId, int month, int year);
}

@Injectable(as: IAttendanceRepository)
class AttendanceRepository implements IAttendanceRepository {
  final AttendanceApi? attendanceApi;

  AttendanceRepository(this.attendanceApi);

  @override
  Future<Either<ApiFailure, List<AttendanceYearResponseModel>>>
      getAttendanceOfYear(String userId, int year) async {
    try {
      final response = await attendanceApi!.getAttendanceOfYear(userId, year);
      return Right(response);
    } on ApiFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<ApiFailure, List<AttendanceMonthResponseModel>>>
      getAttendanceOfMonth(String userId, int month, int year) async {
    try {
      final response =
          await attendanceApi!.getAttendanceOfMonth(userId, month, year);
      return Right(response);
    } on ApiFailure catch (e) {
      return Left(e);
    }
  }
}
