import '../ui_helper.dart';

class KContainer extends StatelessWidget {
  final Widget? child;
  final Color? color;

  const KContainer({Key? key, this.child, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _color = color ?? Theme.of(context).primaryColor;
    return Container(
      padding: sPagePadding,
      decoration: BoxDecoration(
        color: _color.withOpacity(0.025),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: _color, width: 0.25),
      ),
      child: child,
    );
  }
}
