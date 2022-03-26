import 'package:school_enhancer_app/core/model/base_view_model.dart';

class CalenderViewModel extends BaseViewModel {
  loadEvent() async {
    setLoading(true);
    await Future.delayed(Duration(seconds: 2));
    setLoading(false);
  }
}
