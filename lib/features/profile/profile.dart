import 'package:intl/intl.dart';
import 'package:school_enhancer_app/common/ui/ui_helper.dart';
import 'package:school_enhancer_app/common/ui/widgets/error_widget.dart';
import 'package:school_enhancer_app/features/profile/view_model/profile_view_model.dart';
import 'package:stacked/stacked.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appBarTitleStyle = Theme.of(context).textTheme.headline6!.copyWith(
          color: Colors.white,
        );

    final appBarDateStyle = Theme.of(context).textTheme.subtitle2!.copyWith(
          color: Colors.white70,
        );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 86,
        centerTitle: true,
        shadowColor: Colors.transparent,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Good morning,', style: appBarTitleStyle),
            eesHeightSpan,
            Text(
              'Today (${DateFormat("yyy/MM/dd").format(DateTime.now())})',
              style: appBarDateStyle,
            ),
          ],
        ),
      ),
      body: ViewModelBuilder<ProfileViewModel>.reactive(
          viewModelBuilder: () => ProfileViewModel(),
          disposeViewModel: true,
          onModelReady: (model) => model.getProfile(),
          builder: (context, model, child) {
            if (model.isLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (model.hasFailure) {
              return KErrorWidget(
                error: model.failure,
                onPressed: model.getProfile,
              );
            }
            return RefreshIndicator(
              onRefresh: () => model.getProfile(),
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration:
                        BoxDecoration(color: Theme.of(context).primaryColor),
                    padding: mPagePadding,
                    child: _topSection(context, model),
                  ),
                  Padding(padding: lPadding, child: _bottomSection(context)),
                ],
              ),
            );
          }),
    );
  }

  _bottomSection(BuildContext context) => KContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kamal Raj Khatri',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            sHeightSpan,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Relation : ",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
                Text(
                  "Father",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
            esHeightSpan,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Email : ",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
                Text(
                  "krk@gmail.com",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
            esHeightSpan,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Phone : ",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
                Text(
                  "+977-9873625632   +977-9841625376",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
            lHeightSpan,
            Text(
              'Ramala Khatri',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            sHeightSpan,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Relation : ",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
                Text(
                  "Mother",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
            esHeightSpan,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Email : ",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
                Text(
                  "rk@gmail.com",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
            esHeightSpan,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Phone : ",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
                Text(
                  "+977-9873625632   +977-9841625376",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  _topSection(BuildContext context, ProfileViewModel model) {
    final profile = model.profileResponseModel!;

    final titleStyle = Theme.of(context)
        .textTheme
        .headline6!
        .copyWith(fontWeight: FontWeight.bold);

    final overlineStyleBold = Theme.of(context)
        .textTheme
        .caption!
        .copyWith(fontWeight: FontWeight.w500);

    final overlineStyle = Theme.of(context).textTheme.overline!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
//          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 36,
              backgroundColor: Colors.green.withOpacity(0.6),
            ),
            sHeightSpan,
            Text(
              profile.uUser!.fullName!,
              style: titleStyle.copyWith(color: Colors.white),
            ),
            sHeightSpan,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text("Class : ",
                      textAlign: TextAlign.end,
                      style: overlineStyleBold.copyWith(color: Colors.white)),
                ),
                sWidthSpan,
                esWidthSpan,
                Expanded(
                  child: Text(
                    "12 'B'",
                    style: overlineStyle.copyWith(color: Colors.white70),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    "ID : ",
                    textAlign: TextAlign.end,
                    style: overlineStyleBold.copyWith(color: Colors.white),
                  ),
                ),
                sWidthSpan,
                esWidthSpan,
                Expanded(
                  child: Text(profile.uUser!.id!,
                      style: overlineStyle.copyWith(color: Colors.white70)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    "Phone : ",
                    textAlign: TextAlign.end,
                    style: overlineStyleBold.copyWith(color: Colors.white),
                  ),
                ),
                sWidthSpan,
                esWidthSpan,
                Expanded(
                  child: Text(profile.uUser!.phoneNumber!,
                      style: overlineStyle.copyWith(color: Colors.white70)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    "Permanent Add : ",
                    textAlign: TextAlign.end,
                    style: overlineStyleBold.copyWith(color: Colors.white),
                  ),
                ),
                sWidthSpan,
                esWidthSpan,
                Expanded(
                  child: Text(profile.uUser?.address ?? '',
                      style: overlineStyle.copyWith(color: Colors.white70)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text("Temporary Add : ",
                      textAlign: TextAlign.end,
                      style: overlineStyleBold.copyWith(color: Colors.white)),
                ),
                sWidthSpan,
                esWidthSpan,
                Expanded(
                  child: Text(profile.uUser?.address ?? '',
                      style: overlineStyle.copyWith(color: Colors.black54)),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
