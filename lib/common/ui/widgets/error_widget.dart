import 'package:school_enhancer_app/common/ui/ui_helper.dart';

class KErrorWidget extends StatelessWidget {
  final String? error;
  final Function? onPressed;

  const KErrorWidget({Key? key, required this.error, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(error!),
          OutlineButton(
            onPressed: onPressed as void Function()?,
            child: Text('Try Again'),
          )
        ],
      ),
    );
    ;
  }
}
