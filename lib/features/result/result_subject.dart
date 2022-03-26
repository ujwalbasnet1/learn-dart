import 'package:school_enhancer_app/common/ui/ui_helper.dart';
import 'package:school_enhancer_app/common/ui/widgets/chart_widget.dart';

class ResultSubjectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.subtitle1!;

    return Scaffold(
      appBar: _appBar(context),
      body: ListView(
        padding: mPadding,
        children: [
          KContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Science Percentage',
                  style: titleStyle.copyWith(fontWeight: FontWeight.bold),
                ),
                mHeightSpan,
                Container(
                  height: 240,
                  child: ChartWidget.sampleData(),
                ),
              ],
            ),
          ),
          lHeightSpan,
          KContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Science',
                    style: titleStyle.copyWith(fontWeight: FontWeight.bold)),
                mHeightSpan,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Terms',
                        style:
                            titleStyle.copyWith(fontWeight: FontWeight.bold)),
                    Text('Marks',
                        style: titleStyle.copyWith(fontWeight: FontWeight.w500))
                  ],
                ),
                sHeightSpan,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Term 1',
                        style:
                            titleStyle.copyWith(fontWeight: FontWeight.bold)),
                    Text('50',
                        style: titleStyle.copyWith(fontWeight: FontWeight.w500))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Term 2',
                        style:
                            titleStyle.copyWith(fontWeight: FontWeight.bold)),
                    Text('90',
                        style: titleStyle.copyWith(fontWeight: FontWeight.w500))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Term 3',
                        style:
                            titleStyle.copyWith(fontWeight: FontWeight.bold)),
                    Text('80',
                        style: titleStyle.copyWith(fontWeight: FontWeight.w500))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Final',
                        style:
                            titleStyle.copyWith(fontWeight: FontWeight.bold)),
                    Text('65',
                        style: titleStyle.copyWith(fontWeight: FontWeight.w500))
                  ],
                ),
                Divider(
                  thickness: 1,
                  color: Theme.of(context).primaryColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Maximum',
                        style:
                            titleStyle.copyWith(fontWeight: FontWeight.bold)),
                    Text('90',
                        style: titleStyle.copyWith(fontWeight: FontWeight.w500))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Minimum',
                        style:
                            titleStyle.copyWith(fontWeight: FontWeight.bold)),
                    Text('50',
                        style: titleStyle.copyWith(fontWeight: FontWeight.w500))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Average',
                        style:
                            titleStyle.copyWith(fontWeight: FontWeight.bold)),
                    Text('63.5%', style: titleStyle)
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _appBar(BuildContext context) {
    return KAppBar(
      title: Text('Result: Science'),
    );
  }
}
