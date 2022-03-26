import 'package:school_enhancer_app/common/ui/ui_helper.dart';

class OutlinedButtonWidgetModel {
  final String? text;

  OutlinedButtonWidgetModel({
    this.text,
  });
}

class OutlinedButtonWidget extends StatelessWidget {
  final OutlinedButtonWidgetModel? model;

  const OutlinedButtonWidget({Key? key, this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: lPadding,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.green),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Center(
        child: Text(
          model!.text!,
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
