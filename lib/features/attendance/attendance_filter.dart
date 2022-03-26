import 'package:school_enhancer_app/common/ui/ui_helper.dart';

class AttendanceFilterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final buttonStyle = Theme.of(context).textTheme.button!;

    return Scaffold(
      appBar: _appBar(context),
      body: SingleChildScrollView(
        child: Container(
          padding: mPagePadding,
          child: Column(
            children: <Widget>[
              _selectionSection(context),
              mHeightSpan,
              _noteSection(context),
              elHeightSpan,
              RaisedButton(
                onPressed: () {},
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(48),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                      sWidthSpan,
                      Text('DONE',
                          style: buttonStyle.copyWith(color: Colors.white))
                    ],
                  ),
                ),
              )
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '2021',
                style: titleStyle,
              ),
              mWidthSpan,
              Text(
                'December',
                style: titleStyle,
              ),
            ],
          ),
          mHeightSpan,
          Text(
            '2021',
            style: titleStyle.copyWith(color: Colors.grey),
          ),
          mHeightSpan,
          Row(
            children: [
              Text(
                'Today',
                style: titleStyle.copyWith(color: Colors.grey),
              ),
              mWidthSpan,
              Text(
                "Yesterday's Pick",
                style: titleStyle.copyWith(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _selectionSection(BuildContext context) {
    final titleStyle = Theme.of(context)
        .textTheme
        .subtitle1!
        .copyWith(fontWeight: FontWeight.w500);

    final textStyle = Theme.of(context).textTheme.subtitle2;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Attendance Type',
          style: titleStyle.copyWith(color: Theme.of(context).primaryColor),
        ),
        sHeightSpan,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RaisedButton(
              disabledColor: Colors.grey,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              color: Theme.of(context).primaryColor,
              onPressed: () {},
              child: Text(
                'Month',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            RaisedButton(
              disabledColor: Colors.grey.withOpacity(0.2),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              color: Theme.of(context).primaryColor,
              onPressed: () {},
              child: Text(
                'Year',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            RaisedButton(
              disabledColor: Colors.grey.withOpacity(0.2),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              onPressed: () {},
              child: Text(
                'Custom Date',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
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
              Icons.check,
              color: Colors.white,
            ),
          ),
        ],
        leading: Icon(Icons.close),
        title: Text(
          'Attendance Filter',
          style: TextStyle(color: Colors.white),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(color: Theme.of(context).primaryColor),
        ),
      );
}
