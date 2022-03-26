// import 'package:horizontal_calendar_widget/date_helper.dart';
// import 'package:horizontal_calendar_widget/horizontal_calendar.dart';
import 'package:school_enhancer_app/common/ui/ui_helper.dart';
import 'package:school_enhancer_app/core/dependency_injection/injection.dart';
import 'package:school_enhancer_app/features/announcements/announcement_page.dart';
import 'package:school_enhancer_app/features/attendance/attendence_year.dart';
import 'package:school_enhancer_app/features/home/view_model/home_view_model.dart';
import 'package:school_enhancer_app/features/profile/profile.dart';
import 'package:school_enhancer_app/features/support/support.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        disposeViewModel: true,
        onModelReady: (model) => model.loadHome(),
        builder: (context, model, child) {
          return Scaffold(
            appBar: _appBar(context),
            body: SingleChildScrollView(
              child: Container(
                padding: mPadding,
                child: Column(
                  children: <Widget>[
                    _topSection(context),
                    mHeightSpan,
                    _attendanceSection(context),
                    mHeightSpan,
                    _calendarSection(context),
                  ],
                ),
              ),
            ),
          );
        });
  }

  final weekStyle = TextStyle(fontWeight: FontWeight.bold);
  final dateStyle = TextStyle(fontWeight: FontWeight.normal);

  _calendarSection(BuildContext context) {
    final titleStyle = Theme.of(context)
        .textTheme
        .subtitle1
        ?.copyWith(fontWeight: FontWeight.w500);

    final overlineStyle = Theme.of(context).textTheme.overline;

    return KContainer(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Weekly Routine ",
                style: titleStyle,
              ),
              Text('2020/01/7 to 2020/01/14', style: overlineStyle),
            ],
          ),
