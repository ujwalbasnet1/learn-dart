import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:school_enhancer_app/data/api_service/result/model/result_response_model.dart';
import 'package:school_enhancer_app/data/api_service/result/result_api.dart';
import 'package:school_enhancer_app/data/models/api_failure.dart';

abstract class IResultRepository {
  Future<Either<ApiFailure, List<ResultResponseModel>>> getResult(
      String studentId);
}

@Injectable(as: IResultRepository)
class ResultRepository implements IResultRepository {
  final ResultApi? _resultApi;

  ResultRepository(this._resultApi);

  @override
  Future<Either<ApiFailure, List<ResultResponseModel>>> getResult(
      String studentId) async {
    try {
      final response = await _resultApi!.getResult(studentId);
      return Right(response);
    } on ApiFailure catch (e) {
      return Left(e);
    }
  }
}
