import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:school_enhancer_app/data/api_service/support/model/add_support_request_model.dart';
import 'package:school_enhancer_app/data/api_service/support/model/support_message_response_model.dart';
import 'package:school_enhancer_app/data/api_service/support/model/support_reply_request_model.dart';
import 'package:school_enhancer_app/data/api_service/support/model/support_response_model.dart';
import 'package:school_enhancer_app/data/models/success_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'support_api.g.dart';

@injectable
@RestApi()
abstract class SupportApi {
  @factoryMethod
  factory SupportApi(Dio dio) = _SupportApi;

  @GET("support")
  Future<List<SupportResponseModel>> getSupport();

  @POST("support")
  Future<SuccessResponseModel> addSupport(@Body() AddSupportRequestModel model);

  @POST("support/reply/{supportId}")
  Future<SuccessResponseModel> replySupport(
      @Path("supportId") String? supportId,
      @Body() SupportReplyRequestModel model);

  @GET("support/reply/{supportId}")
  Future<SupportMessageResponseModel> getMessageSupport(
      @Path("supportId") String? supportId);
}
