import 'package:school_enhancer_app/common/ui/ui_helper.dart';
import 'package:school_enhancer_app/features/splash_page/view_model/splash_view_model.dart';
import 'package:stacked/stacked.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
        viewModelBuilder: () => SplashViewModel(),
        disposeViewModel: true,
        onModelReady: (model) => model.splash(),
        builder: (context, model, child) {
          return Scaffold(
            body: Center(
              child: Image.asset(
                'assets/images/logo.png',
                height: 72,
                fit: BoxFit.fitHeight,
              ),
            ),
          );
        });
  }
}
