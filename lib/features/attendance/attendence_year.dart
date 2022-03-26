import 'package:intl/intl.dart';
import 'package:school_enhancer_app/common/ui/ui_helper.dart';
import 'package:school_enhancer_app/common/ui/widgets/chart_widget.dart';
import 'package:school_enhancer_app/common/ui/widgets/error_widget.dart';
import 'package:school_enhancer_app/features/attendance/attendance_month.dart';
import 'package:school_enhancer_app/features/attendance/view_model/attendance_year_view_model.dart';
import 'package:stacked/stacked.dart';

class AttendanceYearPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AttendanceViewModel>.reactive(
        viewModelBuilder: () => AttendanceViewModel(),
        disposeViewModel: true,
        onModelReady: (model) => model.initialize(),
        builder: (context, model, child) {
          return Scaffold(
            appBar: _appBar(context),
            body: (model.monthMode)
                ? _bodyMonth(context, model)
                : _bodyYear(context, model),
          );
        });
  }

  _bodyMonth(BuildContext context, AttendanceViewModel model) {
    final titleStyle = Theme.of(context).textTheme.subtitle1;

    if (model.isBusy) {
      return Center(child: CircularProgressIndicator());
    }

    if (model.hasError) {
      return KErrorWidget(
        error: model.modelError,
        onPressed: model.initialize,
      );
    }

    return RefreshIndicator(
      onRefresh: () => model.initialize(),
      child: SingleChildScrollView(
        child: Padding(
          padding: mPagePadding,
          child: Column(
            children: [
              KContainer(
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: model.previousMonth,
                        child: Text(
                          '< ' +
                              DateFormat('MMM').format(DateFormat("MM")
                                  .parse((model.month - 1).toString())),
                          style: titleStyle!.copyWith(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        DateFormat('MMM').format(
                            DateFormat("MM").parse((model.month).toString())),
                        textAlign: TextAlign.center,
                        style: titleStyle.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: model.nextMonth,
                        child: Text(
                          DateFormat('MMM').format(DateFormat("MM")
                                  .parse((model.month + 1).toString())) +
                              ' >',
                          textAlign: TextAlign.right,
                          style: titleStyle.copyWith(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              AttendanceMonthPage(monthAttendances: model.monthAttendances),
            ],
          ),
        ),
      ),
    );
  }

  _bodyYear(BuildContext context, AttendanceViewModel model) {
    final titleStyle = Theme.of(context).textTheme.subtitle1;

    if (model.isBusy) {
      return Center(child: CircularProgressIndicator());
    }

    if (model.hasError) {
      return KErrorWidget(
        error: model.modelError,
        onPressed: model.initialize,
      );
    }

    return RefreshIndicator(
      onRefresh: () => model.initialize(),
      child: SingleChildScrollView(
        child: Padding(
          padding: mPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              KContainer(
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: model.previousYear,
                        child: Text(
                          '< ' + (model.year - 1).toString(),
                          style: titleStyle!.copyWith(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        model.year.toString(),
                        textAlign: TextAlign.center,
                        style: titleStyle.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: model.nextYear,
                        child: Text(
                          (model.year + 1).toString() + ' >',
                          textAlign: TextAlign.right,
                          style: titleStyle.copyWith(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              lHeightSpan,
              KContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Attendance Summary',
                      style: titleStyle.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'of year ' + model.year.toString(),
                      style: titleStyle.copyWith(fontWeight: FontWeight.w500),
                    ),
                    mHeightSpan,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Minimum Present ',
                                    style: titleStyle.copyWith(
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: model.minPresentPercent?.month
                                        .toString(),
                                    style: titleStyle.copyWith(
                                        color: Colors.black)),
                              ],
                            ),
                          ),
                        ),
                        Text(
                            (model.minPresentPercent?.presentPercent
                                        .toStringAsFixed(2) ??
                                    "") +
                                '%',
                            style: titleStyle.copyWith(
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Maximum Present ',
                                    style: titleStyle.copyWith(
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: model.maxPresentPercent?.month
                                        .toString(),
                                    style: titleStyle.copyWith(
                                        color: Colors.black)),
                              ],
                            ),
                          ),
                        ),
                        Text(
                            (model.maxPresentPercent?.presentPercent
                                        .toStringAsFixed(2) ??
                                    "") +
                                '%',
                            style: titleStyle.copyWith(
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                    Divider(
                      thickness: 1,
                      color: Theme.of(context).primaryColor,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text('Average',
                              style: titleStyle.copyWith(
                                  fontWeight: FontWeight.bold)),
                        ),
                        Text(model.averagePercent.toStringAsFixed(2) + '%',
                            style: titleStyle.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.green)),
                      ],
                    ),
                  ],
                ),
              ),
              lHeightSpan,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Monthly Attendance Chart',
                    style: titleStyle.copyWith(fontWeight: FontWeight.bold),
                  ),
                  mHeightSpan,
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: 800,
                      maxHeight: 240,
                    ),
                    child: InteractiveViewer(
                      constrained: false,
                      scaleEnabled: false,
                      child: Container(
                        // width: 800,
                        // height: 240,
                        constraints: BoxConstraints(
                          maxWidth: 600,
                          minWidth: 500,
                          maxHeight: 230,
                        ),
                        child: ChartWidget(
                          results: model.yearAttendances.map((e) {
                            return ResultModel(e.month, e.presentPercent);
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              lHeightSpan,
              KContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Attendance Details',
                        style:
                            titleStyle.copyWith(fontWeight: FontWeight.bold)),
                    Text('of year ' + model.year.toString(), style: titleStyle),
                    mHeightSpan,
                    Column(
                      children: model.yearAttendances.map((e) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(e.month ?? "",
                                style: titleStyle.copyWith(
                                    fontWeight: FontWeight.bold)),
                            Text(
                                '${e.presentPercent.toStringAsFixed(2)}% (${e.present}/${e.total})',
                                style: titleStyle),
                          ],
                        );
                      }).toList(),
                    ),
                    Divider(
                      thickness: 1,
                      color: Theme.of(context).primaryColor,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Average',
                            style: titleStyle.copyWith(
                                fontWeight: FontWeight.bold)),
                        Text(model.averagePercent.toStringAsFixed(2) + '%',
                            style: titleStyle.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.green)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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
          'Attendance',
          style: TextStyle(color: Colors.white),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(color: Theme.of(context).primaryColor),
        ),
      );
}
