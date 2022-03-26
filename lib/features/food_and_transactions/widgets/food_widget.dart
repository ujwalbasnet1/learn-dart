import 'package:school_enhancer_app/common/ui/ui_helper.dart';

class FoodWidgetModel {
  final String? itemName;
  final String? date;
  final int? quantity;
  final int? unitPrice;
  int get totalPrice => quantity! * unitPrice!;

  FoodWidgetModel({
    this.itemName,
    this.date,
    this.quantity,
    this.unitPrice,
  });
}

class FoodWidget extends StatelessWidget {
  final FoodWidgetModel model;

  const FoodWidget({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.subtitle1!;
    final smallTextStyle = Theme.of(context).textTheme.caption!;

    return KContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(model.itemName!,
              style: titleStyle.copyWith(
                fontWeight: FontWeight.bold,
              )),
          Text(model.date!, style: smallTextStyle.copyWith(color: Colors.grey)),
          sHeightSpan,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Quantity', style: titleStyle),
              Text(model.quantity.toString(),
                  style: titleStyle.copyWith(
                    fontWeight: FontWeight.bold,
                  ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Unit Price', style: titleStyle.copyWith()),
              Text('Rs. ' + model.unitPrice.toString(),
                  style: titleStyle.copyWith(
                    fontWeight: FontWeight.bold,
                  ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total Price', style: titleStyle.copyWith()),
              Text('Rs. ' + model.totalPrice.toString(),
                  style: titleStyle.copyWith(
                    fontWeight: FontWeight.bold,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
