import 'package:school_enhancer_app/common/ui/ui_helper.dart';
import 'package:school_enhancer_app/features/attendance/widgets/attendence_item_widget.dart';

class AttendancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: SingleChildScrollView(
        child: Container(
          padding: mPagePadding,
          child: Column(
            children: <Widget>[
              _topbodySection(context),
              sHeightSpan,
              AttendanceItemWidget(
                model: AttendanceItemWidgetModel(
                  month: 'Dec',
                  total: 5,
                  absent: 3,
                  leave: 1,
                  present: 23,
                  notes: ['sjhdlksjfsdfjksdlf', 'jsdkjsdklskjdfksjdlksdlksld'],
                ),
              ),
              sHeightSpan,
              AttendanceItemWidget(
                model: AttendanceItemWidgetModel(
                  month: 'Jan',
                  total: 7,
                  absent: 9,
                  leave: 2,
                  present: 20,
                  notes: [
                    'nsdjklsldkjsdjkdklks;dlas',
                    'jsdkjsdklskjdfksjdlksdlksld',
                    'jksdioweiwedjhsdsd',
                    'jsdsdyuweidj'
                  ],
                ),
              ),
              sHeightSpan,
              AttendanceItemWidget(
                model: AttendanceItemWidgetModel(
                  month: 'Dec',
                  total: 5,
                  absent: 3,
                  leave: 1,
                  present: 23,
                  notes: [
                    'nsdjklsldkjsdjkdklks;dlas',
                    'jsdkjsdklskjdfksjdlksdlksld',
                    'ahsdksdjgwieujkwgduqwi'
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _topbodySection(BuildContext context) {
    final titleStyle = Theme.of(context)
        .textTheme
        .subtitle1!
        .copyWith(fontWeight: FontWeight.bold);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Year 2020',
          style: titleStyle.copyWith(color: Theme.of(context).primaryColor),
        ),
        sHeightSpan,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Month',
              style: titleStyle,
            ),
            Text(
              'Total',
              style: titleStyle,
            ),
            Text(
              'Present',
              style: titleStyle,
            ),
            Text(
              'Absent',
              style: titleStyle,
            ),
            Text(
              'Leave',
              style: titleStyle,
            ),
            Text(
              'Note',
              style: titleStyle,
            ),
          ],
        ),
      ],
    );
  }

  _appBar(BuildContext context) => KAppBar(
        actions: [
          Padding(
            padding: lXPadding,
            child: Icon(
              Icons.filter_alt,
              color: Colors.white,
            ),
          ),
        ],
        title: Text('Attendance'),
      );
}
