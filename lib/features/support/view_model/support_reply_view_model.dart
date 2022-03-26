import 'package:school_enhancer_app/common/service/toast_service.dart';
import 'package:school_enhancer_app/common/service/user_data_service.dart';
import 'package:school_enhancer_app/common/ui/ui_helper.dart';
import 'package:school_enhancer_app/core/dependency_injection/injection.dart';
import 'package:school_enhancer_app/data/api_service/support/model/support_message_response_model.dart';
import 'package:school_enhancer_app/data/api_service/support/model/support_reply_request_model.dart';
import 'package:school_enhancer_app/data/api_service/support/model/support_response_model.dart';
import 'package:school_enhancer_app/data/repository/support_repository.dart';
import 'package:stacked/stacked.dart';

class SupportReplyViewModel extends BaseViewModel {
  final ISupportRepository? _supportRepository =
      injection<ISupportRepository>();
  final ToastService? _toastService = injection<ToastService>();
  final UserDataService? _userDataService = injection<UserDataService>();

  SupportResponseModel? _support;
  SupportResponseModel? get support => _support;

  SupportMessageResponseModel? _messageSupport;
  SupportMessageResponseModel? get messageSupport => _messageSupport;

  TextEditingController controller = TextEditingController();

  initialize(SupportResponseModel support) {
    _support = support;
    getMessageSupport();
  }

  List<String>? _attachments;

  getMessageSupport() async {
    setError(null);
    setBusy(true);

    final response = await _supportRepository!.getMessageSupport(_support!.id);

    response.fold(
      (l) {
        setError(l.failure);
      },
      (r) {
        _messageSupport = r;
        notifyListeners();
      },
    );

    setBusy(false);
  }

  replySupport() async {
    if (controller.text.trim().isEmpty) return;

    // reply object, reply object should have unique id on the basis of datetime.now
    final replyObject = Replies(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        description: controller.text,
        attachments: _attachments,
        userId: _userDataService!.loginResponseModel!.payload!.id);
    //add to replies
    //set busy for object, reply object =true;

    _messageSupport!.lReplies!.insert(0, replyObject);
    controller.text = "";
    setBusyForObject(replyObject, true);

    final response = await _supportRepository!.replySupport(
      _support!.id,
      SupportReplyRequestModel(
        description: controller.text,
        attachments: _attachments,
      ),
    );

    response.fold((l) {
      setErrorForObject(replyObject, true);
    }, (r) {});

    setBusyForObject(replyObject, false);
  }

  messageSendBy(String? userId) {
    return _userDataService!.loginResponseModel!.payload!.id == userId;
  }
}
