import 'package:school_enhancer_app/common/ui/ui_helper.dart';

class NotesDialogWidget extends StatelessWidget {
  final List<String>? notes;

  const NotesDialogWidget({Key? key, this.notes}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 1,
      backgroundColor: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: mXPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Alerts'),
                IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1,
          ),
//          ...notes.map((e) => Text(e)).toList(),
          Padding(
            padding: mYPadding,
            child: Text(notes!.join("\n\n")),
          ),
        ],
      ),
    );
  }
}