//           HorizontalCalendar(
//             key: UniqueKey(),
//             onDateSelected: (date) => print(date),
//             firstDate: DateTime.now(),
//             lastDate: DateTime.now().add(Duration(days: 6)),
//             labelOrder: const [
//               LabelType.weekday,
//               LabelType.date,
//             ],
//             weekDayTextStyle: weekStyle,
//             dateTextStyle: dateStyle,
//             initialSelectedDates: [DateTime.now()],
//             selectedWeekDayTextStyle: weekStyle.copyWith(color: Colors.orange),
//             selectedDateTextStyle: dateStyle.copyWith(color: Colors.orange),
// //          padding: EdgeInsets.zero,
// //                      dateFormat: dateFormat,
// //                      weekDayFormat: weekDayFormat,
// //                      monthFormat: monthFormat,
// //                      defaultDecoration: BoxDecoration(
// //                        color: defaultDecorationColor,
// //                        shape: defaultDecorationShape,
// //                        borderRadius:
// //                            defaultDecorationShape == BoxShape.rectangle &&
// //                                    isCircularRadiusDefault
// //                                ? BorderRadius.circular(8)
// //                                : null,
// //                      ),
// //                      selectedDecoration: BoxDecoration(
// //                        color: selectedDecorationColor,
// //                        shape: selectedDecorationShape,
// //                        borderRadius:
// //                            selectedDecorationShape == BoxShape.rectangle &&
// //                                    isCircularRadiusSelected
// //                                ? BorderRadius.circular(8)
// //                                : null,
// //                      ),
// //                      disabledDecoration: BoxDecoration(
// //                        color: disabledDecorationColor,
// //                        shape: disabledDecorationShape,
// //                        borderRadius:
// //                            disabledDecorationShape == BoxShape.rectangle &&
// //                                    isCircularRadiusDisabled
// //                                ? BorderRadius.circular(8)
// //                                : null,
// //                      ),
// //                      isDateDisabled: (date) => date.weekday == DateTime.sunday,
// //                      labelOrder: order.map(toLabelType).toList(),
// //                      minSelectedDateCount: minSelectedDateCount,
// //                      maxSelectedDateCount: maxSelectedDateCount,
// //                      initialSelectedDates: initialSelectedDates,
//           ),
          Container(
            padding: sPadding,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('6:30', style: overlineStyle),
                    Text('to', style: overlineStyle),
                    Text('9:30', style: overlineStyle),
                  ],
                ),
                lWidthSpan,
                Expanded(
                  child: Container(
                    padding: sPadding,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Physics', style: overlineStyle),
                        esHeightSpan,
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 8,
                            ),
                            sWidthSpan,
                            Text('Mr. Zayn Malik', style: overlineStyle),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _attendanceSection(BuildContext context) {
    final titleStyle = Theme.of(context)
        .textTheme
        .subtitle1
        ?.copyWith(fontWeight: FontWeight.w500);

    final captionStyle = Theme.of(context).textTheme.caption;

    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return AttendanceYearPage();
        }));
      },
      child: KContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Attendance Status',
                  style: titleStyle,
                ),
                Text(
                  '28 / 35',
                  style: captionStyle,
                )
              ],
            ),
            sHeightSpan,
            ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              child: LinearProgressIndicator(
                minHeight: 6,
                value: 0.5,
                valueColor: new AlwaysStoppedAnimation<Color>(
                    Theme.of(context).primaryColor),
                backgroundColor: Colors.white54,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _topSection(BuildContext context) {
    final captionStyle = Theme.of(context).textTheme.caption;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 130,
          child: Row(
            children: <Widget>[
              Expanded(
                child: KContainer(
                  color: Colors.green,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Congratulations,\nyou are on a 15 days streak!",
                        style: TextStyle(color: Colors.green),
                        maxLines: 2,
                      ),
                      mHeightSpan,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Image.asset(
                                'assets/images/in_icon.png',
                                height: 36,
                                width: 36,
                                color: Colors.green,
                              ),
                              Text(
                                ' 6:05 AM',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.green),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Image.asset(
                                'assets/images/out_icon.png',
                                height: 36,
                                width: 36,
                                color: Colors.orange,
                              ),
                              Text(' Ongoing',
                                  style: captionStyle?.copyWith(
                                      color: Colors.orange)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              mWidthSpan,
              KContainer(
                color: Colors.deepOrangeAccent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Balance",
                      style: TextStyle(color: Colors.green),
                    ),
                    mHeightSpan,
                    Text(
                      "60/-",
                      style: TextStyle(color: Colors.orange),
                    ),
                    const SizedBox(height: 1),
                  ],
                ),
              ),
            ],
          ),
        ),
        mHeightSpan,
        Row(
          children: <Widget>[
            Expanded(
              child: KContainer(
                color: Colors.green,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return SupportPage();
                        }));
                      },
                      child: Text(
                        "Notification",
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                    Text(
                      "0",
                      style: TextStyle(color: Colors.green),
                    )
                  ],
                ),
              ),
            ),
            mWidthSpan,
            Expanded(
              child: InkWell(
                onTap: () => injection<NavigationService>()
                    .navigateToView(AnnouncementPage()),
                child: KContainer(
                  color: Colors.deepOrange,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Alerts",
                        style: TextStyle(color: Colors.green),
                      ),
                      lWidthSpan,
                      Text(
                        "2",
                        style: TextStyle(color: Colors.red),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  _appBar(BuildContext context) {
    final appBarTitleStyle = Theme.of(context).textTheme.headline6?.copyWith(
          color: Colors.white,
        );

    final appBarDateStyle = Theme.of(context).textTheme.subtitle2?.copyWith(
          color: Colors.white70,
        );

    return KAppBar(
      toolbarHeight: 86,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Good morning', style: appBarTitleStyle),
              Text('Today (2021/01/08)', style: appBarDateStyle),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return ProfilePage();
              }));
            },
            child: CircleAvatar(
              radius: 18,
              backgroundColor: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
