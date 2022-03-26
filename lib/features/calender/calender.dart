// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:school_enhancer_app/common/ui/ui_helper.dart';
// import 'package:school_enhancer_app/features/calender/view_model/calender_view_model.dart';
// import 'package:stacked/stacked.dart';
// import 'package:table_calendar/table_calendar.dart';
//
// // Example holidays
// final Map<DateTime, List> _holidays = {
//   DateTime(2020, 1, 1): ['New Year\'s Day'],
//   DateTime(2020, 1, 6): ['Epiphany'],
//   DateTime(2020, 2, 14): ['Valentine\'s Day'],
//   DateTime(2020, 4, 21): ['Easter Sunday'],
//   DateTime(2020, 4, 22): ['Easter Monday'],
// };
//
// class CalenderPage extends StatefulWidget {
//   @override
//   _CalenderPageState createState() => _CalenderPageState();
// }
//
// class _CalenderPageState extends State<CalenderPage>
//     with TickerProviderStateMixin {
//   Map<DateTime, List> _events;
//   List _selectedEvents;
//   AnimationController _animationController;
//   CalendarController _calendarController;
//
//   @override
//   void initState() {
//     super.initState();
//     final _selectedDay = DateTime.now();
//
//     _events = {
//       _selectedDay.subtract(Duration(days: 30)): [
//         'Event A0',
//         'Event B0',
//         'Event C0'
//       ],
//       _selectedDay.subtract(Duration(days: 27)): ['Event A1'],
//       _selectedDay.subtract(Duration(days: 20)): [
//         'Event A2',
//         'Event B2',
//         'Event C2',
//         'Event D2'
//       ],
//       _selectedDay.subtract(Duration(days: 16)): ['Event A3', 'Event B3'],
//       _selectedDay.subtract(Duration(days: 10)): [
//         'Event A4',
//         'Event B4',
//         'Event C4'
//       ],
//       _selectedDay.subtract(Duration(days: 4)): [
//         'Event A5',
//         'Event B5',
//         'Event C5'
//       ],
//       _selectedDay.subtract(Duration(days: 2)): ['Event A6', 'Event B6'],
//       _selectedDay: ['Event A7', 'Event B7', 'Event C7', 'Event D7'],
//       _selectedDay.add(Duration(days: 1)): [
//         'Event A8',
//         'Event B8',
//         'Event C8',
//         'Event D8'
//       ],
//       _selectedDay.add(Duration(days: 3)):
//           Set.from(['Event A9', 'Event A9', 'Event B9']).toList(),
//       _selectedDay.add(Duration(days: 7)): [
//         'Event A10',
//         'Event B10',
//         'Event C10'
//       ],
//       _selectedDay.add(Duration(days: 11)): ['Event A11', 'Event B11'],
//       _selectedDay.add(Duration(days: 17)): [
//         'Event A12',
//         'Event B12',
//         'Event C12',
//         'Event D12'
//       ],
//       _selectedDay.add(Duration(days: 22)): ['Event A13', 'Event B13'],
//       _selectedDay.add(Duration(days: 26)): [
//         'Event A14',
//         'Event B14',
//         'Event C14'
//       ],
//     };
//
//     _selectedEvents = _events[_selectedDay] ?? [];
//     _calendarController = CalendarController();
//
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 400),
//     );
//
//     _animationController.forward();
//   }
//
//   @override
//   void dispose() {
//     _animationController.dispose();
//     _calendarController.dispose();
//     super.dispose();
//   }
//
//   void _onDaySelected(DateTime day, List events, List holidays) {
//     print('CALLBACK: _onDaySelected');
//     setState(() {
//       _selectedEvents = events;
//     });
//   }
//
//   void _onVisibleDaysChanged(
//       DateTime first, DateTime last, CalendarFormat format) {
//     print('CALLBACK: _onVisibleDaysChanged');
//   }
//
//   void _onCalendarCreated(
//       DateTime first, DateTime last, CalendarFormat format) {
//     print('CALLBACK: _onCalendarCreated');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder<CalenderViewModel>.reactive(
//         viewModelBuilder: () => CalenderViewModel(),
//         disposeViewModel: true,
//         onModelReady: (model) => model.loadEvent(),
//         builder: (context, model, child) {
//           return Scaffold(
//             floatingActionButton: (!(_calendarController?.isToday(
//                         _calendarController?.selectedDay ?? DateTime.now()) ??
//                     false))
//                 ? FloatingActionButton(
//                     child: Text(DateTime.now().day.toString()),
//                     onPressed: () {
//                       _calendarController.setSelectedDay(DateTime.now());
//                       setState(() {});
//                     },
//                   )
//                 : null,
//             body: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisSize: MainAxisSize.max,
//               children: <Widget>[
//                 SizedBox(height: kToolbarHeight),
//                 _buildTableCalendarWithBuilders(),
//                 Padding(
//                   padding: mPadding,
//                   child: Text(
//                     "Activities",
//                     style: Theme.of(context)
//                         .textTheme
//                         .subtitle1
//                         .copyWith(fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 Expanded(child: _buildEventList()),
//               ],
//             ),
//           );
//         });
//   }
//
//   // Simple TableCalendar configuration (using Styles)
//   Widget _buildTableCalendar() {
//     return TableCalendar(
//       calendarController: _calendarController,
//       events: _events,
//       holidays: _holidays,
//       startingDayOfWeek: StartingDayOfWeek.monday,
//       calendarStyle: CalendarStyle(
//         selectedColor: Colors.deepOrange[400],
//         todayColor: Colors.deepOrange[200],
//         markersColor: Colors.brown[700],
//         outsideDaysVisible: true,
//       ),
//       headerStyle: HeaderStyle(
//         formatButtonTextStyle:
//             TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
//         formatButtonDecoration: BoxDecoration(
//           color: Colors.deepOrange[400],
//           borderRadius: BorderRadius.circular(16.0),
//         ),
//       ),
//       onDaySelected: _onDaySelected,
//       onVisibleDaysChanged: _onVisibleDaysChanged,
//       onCalendarCreated: _onCalendarCreated,
//     );
//   }
//
//   // More advanced TableCalendar configuration (using Builders & Styles)
//   Widget _buildTableCalendarWithBuilders() {
//     return TableCalendar(
//       weekendDays: [DateTime.saturday],
//       calendarController: _calendarController,
//       events: _events,
//       holidays: _holidays,
//       initialCalendarFormat: CalendarFormat.month,
//       formatAnimation: FormatAnimation.slide,
//       startingDayOfWeek: StartingDayOfWeek.sunday,
//       availableGestures: AvailableGestures.all,
//       availableCalendarFormats: const {
//         CalendarFormat.month: '',
//         CalendarFormat.week: '',
//       },
//       calendarStyle: CalendarStyle(
//         outsideDaysVisible: true,
//         outsideStyle: Theme.of(context).textTheme.caption.copyWith(
//               color: Colors.black26,
//             ),
//
//         // weekendStyle: TextStyle(fontWeight: FontWeight.bold)
//         //     .copyWith(color: Colors.blue[800]),
//         // holidayStyle: TextStyle(fontWeight: FontWeight.bold)
//         //     .copyWith(color: Colors.blue[800]),
//         // weekdayStyle: TextStyle(fontWeight: FontWeight.bold)
//         //     .copyWith(color: Colors.blue[800]),
//       ),
//       daysOfWeekStyle: DaysOfWeekStyle(
//         weekendStyle: TextStyle().copyWith(color: Colors.blue[600]),
//       ),
//       headerStyle: HeaderStyle(
//         formatButtonVisible: false,
//         titleTextStyle: Theme.of(context)
//             .textTheme
//             .subtitle1
//             .copyWith(fontWeight: FontWeight.w500),
//         titleTextBuilder: (DateTime date, _) =>
//             DateFormat("yyy MMM").format(date),
//       ),
//       builders: CalendarBuilders(
//         dowWeekdayBuilder: (context, str) => Center(
//           child: Text(
//             str,
//             style: Theme.of(context).textTheme.caption,
//           ),
//         ),
//         selectedDayBuilder: (context, date, _) {
//           return Container(
//             margin: const EdgeInsets.all(4.0),
//             decoration: BoxDecoration(
//               border: Border.all(
//                 color: Theme.of(context).primaryColor,
//               ),
//               borderRadius: BorderRadius.circular(72),
//             ),
//             child: Center(
//               child: Text(
//                 '${date.day}',
//                 style: TextStyle().copyWith(fontSize: 16.0),
//               ),
//             ),
//           );
//         },
//         todayDayBuilder: (context, date, _) {
//           return Container(
//             margin: const EdgeInsets.all(4.0),
//             decoration: BoxDecoration(
//               border: Border.all(
//                 color: Theme.of(context).primaryColor,
//               ),
//               color: Theme.of(context).primaryColor.withOpacity(0.75),
//               borderRadius: BorderRadius.circular(72),
//             ),
//             child: Center(
//               child: Text(
//                 '${date.day}',
//                 style: TextStyle().copyWith(
//                   fontSize: 16.0,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           );
//         },
//         markersBuilder: (context, date, events, holidays) {
//           final children = <Widget>[];
//
//           if (events.isNotEmpty) {
//             children.add(
//               Positioned(
//                 top: 8,
//                 child: CircleAvatar(
//                   radius: 3,
//                   backgroundColor: (_calendarController.isToday(date))
//                       ? Colors.white
//                       : Colors.grey,
//                 ),
//               ),
//             );
//           }
//
//           return children;
//         },
//       ),
//       onDaySelected: (date, events, holidays) {
//         _onDaySelected(date, events, holidays);
//         _animationController.forward(from: 0.0);
//       },
//       onVisibleDaysChanged: _onVisibleDaysChanged,
//       onCalendarCreated: _onCalendarCreated,
//     );
//   }
//
//   Widget _buildEventsMarker(DateTime date, List events) {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 300),
//       decoration: BoxDecoration(
//         shape: BoxShape.rectangle,
//         color: _calendarController.isSelected(date)
//             ? Colors.brown[500]
//             : _calendarController.isToday(date)
//                 ? Colors.brown[300]
//                 : Colors.blue[400],
//       ),
//       width: 16.0,
//       height: 16.0,
//       child: Center(
//         child: Text(
//           '${events.length}',
//           style: TextStyle().copyWith(
//             color: Colors.white,
//             fontSize: 12.0,
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildHolidaysMarker() {
//     return Icon(
//       Icons.add_box,
//       size: 20.0,
//       color: Colors.blueGrey[800],
//     );
//   }
//
//   Widget _buildButtons() {
//     final dateTime = _events.keys.elementAt(_events.length - 2);
//
//     return Column(
//       children: <Widget>[
//         Row(
//           mainAxisSize: MainAxisSize.max,
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: <Widget>[
//             RaisedButton(
//               child: Text('Month'),
//               onPressed: () {
//                 setState(() {
//                   _calendarController.setCalendarFormat(CalendarFormat.month);
//                 });
//               },
//             ),
//             RaisedButton(
//               child: Text('2 weeks'),
//               onPressed: () {
//                 setState(() {
//                   _calendarController
//                       .setCalendarFormat(CalendarFormat.twoWeeks);
//                 });
//               },
//             ),
//             RaisedButton(
//               child: Text('Week'),
//               onPressed: () {
//                 setState(() {
//                   _calendarController.setCalendarFormat(CalendarFormat.week);
//                 });
//               },
//             ),
//           ],
//         ),
//         const SizedBox(height: 8.0),
//         RaisedButton(
//           child: Text(
//               'Set day ${dateTime.day}-${dateTime.month}-${dateTime.year}'),
//           onPressed: () {
//             _calendarController.setSelectedDay(
//               DateTime(dateTime.year, dateTime.month, dateTime.day),
//               runCallback: true,
//             );
//           },
//         ),
//       ],
//     );
//   }
//
//   Widget _buildEventList() {
//     return ListView(
//       physics: BouncingScrollPhysics(),
//       padding: mPadding,
//       children: _selectedEvents
//           .map(
//             (event) => Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(4),
//               ),
//               child: Row(
//                 children: [
//                   Text(
//                     'Jan 8',
//                     style: Theme.of(context)
//                         .textTheme
//                         .caption
//                         .copyWith(fontWeight: FontWeight.bold),
//                   ),
//                   lWidthSpan,
//                   Expanded(
//                     child: Card(
//                       child: Container(
//                         padding: mPadding,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               event,
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .subtitle1
//                                   .copyWith(fontWeight: FontWeight.bold),
//                             ),
//                             sHeightSpan,
//                             Text('10:00 AM - 11:00 AM',
//                                 style: Theme.of(context).textTheme.caption),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           )
//           .toList(),
//     );
//   }
// }
