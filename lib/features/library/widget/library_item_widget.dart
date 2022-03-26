import 'package:school_enhancer_app/common/ui/ui_helper.dart';

class LibraryItemWidgetModel {
  final String? book;
  final String? issuedDate;
  final String? dueDate;
  final String? issuedBy;

  LibraryItemWidgetModel(
      {this.book, this.issuedDate, this.dueDate, this.issuedBy});
}

class LibraryItemWidget extends StatelessWidget {
  final LibraryItemWidgetModel? model;

  const LibraryItemWidget({Key? key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.subtitle1!;
    final textStyle = Theme.of(context).textTheme.subtitle2!;

    return KContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            model!.book!,
            style: titleStyle.copyWith(fontWeight: FontWeight.bold),
          ),
          sHeightSpan,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Issued Date', style: textStyle),
              Text(model!.issuedDate!,
                  style: textStyle.copyWith(
                    fontWeight: FontWeight.bold,
                  ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Due Date', style: textStyle),
              Text(model!.dueDate!,
                  style: textStyle.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.red))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Issued By', style: textStyle.copyWith()),
              Text(model!.issuedBy!,
                  style: textStyle.copyWith(
                    fontWeight: FontWeight.bold,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
