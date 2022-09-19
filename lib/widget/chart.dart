import 'package:expenss_app_udemy/widget/chart_bar.dart';

import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  List<Transaction> _recenctTransaction;

  Chart(this._recenctTransaction);

  List<Map<String, Object>> get groupedTransactionValue {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      var totalSum = 0.0;

      for (int i = 0; i < _recenctTransaction.length; i++) {
        if (_recenctTransaction[i].date.day == weekDay.day &&
            _recenctTransaction[i].date.month == weekDay.month &&
            _recenctTransaction[i].date.year == weekDay.year) {
          totalSum += _recenctTransaction[i].amount;
        }
      }
      print('totalSum $totalSum');
      print("weekDay ${DateFormat.E().format(weekDay).substring(0, 1)}");
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum
      };
    }).reversed.toList();
  }

  double get totalPercentageTransaction {
    return groupedTransactionValue.fold(0.0, (previousValue, element) {
      return previousValue += (element['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValue);
    return Card(
      elevation: 10,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValue.map((data) {
            return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                    data['day'] as String,
                    data['amount'] as double,
                    totalPercentageTransaction == 0 ? 0 : (data['amount'] as double) / totalPercentageTransaction));
          }).toList(),
        ),
      ),
    );
  }
}
