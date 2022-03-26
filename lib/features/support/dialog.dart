import 'package:school_enhancer_app/common/ui/ui_helper.dart';
import 'package:school_enhancer_app/features/support/view_model/add_support_view_model.dart';
import 'package:stacked/stacked.dart';

class AddSupportDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.subtitle1;
    final textStyle = Theme.of(context).textTheme.subtitle2;
    final smallTextStyle = Theme.of(context).textTheme.caption;

    return ViewModelBuilder<AddSupportViewModel>.reactive(
        viewModelBuilder: () => AddSupportViewModel(),
        builder: (context, model, child) {
          return SingleChildScrollView(
            child: Padding(
              padding: mPadding,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Add Query",
                    style: textStyle!.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  sHeightSpan,
                  DropdownButton<String>(
                    isExpanded: true,
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    value: model.subject,
                    onChanged: model.onSubjectChanged,
                    items: model.subjects
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    hint: Text('Subject'),
                  ),
                  TextFormField(
                      onChanged: model.onDescriptionChanged,
                      minLines: 4,
                      maxLines: 7,
                      decoration: InputDecoration(
                        labelText: 'Description...',
                      )),
                  sHeightSpan,
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: sPadding,
                      child: Text(
                        'Upload Files',
                        style: smallTextStyle!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  sHeightSpan,
                  RaisedButton(
                    padding: mXPadding,
                    color: Theme.of(context).primaryColor,
                    disabledColor: Colors.grey,
                    onPressed: model.addSupport,
                    child: model.isLoading
                        ? CircularProgressIndicator()
                        : Text(
                            'ADD',
                            style: smallTextStyle.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
