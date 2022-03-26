import 'package:school_enhancer_app/common/ui/ui_helper.dart';

class KAppBar extends AppBar {
  final Widget? title;
  final List<Widget>? actions;
  final double? toolbarHeight;

  KAppBar({this.title, this.actions, this.toolbarHeight})
      : super(
          title: title,
          actions: actions,
          toolbarHeight: toolbarHeight,
        );

  @override
  ShapeBorder get shape => RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
      );
}
