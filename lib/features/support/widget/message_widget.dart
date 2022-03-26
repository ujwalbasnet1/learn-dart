import 'package:school_enhancer_app/common/ui/ui_helper.dart';

class MessageWidgetModel {
  final String? createdAt;
  final String? text;
  final bool? sendByMe;

  MessageWidgetModel({this.createdAt, this.text, this.sendByMe});
}

class MessageWidget extends StatelessWidget {
  final MessageWidgetModel? model;
  final bool? isLoading;
  final bool? isError;

  const MessageWidget({Key? key, this.model, this.isLoading, this.isError})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context)
        .textTheme
        .subtitle2!
        .copyWith(fontWeight: FontWeight.w100);

    final dateStyle = Theme.of(context).textTheme.caption;

    if (model!.sendByMe!) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(model!.createdAt!, style: dateStyle),
              esHeightSpan,
              Container(
                padding: sPadding,
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.75,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.05),
                  borderRadius: esRadius,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (isError!)
                      Icon(
                        Icons.error,
                        color: Colors.red,
                        size: 20,
                      ),
                    if (isError!) sWidthSpan,
                    Flexible(
                      child: Text(
                        model!.text!,
                        style: textStyle.copyWith(
                            color: Theme.of(context).primaryColor),
                      ),
                    ),
                    if (isLoading!) sWidthSpan,
                    if (isLoading!)
                      Container(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                          )),
                  ],
                ),
              ),
            ],
          ),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(model!.createdAt!, style: dateStyle),
              esHeightSpan,
              Container(
                padding: sPadding,
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.75,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: esRadius,
                ),
                child: Text(
                  model!.text!,
                  style: textStyle.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      );
    }
  }
}
