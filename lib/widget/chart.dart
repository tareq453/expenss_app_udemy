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
      print("weekDay ${DateFormat.E().format(weekDay)}");
      return {'day': DateFormat.E().format(weekDay), 'amount': totalSum};
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValue);
    return Card(
      elevation: 10,
      margin: EdgeInsets.all(5),
      child: Row(
        children: [],
      ),
    );
  }
}
