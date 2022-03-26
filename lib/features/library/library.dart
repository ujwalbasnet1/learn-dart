import 'package:school_enhancer_app/common/service/custom_bottom_sheets.dart';
import 'package:school_enhancer_app/common/ui/ui_helper.dart';
import 'package:school_enhancer_app/features/library/widget/library_item_widget.dart';

class LibraryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.subtitle1!;

    return Scaffold(
      appBar: _appBar(context),
      body: SingleChildScrollView(
        padding: mPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                      text: 'Issued Books ',
                      style: titleStyle.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w500)),
                  TextSpan(
                      text: '(3)',
                      style: titleStyle.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            lHeightSpan,
            LibraryItemWidget(
              model: LibraryItemWidgetModel(
                  book: 'Numerical Physics',
                  issuedDate: 'Dec 20, 2021',
                  dueDate: 'Dec 25, 2021',
                  issuedBy: 'Ujwal Basnet'),
            ),
            mHeightSpan,
            LibraryItemWidget(
              model: LibraryItemWidgetModel(
                  book: 'Simplified Chemistry',
                  issuedDate: 'Dec 20, 2021',
                  dueDate: 'Dec 25, 2021',
                  issuedBy: 'Ujwal Basnet'),
            ),
            mHeightSpan,
            LibraryItemWidget(
              model: LibraryItemWidgetModel(
                  book: 'Numerical Chemistry',
                  issuedDate: 'Dec 20, 2021',
                  dueDate: 'Dec 25, 2021',
                  issuedBy: 'Ujwal Basnet'),
            ),
          ],
        ),
      ),
    );
  }

  _appBar(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.subtitle1;
    final textStyle = Theme.of(context).textTheme.subtitle2;

    return KAppBar(
      title: Text('Library'),
      actions: [
        Padding(
          padding: mXPadding,
          child: InkWell(
              onTap: () {
                showKBottomSheet(Container(
                  padding: mPadding,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      )),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Library Information',
                        style:
                            titleStyle!.copyWith(fontWeight: FontWeight.bold),
                      ),
                      mHeightSpan,
                      Padding(
                        padding: mXPadding,
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Text(
                                      'Max. no of Books that can be issued per student',
                                      style: textStyle),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text('5',
                                      textAlign: TextAlign.right,
                                      style: textStyle!.copyWith(
                                          fontWeight: FontWeight.bold)),
                                )
                              ],
                            ),
                            sHeightSpan,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Text('Book renewal after each',
                                      style: textStyle),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text('15 days',
                                      textAlign: TextAlign.right,
                                      style: textStyle.copyWith(
                                          fontWeight: FontWeight.bold)),
                                )
                              ],
                            ),
                            sHeightSpan,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    flex: 5,
                                    child: Text('Fine if not renewed',
                                        style: textStyle)),
                                Expanded(
                                  flex: 3,
                                  child: Text('Rs. 15 per book per day',
                                      textAlign: TextAlign.right,
                                      style: textStyle.copyWith(
                                          fontWeight: FontWeight.bold)),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ));
              },
              child: Icon(Icons.info)),
        ),
      ],
    );
  }
}
