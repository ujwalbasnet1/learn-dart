import 'package:school_enhancer_app/common/ui/ui_helper.dart';
import 'package:school_enhancer_app/common/ui/widgets/chart_widget.dart';

class ExpenditureBalanceChartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.subtitle1;
    final textStyle = Theme.of(context).textTheme.subtitle2!;
    final smallTextStyle = Theme.of(context).textTheme.caption;

    return Scaffold(
      appBar: _appBar(context),
      body: SingleChildScrollView(
        padding: mPadding,
        child: Column(
          children: [
            KContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Expenditure Summary',
                    style: textStyle.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'of December',
                    style: textStyle.copyWith(fontWeight: FontWeight.w500),
                  ),
                  sHeightSpan,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Minimum ',
                                style: textStyle.copyWith(
                                    fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: '11 Dec',
                                style: textStyle.copyWith(color: Colors.black)),
                          ],
                        ),
                      ),
                      Text('Rs. 60',
                          style:
                              textStyle.copyWith(fontWeight: FontWeight.bold))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Maximum ',
                                style: textStyle.copyWith(
                                    fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: '12 Dec',
                                style: textStyle.copyWith(color: Colors.black)),
                          ],
                        ),
                      ),
                      Text('Rs. 260',
                          style:
                              textStyle.copyWith(fontWeight: FontWeight.bold))
                    ],
                  ),
                ],
              ),
            ),
            lHeightSpan,
            Container(
              height: 240,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Balance Chart',
                    style: textStyle.copyWith(fontWeight: FontWeight.bold),
                  ),
                  sHeightSpan,
                  Expanded(child: ChartWidget.sampleData()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _appBar(BuildContext context) {
    return KAppBar(
      title: Text('Food & Transactions'),
      actions: [
        Padding(
          padding: mXPadding,
          child: Icon(Icons.filter_alt),
        ),
      ],
    );
  }
}
