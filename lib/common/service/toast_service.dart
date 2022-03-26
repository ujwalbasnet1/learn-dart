import 'package:injectable/injectable.dart';
import 'package:school_enhancer_app/common/ui/widgets/setup_snackbar_ui.dart';
import 'package:stacked_services/stacked_services.dart';

@injectable
class ToastService {
  final SnackbarService? snackbarService;

  ToastService(this.snackbarService);

  s(String message) {
    snackbarService!.showCustomSnackBar(
      variant: SnackbarType.success,
      message: message,
    );
  }

  e(String error) {
    snackbarService!.showCustomSnackBar(
      variant: SnackbarType.error,
      message: error,
    );
  }

  w(String warning) {
    snackbarService!.showCustomSnackBar(
      variant: SnackbarType.warning,
      message: warning,
    );
  }

  i(String info) {
    snackbarService!.showCustomSnackBar(
      variant: SnackbarType.info,
      message: info,
    );
  }

  d(String defaultMessage) {
    snackbarService!.showSnackbar(
      message: defaultMessage,
    );
  }
}
