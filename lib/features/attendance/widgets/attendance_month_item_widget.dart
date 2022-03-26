import 'package:school_enhancer_app/common/ui/ui_helper.dart';
import 'package:school_enhancer_app/features/attendance/widgets/notes_dialog_widget.dart';

class AttendanceMonthItemWidgetModel {
  final String? date;
  final String? inTime;
  final String? outTime;
  final List<String>? notes;

  AttendanceMonthItemWidgetModel({
    this.date,
    this.inTime,
    this.outTime,
    this.notes,
  });

  int get notesCount => notes?.length ?? 0;
}

class AttendanceMonthItemWidget extends StatelessWidget {
  final AttendanceMonthItemWidgetModel? model;

  const AttendanceMonthItemWidget({Key? key, this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: sPadding,
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(14),
      //   border: Border.all(color: Theme.of(context).primaryColor, width: 2),
      // ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            model!.date.toString(),
            style: TextStyle(
              color: Colors.black87,
              fontSize: 16,
            ),
          ),
          Text(
            model!.inTime ?? 'N/A',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 16,
            ),
          ),
          Text(
            model!.outTime ?? 'N/A',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 16,
            ),
          ),
          InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) => NotesDialogWidget(notes: model!.notes));
            },
            child: Row(
              children: [
                Text(
                  model!.notesCount.toString(),
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 16,
                  ),
                ),
                esWidthSpan,
                Icon(
                  Icons.message_outlined,
                  size: 18,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
