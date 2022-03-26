import 'package:school_enhancer_app/common/service/custom_bottom_sheets.dart';
import 'package:school_enhancer_app/common/ui/ui_helper.dart';
import 'package:school_enhancer_app/features/food_and_transactions/widgets/card_detail_widget.dart';
import 'package:school_enhancer_app/features/food_and_transactions/widgets/food_widget.dart';

class FoodAndTransactionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.subtitle1!;
    final textStyle = Theme.of(context).textTheme.subtitle2!;

    return Scaffold(
      appBar: _appBar(context),
      body: SingleChildScrollView(
        padding: mPadding,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('This Week',
                    style: titleStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor)),
                InkWell(
                  onTap: () {
                    showKBottomSheet(CardDetailWidget());
                  },
                  child: Text('View Card Detail',
                      style: textStyle.copyWith(
                          color: Theme.of(context).primaryColor)),
                )
              ],
            ),
            mHeightSpan,
            KContainer(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('11 Dec', style: titleStyle.copyWith()),
                      Text('Rs. 60',
                          style: titleStyle.copyWith(
                            fontWeight: FontWeight.bold,
                          ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('12 Dec', style: titleStyle.copyWith()),
                      Text('Rs. 60',
                          style: titleStyle.copyWith(
                            fontWeight: FontWeight.bold,
                          ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('13 Dec', style: titleStyle.copyWith()),
                      Text('Rs. 50',
                          style: titleStyle.copyWith(
                            fontWeight: FontWeight.bold,
                          ))
                    ],
                  ),
                  Divider(
                    thickness: 1,
                    color: Theme.of(context).primaryColor,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Grand Total',
                          style: titleStyle.copyWith(
                            fontWeight: FontWeight.w600,
                          )),
                      Text('Rs. 50',
                          style: titleStyle.copyWith(
                            fontWeight: FontWeight.bold,
                          ))
                    ],
                  ),
                ],
              ),
            ),
            mHeightSpan,
            FoodWidget(
              model: FoodWidgetModel(
                itemName: 'Chicken Momo',
                date: '11 Dec, 2021',
                quantity: 1,
                unitPrice: 60,
              ),
            ),
            mHeightSpan,
            FoodWidget(
              model: FoodWidgetModel(
                itemName: 'Samosa',
                date: '12 Dec, 2021',
                quantity: 2,
                unitPrice: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _appBar(BuildContext context) {
    return KAppBar(
      title: Text('Food & Transactions'),
      actions: [
        Padding(
          padding: mXPadding,
          child: Icon(Icons.filter_alt),
        ),
      ],
    );
  }
}
