import 'package:school_enhancer_app/common/ui/ui_helper.dart';
import 'package:school_enhancer_app/core/dependency_injection/injection.dart';
import 'package:stacked_services/stacked_services.dart';

enum BottomSheetType { Widget }

showKBottomSheet(Widget widget) {
  return injection<BottomSheetService>().showCustomSheet(
    variant: BottomSheetType.Widget,
    customData: widget,
    barrierDismissible: true,
  );
}

void setupBottomSheetUi() {
  final bottomSheetService = injection<BottomSheetService>();

  final builders = {
    BottomSheetType.Widget: (context, sheetRequest, completer) =>
        _WidgetBottomSheet(
          request: sheetRequest,
        )
  };

  bottomSheetService.setCustomSheetBuilders(builders);
}

class _WidgetBottomSheet extends StatelessWidget {
  final SheetRequest? request;

  const _WidgetBottomSheet({Key? key, this.request}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: request!.customData);
  }
}
