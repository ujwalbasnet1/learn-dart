import 'package:school_enhancer_app/common/ui/ui_helper.dart';

class ExamPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.1),
      body: DefaultTabController(
        length: 2,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.white),
                padding: mPagePadding,
                child: Column(
                  children: [
                    _topsection(context),
                    _tabbarsection(context),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 1),
                    ),
                    child: Column(
                      children: [
                        Text('Unit Test-2'),
                        Row(
                          children: [
                            Text('Starts from: '),
                            Text(
                              'Jan 04, 2021',
                              style: TextStyle(color: Colors.black54),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text('Exam Start Time: '),
                            Text(
                              '7:00 am',
                              style: TextStyle(color: Colors.black54),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(color: Colors.green),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

_tabbarsection(BuildContext context) => TabBar(
      indicatorColor: Colors.blue,
      labelColor: Colors.blue,
      unselectedLabelColor: Colors.black,
      tabs: [
        Tab(
          text: 'Upcoming Exams',
        ),
        Tab(
          text: 'Progress Report',
        ),
      ],
    );

_topsection(BuildContext context) {
  final titleStyle = Theme.of(context).textTheme.headline6;
  final captionStyle = Theme.of(context).textTheme.caption;

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Good morning !',
            style: titleStyle,
          ),
          sHeightSpan,
          Text(
            'Today (2021/01/08)',
            style: captionStyle,
          ),
        ],
      ),
      Column(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Theme.of(context).primaryColor,
          ),
          eesHeightSpan,
          Text(
            'Ujwal Basnet',
            style: captionStyle,
          ),
          eesHeightSpan,
          Text(
            '12 "B"',
            style: captionStyle,
          ),
        ],
      ),
    ],
  );
}
