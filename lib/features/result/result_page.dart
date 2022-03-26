import 'package:school_enhancer_app/common/ui/ui_helper.dart';
import 'package:school_enhancer_app/common/ui/widgets/chart_widget.dart';
import 'package:school_enhancer_app/common/ui/widgets/error_widget.dart';
import 'package:school_enhancer_app/features/result/view_model/result_view_model.dart';
import 'package:stacked/stacked.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.subtitle1;

    return Scaffold(
      appBar: _appBar(context),
      body: ViewModelBuilder<ResultViewModel>.reactive(
          viewModelBuilder: () => ResultViewModel(),
          disposeViewModel: true,
          onModelReady: (model) => model.getResult(),
          builder: (context, model, child) {
            if (model.isLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (model.hasFailure) {
              return KErrorWidget(
                error: model.failure,
                onPressed: model.getResult,
              );
            }
            return RefreshIndicator(
              onRefresh: () => model.getResult(),
              child: ListView(
                padding: mPadding,
                children: [
                  KContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Class 9 Result',
                          style:
                              titleStyle!.copyWith(fontWeight: FontWeight.bold),
                        ),
                        mHeightSpan,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Minimum',
                                  style: titleStyle.copyWith(
                                      fontWeight: FontWeight.bold),
                                ),
                                esWidthSpan,
                                Text(model.minimumPercentTerm.examType ?? "",
                                    style: titleStyle),
                              ],
                            ),
                            Text(
                              (model.minimumPercentTerm.obtainedPercent)
                                      .toStringAsFixed(2) +
                                  '%',
                              style: titleStyle.copyWith(
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'Maximum ',
                                      style: titleStyle.copyWith(
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text: model.maximumPercentTerm.examType ??
                                          "",
                                      style: titleStyle.copyWith(
                                          color: Colors.black)),
                                ],
                              ),
                            ),
                            Text(
                                (model.maximumPercentTerm.obtainedPercent)
                                        .toStringAsFixed(2) +
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
                            Text('Average',
                                style: titleStyle.copyWith(
                                    fontWeight: FontWeight.bold)),
                            Text(
                                (model.averagePercent).toStringAsFixed(2) + "%",
                                style: titleStyle.copyWith(
                                    fontWeight: FontWeight.bold))
                          ],
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
                          'Overall Percentage',
                          style:
                              titleStyle.copyWith(fontWeight: FontWeight.bold),
                        ),
                        mHeightSpan,
                        Container(
                            height: 240,
                            child: ChartWidget(
                              results: model.terms.map((e) {
                                return ResultModel(
                                    e.examType, e.obtainedPercent);
                              }).toList(),
                            )),
                      ],
                    ),
                  ),
                  lHeightSpan,
                  Column(
                    children: model.terms
                        .map((e) => Padding(
                              padding: sYPadding,
                              child: KContainer(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('${e.examType ?? ""}',
                                        style: titleStyle.copyWith(
                                            fontWeight: FontWeight.bold)),
                                    mHeightSpan,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Subjects',
                                            style: titleStyle.copyWith(
                                                fontWeight: FontWeight.bold)),
                                        Text('Marks',
                                            style: titleStyle.copyWith(
                                                fontWeight: FontWeight.w500))
                                      ],
                                    ),
                                    sHeightSpan,
                                    Column(
                                      children: e.subjects!
                                          .map(
                                            (e) => Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(e.subject!.title!,
                                                    style: titleStyle.copyWith(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                Text(e.obtainedMark.toString(),
                                                    style: titleStyle.copyWith(
                                                        fontWeight:
                                                            FontWeight.w500))
                                              ],
                                            ),
                                          )
                                          .toList(),
                                    ),
                                    Divider(
                                      thickness: 1,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Total Obtained Marks',
                                            style: titleStyle.copyWith(
                                                fontWeight: FontWeight.bold)),
                                        Text(e.totalObtainedMarks.toString(),
                                            style: titleStyle.copyWith(
                                                fontWeight: FontWeight.w500))
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Total Marks',
                                            style: titleStyle.copyWith(
                                                fontWeight: FontWeight.bold)),
                                        Text(e.totalFullMarks.toString(),
                                            style: titleStyle.copyWith(
                                                fontWeight: FontWeight.w500))
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Percentage',
                                            style: titleStyle.copyWith(
                                                fontWeight: FontWeight.bold)),
                                        Text(
                                            e.obtainedPercent
                                                    .toStringAsFixed(2) +
                                                '%',
                                            style: titleStyle.copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.green))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ],
              ),
            );
          }),
    );
  }

  _appBar(BuildContext context) {
    return KAppBar(
      title: Text('Result'),
    );
  }
}
