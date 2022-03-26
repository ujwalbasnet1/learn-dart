import 'package:collection/collection.dart';
import 'package:school_enhancer_app/core/model/base_view_model.dart';

class HomeViewModel extends BaseViewModel {
  loadHome() async {
    var groupByData = groupBy(foods, (dynamic obj) => obj.date);

    print(groupByData);

    List<SummaryModel> summaries = groupByData.entries.map((e) {
      int totalPrice = 0;
      e.value.forEach((element) {
        totalPrice += element.unitPrice * element.quantity;
      });
      return SummaryModel(date: e.key, totalPrice: totalPrice);
    }).toList();

    //sort
    summaries.sort((a, b) {
      if (a.totalPrice! > b.totalPrice!) {
        return 1;
      } else {
        return 0;
      }
    });

    double average = 0;
    int sum = 0;

    summaries.forEach((element) {
      sum += element.totalPrice!;
    });

    average = sum / summaries.length;

    print(average);

    print(summaries);
  }
}

class SummaryModel {
  final String? date;
  final int? totalPrice;

  SummaryModel({this.date, this.totalPrice});

  @override
  String toString() {
    return "$date:$totalPrice";
  }
}

List<FoodItem> foods = [
  FoodItem("F1", 2, 20, "2020-11-11"),
  FoodItem("F2", 3, 30, "2020-11-11"),
  FoodItem("F3", 2, 60, "2020-11-12"),
  FoodItem("F4", 2, 20, "2020-11-13"),
  FoodItem("F5", 1, 50, "2020-11-13"),
  FoodItem("F6", 2, 30, "2020-11-14"),
  FoodItem("F7", 1, 20, "2020-11-14"),
  FoodItem("F8", 3, 10, "2020-11-14"),
];

class FoodItem {
  final String name;
  final int quantity;
  final int unitPrice;
  final String date;

  FoodItem(this.name, this.quantity, this.unitPrice, this.date);

  @override
  String toString() {
    // TODO: implement toString
    return name;
  }
}
