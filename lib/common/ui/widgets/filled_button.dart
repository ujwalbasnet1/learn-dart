import 'package:school_enhancer_app/common/ui/ui_helper.dart';

class KFilledButton extends StatelessWidget {
  final Widget? child;
  final void Function()? onPressed;

  KFilledButton({Key? key, this.child, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: child,
    );
  }

  // @override
  // ShapeBorder get shape => RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(48),
  //     );
}
