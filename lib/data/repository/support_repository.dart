import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:school_enhancer_app/data/api_service/support/model/add_support_request_model.dart';
import 'package:school_enhancer_app/data/api_service/support/model/support_message_response_model.dart';
import 'package:school_enhancer_app/data/api_service/support/model/support_reply_request_model.dart';
import 'package:school_enhancer_app/data/api_service/support/model/support_response_model.dart';
import 'package:school_enhancer_app/data/api_service/support/support_api.dart';
import 'package:school_enhancer_app/data/models/api_failure.dart';
import 'package:school_enhancer_app/data/models/success_response_model.dart';

abstract class ISupportRepository {
  Future<Either<ApiFailure, List<SupportResponseModel>>> getSupport();
  Future<Either<ApiFailure, SuccessResponseModel>> addSupport(
      AddSupportRequestModel model);
  Future<Either<ApiFailure, SuccessResponseModel>> replySupport(
      String? supportId, SupportReplyRequestModel model);
  Future<Either<ApiFailure, SupportMessageResponseModel>> getMessageSupport(
      String? supportId);
}

@Injectable(as: ISupportRepository)
class SupportRepository implements ISupportRepository {
  final SupportApi? supportApi;

  SupportRepository(this.supportApi);

  @override
  Future<Either<ApiFailure, List<SupportResponseModel>>> getSupport() async {
    try {
      final response = await supportApi!.getSupport();
      return Right(response);
    } on ApiFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<ApiFailure, SuccessResponseModel>> addSupport(
      AddSupportRequestModel model) async {
    try {
      final response = await supportApi!.addSupport(model);
      return Right(response);
    } on ApiFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<ApiFailure, SuccessResponseModel>> replySupport(
      String? supportId, SupportReplyRequestModel model) async {
    try {
      final response = await supportApi!.replySupport(supportId, model);
      return Right(response);
    } on ApiFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<ApiFailure, SupportMessageResponseModel>> getMessageSupport(
      String? supportId) async {
    try {
      final response = await supportApi!.getMessageSupport(supportId);
      return Right(response);
    } on ApiFailure catch (e) {
      return Left(e);
    }
  }
}
