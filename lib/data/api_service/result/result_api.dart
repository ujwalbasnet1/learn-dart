import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:school_enhancer_app/data/api_service/result/model/result_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'result_api.g.dart';

@injectable
@RestApi()
abstract class ResultApi {
  @factoryMethod
  factory ResultApi(Dio dio) = _ResultApi;

  @GET("result/{studentId}")
  Future<List<ResultResponseModel>> getResult(
      @Path("studentId") String studentId);
}
