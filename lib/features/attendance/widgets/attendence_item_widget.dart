import 'package:school_enhancer_app/common/ui/ui_helper.dart';
import 'package:school_enhancer_app/features/attendance/widgets/notes_dialog_widget.dart';

class AttendanceItemWidgetModel {
  final String? month;
  final int? total;
  final int? present;
  final int? absent;
  final int? leave;
  final List<String>? notes;

  int get notesCount => notes?.length ?? 0;

  AttendanceItemWidgetModel({
    this.month,
    this.total,
    this.present,
    this.absent,
    this.leave,
    this.notes,
  });
}

class AttendanceItemWidget extends StatelessWidget {
  final AttendanceItemWidgetModel? model;

  const AttendanceItemWidget({Key? key, this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: sPadding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Theme.of(context).primaryColor, width: 2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              model!.month!,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16,
              ),
            ),
            Text(
              model!.total.toString(),
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16,
              ),
            ),
            Text(
              model!.present.toString(),
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 16,
              ),
            ),
            Text(
              model!.absent.toString(),
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 16,
              ),
            ),
            Text(
              model!.leave.toString(),
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 16,
              ),
            ),
            InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) =>
                        NotesDialogWidget(notes: model!.notes));
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
      ),
    );
  }
}
