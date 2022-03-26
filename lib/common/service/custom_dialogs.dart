import 'package:school_enhancer_app/common/ui/ui_helper.dart';
import 'package:school_enhancer_app/core/dependency_injection/injection.dart';
import 'package:stacked_services/stacked_services.dart';

enum DialogType { Widget }

showKDialog(Widget widget) {
  return injection<DialogService>().showCustomDialog(
    variant: DialogType.Widget,
    customData: widget,
    barrierDismissible: true,
  );
}

void setupDialogUi() {
  final dialogService = injection<DialogService>();

  final builders = {
    DialogType.Widget: (context, sheetRequest, completer) =>
        _BasicDialog(request: sheetRequest),
  };

  dialogService.registerCustomDialogBuilders(builders);
}

class _BasicDialog extends StatelessWidget {
  final DialogRequest? request;
  final Function(DialogResponse)? completer;
  const _BasicDialog({Key? key, this.request, this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: request!.customData,
    );
  }
}
