import 'package:school_enhancer_app/common/ui/ui_helper.dart';

class SupportItemWidgetModel {
  final String? title;
  final String? date;
  final String? text;

  SupportItemWidgetModel({this.title, this.date, this.text});
}

class SupportItemWidget extends StatelessWidget {
  final SupportItemWidgetModel model;

  const SupportItemWidget({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context)
        .textTheme
        .subtitle1!
        .copyWith(fontWeight: FontWeight.bold);

    final dateStyle = Theme.of(context)
        .textTheme
        .caption!
        .copyWith(fontWeight: FontWeight.bold);

    final textStyle = Theme.of(context).textTheme.bodyText2;

    return KContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(model.title!, style: titleStyle),
          sHeightSpan,
          Text(model.date!, style: dateStyle),
          sHeightSpan,
          Text(model.text!,
              maxLines: 4, overflow: TextOverflow.ellipsis, style: textStyle),
        ],
      ),
    );
  }
}
