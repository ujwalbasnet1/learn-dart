import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:school_enhancer_app/data/api_service/attendance/model/attendance_month_response_model.dart';
import 'package:school_enhancer_app/data/api_service/attendance/model/attendance_year_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'attendance_api.g.dart';

@injectable
@RestApi()
abstract class AttendanceApi {
  @factoryMethod
  factory AttendanceApi(Dio dio) = _AttendanceApi;

  @GET("attendance")
  Future<List<AttendanceYearResponseModel>> getAttendanceOfYear(
    @Query("userId") String userId,
    @Query("year") int year,
  );

  @GET("attendance")
  Future<List<AttendanceMonthResponseModel>> getAttendanceOfMonth(
    @Query("userId") String userId,
    @Query("month") int month,
    @Query("year") int year,
  );
}
