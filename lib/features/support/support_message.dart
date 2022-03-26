import 'package:intl/intl.dart';
import 'package:school_enhancer_app/common/ui/ui_helper.dart';
import 'package:school_enhancer_app/common/ui/widgets/error_widget.dart';
import 'package:school_enhancer_app/data/api_service/support/model/support_response_model.dart';
import 'package:school_enhancer_app/features/support/view_model/support_reply_view_model.dart';
import 'package:school_enhancer_app/features/support/widget/message_widget.dart';
import 'package:stacked/stacked.dart';

class SupportMessagePage extends StatelessWidget {
  final SupportResponseModel support;

  const SupportMessagePage({Key? key, required this.support}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SupportReplyViewModel>.reactive(
        onModelReady: (model) => model.initialize(support),
        viewModelBuilder: () => SupportReplyViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            appBar: _appBar(context),
            body: Column(
              children: [
                Expanded(
                  child: _body(context, model),
                ),
                _sendMessage(context, model),
              ],
            ),
          );
        });
  }

  _sendMessage(BuildContext context, SupportReplyViewModel model) {
    return Container(
      padding: mXPadding,
      margin: sPadding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.black12),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: model.controller,
              style: Theme.of(context).textTheme.subtitle2,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                hintText: 'Write your reply here...',
                border: InputBorder.none,
              ),
              minLines: 1,
              maxLines: 4,
            ),
          ),
          sWidthSpan,
          IconButton(
            onPressed: () {
              model.replySupport();
            },
            icon: Icon(
              Icons.send,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  _appBar(BuildContext context) {
    final appBarTitleStyle = Theme.of(context).textTheme.subtitle1!.copyWith(
          color: Colors.white,
        );

    final appBarDateStyle = Theme.of(context).textTheme.subtitle2!.copyWith(
          color: Colors.white70,
        );

    return KAppBar(
      toolbarHeight: 86,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Support Replies', style: appBarDateStyle),
          Text(support.subject!, style: appBarTitleStyle),
        ],
      ),
    );
  }

  _body(BuildContext context, SupportReplyViewModel model) {
    if (model.isBusy) {
      return Center(child: CircularProgressIndicator());
    } else if (model.hasError) {
      return KErrorWidget(error: model.modelError);
    } else
      return ListView.separated(
        reverse: true,
        padding: sPadding,
        itemCount: model.messageSupport!.lReplies!.length,
        itemBuilder: (context, index) {
          final reply = model.messageSupport!.lReplies![index];
          //todo
          return MessageWidget(
            isLoading: model.busy(reply),
            isError: model.error(reply) ?? false,
            model: MessageWidgetModel(
              // createdAt: DateFormat("hh:mm aa, dd MMM, yyy")
              //     .format(DateTime.parse(reply.createdYet)),
              //todo: uncomment
              createdAt: DateFormat("hh:mm aa, dd MMM, yyy")
                  .format(DateTime.parse(model.messageSupport!.createdAt!)),
              text: reply.description,
              sendByMe: model.messageSendBy(reply.userId),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => sHeightSpan,
      );
  }
}
