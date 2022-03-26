import 'package:intl/intl.dart';
import 'package:school_enhancer_app/common/ui/ui_helper.dart';
import 'package:school_enhancer_app/data/api_service/attendance/model/attendance_month_response_model.dart';
import 'package:school_enhancer_app/features/attendance/widgets/attendance_month_item_widget.dart';

class AttendanceMonthPage extends StatelessWidget {
  final List<AttendanceMonthResponseModel>? monthAttendances;

  const AttendanceMonthPage({Key? key, this.monthAttendances})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.subtitle1;

    return Column(
      children: <Widget>[
        _topbodySection(context),
        sHeightSpan,
        ...monthAttendances!.map((e) {
          return AttendanceMonthItemWidget(
            model: AttendanceMonthItemWidgetModel(
              date: DateFormat("dd")
                  .format(DateFormat("yyy-MM-dd").parse(e.date!)),
              inTime: (e.inTime == null)
                  ? 'N/A'
                  : DateFormat("hh:mm aa")
                      .format(DateFormat("HH:mm:ss").parse(e.inTime!)),
              outTime: (e.outTime == null)
                  ? 'N/A'
                  : DateFormat("hh:mm aa")
                      .format(DateFormat("HH:mm:ss").parse(e.outTime!)),
              //todo: Notes
              notes: [
                'nsdjklsldkjsdjkdklks;dlas',
                'jsdkjsdklskjdfksjdlksdlksld'
              ],
            ),
          );
        }).toList(),
      ],
    );
  }

  _topbodySection(BuildContext context) {
    final titleStyle = Theme.of(context)
        .textTheme
        .subtitle1!
        .copyWith(fontWeight: FontWeight.w500);

    final textStyle = Theme.of(context).textTheme.subtitle2;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        lHeightSpan,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Date',
              style: titleStyle.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              'In Time',
              style: titleStyle.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              'Out Time',
              style: titleStyle.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              'Note',
              style: titleStyle.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
