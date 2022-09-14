import 'package:intl/intl.dart';

import '../models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  final Transaction _transaction;

  TransactionItem(this._transaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor, width: 2)),
              padding: EdgeInsets.all(10),
              child: Text(
               "\$${_transaction.amount.toStringAsFixed(2)}",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Theme.of(context).primaryColor),
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _transaction.title,
                style: Theme.of(context).textTheme.headline6),
              Text(
                DateFormat.yMMMd().format(_transaction.date),
                  style: TextStyle(fontSize: 10, color: Colors.grey))
            ],
          )
        ],
      ),
    );
  }
}
