import 'package:school_enhancer_app/common/ui/ui_helper.dart';

class AttendanceNotePage extends StatelessWidget {
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
              mHeightSpan,
              _noteSection(context),
            ],
          ),
        ),
      ),
    );
  }

  _noteSection(BuildContext context) {
    final titleStyle = Theme.of(context)
        .textTheme
        .subtitle1!
        .copyWith(fontWeight: FontWeight.w500);

    final textStyle = Theme.of(context).textTheme.subtitle2;

    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      padding: sPadding,
      decoration: BoxDecoration(border: Border.all(width: 1)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'December Notes',
            style: titleStyle,
          ),
          esHeightSpan,
          Divider(
            thickness: 1,
            color: Colors.black26,
          ),
          Text(
            '2021-01-13',
            style: titleStyle,
          ),
          sHeightSpan,
          Text(
            'Created a dispute with Physics teacher. Disciplinary action taken',
            style: titleStyle,
          ),
          esHeightSpan,
          Divider(
            thickness: 1,
            color: Colors.black26,
          ),
          esHeightSpan,
          Divider(
            thickness: 1,
            color: Colors.black26,
          ),
          Text(
            '2021-01-13',
            style: titleStyle,
          ),
          sHeightSpan,
          Text(
            'Created a dispute with Physics teacher. Disciplinary action taken',
            style: titleStyle,
          ),
          esHeightSpan,
          Divider(
            thickness: 1,
            color: Colors.black26,
          ),
        ],
      ),
    );
  }

  _topbodySection(BuildContext context) {
    final titleStyle = Theme.of(context)
        .textTheme
        .subtitle1!
        .copyWith(fontWeight: FontWeight.w500);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Year 2020-December',
            style: titleStyle.copyWith(color: Theme.of(context).primaryColor)),
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
          '2020-December',
          style: TextStyle(color: Colors.white),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(color: Theme.of(context).primaryColor),
        ),
      );
}
