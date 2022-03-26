import 'package:intl/intl.dart';
import 'package:school_enhancer_app/common/ui/ui_helper.dart';
import 'package:school_enhancer_app/common/ui/widgets/error_widget.dart';
import 'package:school_enhancer_app/data/api_service/annoucement/model/announcement_response_model.dart';
import 'package:school_enhancer_app/features/announcements/view_model/announcement_view_model.dart';
import 'package:school_enhancer_app/features/announcements/widgets/announcement_item_widget.dart';
import 'package:stacked/stacked.dart';

class AnnouncementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AnnouncementViewModel>.reactive(
        viewModelBuilder: () => AnnouncementViewModel(),
        disposeViewModel: true,
        onModelReady: (model) => model.getAnnouncements(),
        builder: (context, model, child) {
          return DefaultTabController(
            length: model.categories.length,
            child: Scaffold(
              appBar: AppBar(
                title: Text("Announcements"),
              ),
              body: model.isBusy
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : model.hasError
                      ? KErrorWidget(
                          error: model.modelError,
                          onPressed: model.getAnnouncements,
                        )
                      : Column(
                          children: [
                            Container(
                              height: 36,
                              margin: mPadding,
                              child: TabBar(
                                // labelStyle: Theme.of(context).textTheme.subtitle1,
                                isScrollable: true,
                                unselectedLabelColor: Colors.black,
                                labelColor: Colors.white,
                                indicatorColor: Colors.green,
                                indicatorSize: TabBarIndicatorSize.tab,
                                labelPadding:
                                    const EdgeInsets.symmetric(horizontal: 32),
                                indicator: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                tabs: model.categories.map(
                                  (e) {
                                    return Tab(
                                      icon: null,
                                      text: e!.title,
                                    );
                                  },
                                ).toList(),
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                children: model.categories.map((e) {
                                  List<AnnouncementResponseModel>
                                      announcements =
                                      model.getAnnouncementOfType(e!)!;

                                  return RefreshIndicator(
                                    onRefresh: () async {
                                      model.getAnnouncements();
                                    },
                                    child: ListView.separated(
                                      padding: lPadding.copyWith(top: 0),
                                      itemCount: announcements.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return AnnouncementItemWidget(
                                          model: AnnouncementItemWidgetModel(
                                            title: announcements[index].title,
                                            createdAt: DateFormat(
                                              "hh:mm aa, MMM dd, yyy",
                                            ).format(
                                              DateTime.parse(
                                                announcements[index].createdAt!,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      separatorBuilder:
                                          (BuildContext context, int index) =>
                                              mHeightSpan,
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
            ),
          );
        });
  }
}
