import 'package:school_enhancer_app/core/dependency_injection/injection.dart';
import 'package:stacked_services/stacked_services.dart';

import '../ui_helper.dart';

/// The type of snackbar to show
enum SnackbarType { success, error, warning, info }

void setupSnackbarUi() {
  final service = injection<SnackbarService>();

  service.registerSnackbarConfig(SnackbarConfig(
    backgroundColor: Colors.black,
    textColor: Colors.white,
    mainButtonTextColor: Colors.black,
  ));

  service.registerCustomSnackbarConfig(
    variant: SnackbarType.success,
    config: SnackbarConfig(
      backgroundColor: Colors.green,
      textColor: Colors.white,
      borderRadius: 1,
    ),
  );

  service.registerCustomSnackbarConfig(
    variant: SnackbarType.error,
    config: SnackbarConfig(
      backgroundColor: Colors.red,
      textColor: Colors.white,
      borderRadius: 1,
    ),
  );

  service.registerCustomSnackbarConfig(
    variant: SnackbarType.warning,
    config: SnackbarConfig(
      backgroundColor: Colors.orange,
      textColor: Colors.white,
      borderRadius: 1,
    ),
  );

  service.registerCustomSnackbarConfig(
    variant: SnackbarType.info,
    config: SnackbarConfig(
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      borderRadius: 1,
    ),
  );
}
