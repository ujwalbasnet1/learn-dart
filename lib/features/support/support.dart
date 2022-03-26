import 'package:school_enhancer_app/common/ui/ui_helper.dart';
import 'package:school_enhancer_app/common/ui/widgets/error_widget.dart';
import 'package:school_enhancer_app/features/support/view_model/support_view_model.dart';
import 'package:school_enhancer_app/features/support/widget/support_widget.dart';
import 'package:stacked/stacked.dart';

class SupportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SupportViewModel>.reactive(
        viewModelBuilder: () => SupportViewModel(),
        onModelReady: (model) => model.getSupport(),
        builder: (context, model, child) {
          return Scaffold(
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                model.addSupport();
              },
              label: Text('Add'),
              icon: Icon(Icons.add),
              backgroundColor: Theme.of(context).primaryColor,
            ),
            appBar: _appBar(context),
            body: _list(context, model),
          );
        });
  }

  _appBar(BuildContext context) => KAppBar(title: Text('Support'));

  _list(BuildContext context, SupportViewModel model) {
    if (model.isLoading) return Center(child: CircularProgressIndicator());
    if (model.hasFailure)
      return Center(
          child: KErrorWidget(
        error: model.failure,
        onPressed: model.getSupport,
      ));
    else
      return RefreshIndicator(
        onRefresh: () => model.getSupport(),
        child: ListView.separated(
          padding: mPadding,
          itemCount: model.supports!.length,
          separatorBuilder: (BuildContext context, int index) {
            return mHeightSpan;
          },
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                model.onSupportClick(model.supports![index]);
              },
              child: SupportItemWidget(
                model: SupportItemWidgetModel(
                  title: model.supports![index].subject,
                  //todo:maxlines , date
                  date: 'Dec 09,2021',
                  text: model.supports![index].description,
                ),
              ),
            );
          },
        ),
      );
  }
}
