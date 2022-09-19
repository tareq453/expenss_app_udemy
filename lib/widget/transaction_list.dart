import '../widget/transaction_item.dart';
import 'package:flutter/material.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final Function(Transaction) deleteHandler;
  final List<Transaction> _transactions;

  TransactionList(this._transactions, this.deleteHandler);

  @override
  Widget build(BuildContext context) {
    return _transactions.isEmpty
        ? LayoutBuilder(builder: ((context, constraints) {
          return Column(
            children: [
              Container(height: constraints.maxHeight * 0.2, child: FittedBox(child: Text("No Transaction added yet"))),
              SizedBox(
                height: constraints.maxHeight * 0.1,
              ),
              Container(
                  height: constraints.maxHeight * 0.7,
                  child: Image.asset(
                    "assets/images/waiting.png",
                    fit: BoxFit.cover,
                  ))
            ],
          );
        })) 
        : ListView.builder(
            itemBuilder: (context, index) {
              return TransactionItem(_transactions[index], deleteHandler);
            },
            itemCount: _transactions.length,
          );
  }
}
