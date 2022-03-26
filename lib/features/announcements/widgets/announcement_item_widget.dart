import 'package:school_enhancer_app/common/ui/ui_helper.dart';

class AnnouncementItemWidgetModel {
  final String? title;
  final String? createdAt;

  AnnouncementItemWidgetModel({this.title, this.createdAt});
}

class AnnouncementItemWidget extends StatelessWidget {
  final AnnouncementItemWidgetModel model;

  const AnnouncementItemWidget({Key? key, required this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context)
        .textTheme
        .subtitle2!
        .copyWith(fontWeight: FontWeight.bold);

    final dateStyle = Theme.of(context)
        .textTheme
        .caption!
        .copyWith(fontWeight: FontWeight.bold, color: Colors.black38);

    return Container(
      padding: mPadding,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.05),
        border: Border.all(
          color: Theme.of(context).primaryColor,
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(model.title!, style: titleStyle),
          mHeightSpan,
          Text(model.createdAt!, style: dateStyle),
        ],
      ),
    );
  }
}
