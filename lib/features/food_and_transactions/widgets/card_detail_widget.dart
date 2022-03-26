import 'package:school_enhancer_app/common/ui/ui_helper.dart';

class CardDetailWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.subtitle1!;
    final textStyle = Theme.of(context).textTheme.subtitle2!;

    return Container(
      padding: mPadding,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          )),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'My Card',
            style: titleStyle.copyWith(fontWeight: FontWeight.bold),
          ),
          mHeightSpan,
          KContainer(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Card Number', style: titleStyle),
                    Text('233445',
                        style: textStyle.copyWith(fontWeight: FontWeight.bold))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Issued at', style: titleStyle),
                    Text('20/11/2021',
                        style: textStyle.copyWith(fontWeight: FontWeight.bold))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Issued by', style: titleStyle),
                    Text('Ujwal Basnet',
                        style: textStyle.copyWith(fontWeight: FontWeight.bold))
                  ],
                ),
                Divider(
                  color: Theme.of(context).primaryColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Current Style',
                        style: textStyle.copyWith(fontWeight: FontWeight.bold)),
                    Text('Rs.3170',
                        style: textStyle.copyWith(fontWeight: FontWeight.bold))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Last Balance Load at', style: textStyle),
                    sHeightSpan,
                    Text('11/12/2021', style: textStyle)
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
