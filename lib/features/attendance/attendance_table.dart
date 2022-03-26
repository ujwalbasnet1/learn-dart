import 'package:school_enhancer_app/common/ui/ui_helper.dart';

class AttendanceTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context)
        .textTheme
        .subtitle1!
        .copyWith(fontWeight: FontWeight.w500);

    return Scaffold(
      appBar: _appBar(context),
      body: Container(
        padding: mPagePadding,
        child: Column(
          children: [
            Text('December',
                style:
                    titleStyle.copyWith(color: Theme.of(context).primaryColor)),
            _table(context),
          ],
        ),
      ),
    );
  }

  _table(BuildContext context) => Table(
        border: TableBorder.all(color: Colors.black12),
        children: [
          TableRow(
            children: [
              TableCell(
                  child: Row(
                children: [
                  Text('Date'),
                  Text('In Time'),
                ],
              ))
            ],
          )
        ],
      );

  _appBar(BuildContext context) => AppBar(
        actions: [
          Padding(
            padding: lXPadding,
            child: Icon(
              Icons.filter_alt,
              color: Colors.white,
            ),
          ),
        ],
        title: Text(
          'Attendence',
          style: TextStyle(color: Colors.white),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(color: Theme.of(context).primaryColor),
        ),
      );
}
