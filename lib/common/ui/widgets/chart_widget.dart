import 'dart:ui';

import 'package:school_enhancer_app/common/ui/ui_helper.dart';

final _marks = [100, 75, 50, 25, 0];

class ChartWidget extends StatelessWidget {
  final Color? color;
  final List<ResultModel>? results;

  final double progress;

  const ChartWidget({
    Key? key,
    this.color,
    this.results,
    this.progress = 1,
  }) : super(key: key);

  factory ChartWidget.sampleData([double progress = 1]) {
    final List<ResultModel> results = [
      ResultModel("1st", 50),
      ResultModel("2nd", 90),
      ResultModel("3rd", 80),
      ResultModel("Final", 65),
    ];

    return ChartWidget(
      results: results,
      progress: progress,
    );
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context)
        .textTheme
        .caption!
        .copyWith(fontWeight: FontWeight.bold);
    final _color = color ?? Theme.of(context).primaryColor;

    return Center(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _marks
                  .map((e) => Padding(
                        padding: sXPadding,
                        child: Text(e.toString(), style: textStyle),
                      ))
                  .toList(),
            ),
          ),
          esWidthSpan,
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: CustomPaint(
                    painter: _ChartPainter(
                      results: results,
                      color: _color,
                      progress: progress,
                    ),
                    child: Container(),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: results!
                      .map((e) => Expanded(
                            child: Padding(
                              padding: esYPadding,
                              child: Center(
                                  child: Text(
                                e.term!,
                                style: textStyle,
                                textAlign: TextAlign.center,
                              )),
                            ),
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ChartPainter extends CustomPainter {
  final List<ResultModel>? results;
  final Color? color;
  final double progress;

  _ChartPainter({this.progress = 1, this.color, this.results});

  @override
  void paint(Canvas canvas, Size screenSize) {
    double leftGap = screenSize.width * 0.0;
    double bottomGap = screenSize.height * 0.0;
    Size size = Size(screenSize.width - leftGap, screenSize.height - bottomGap);

    Paint chartPaint = Paint()
      ..color = color!
      ..strokeWidth = 2;

    Paint pointPaint = Paint()
      ..color = color!
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 8;

    Paint linePaint = Paint()
      ..color = color!.withOpacity(0.25)
      ..strokeWidth = 0.5;

    List<Offset> points = [];

    int nodesLength = results!.length;
    double unitWidth = size.width / (nodesLength - 1);

    for (int i = 0; i < results!.length; i++) {
      final result = results![i];

      points.add(Offset(
        i * unitWidth + leftGap,
        (1 - result.percentIn1 * progress) * size.height,
      ));
    }

    canvas.drawPoints(PointMode.polygon, points, chartPaint);
    canvas.drawPoints(PointMode.points, points, pointPaint);

    // lines
    double horizontalLineUnitHeight = size.height / 4;
    List<double> horizontalLinePoints = [
      0 * horizontalLineUnitHeight,
      1 * horizontalLineUnitHeight,
      2 * horizontalLineUnitHeight,
      3 * horizontalLineUnitHeight,
      4 * horizontalLineUnitHeight,
    ];

    for (int i = 0; i < horizontalLinePoints.length; i++) {
      final p = horizontalLinePoints[i];
      final p1 = Offset(0 + leftGap, p);
      final p2 = Offset(size.width + leftGap, p);

      canvas.drawLine(p1, p2, linePaint);
    }

    // vertical lines
    canvas.drawLine(
      Offset(leftGap + 0, 0),
      Offset(leftGap + 0, size.height),
      linePaint,
    );

    canvas.drawLine(
      Offset(leftGap + size.width, 0),
      Offset(leftGap + size.width, size.height),
      linePaint,
    );

    // labels paint
    // TextSpan span = new TextSpan(
    //   style: new TextStyle(color: Colors.grey[600]),
    //   text: 'Yrfc',
    // );
    //
    // TextPainter tp = new TextPainter(text: span, textAlign: TextAlign.left);
    // tp.layout();
    // tp.paint(canvas, new Offset(5.0, 5.0));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class ResultModel {
  final String? term;
  final double? percentIn100;

  double get percentIn1 => percentIn100! / 100;

  ResultModel(this.term, this.percentIn100);
}
