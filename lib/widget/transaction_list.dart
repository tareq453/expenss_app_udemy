import '../widget/transaction_item.dart';
import 'package:flutter/material.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final Function(Transaction) deleteHandler;
  final List<Transaction> transactions;

  const TransactionList({Key? key,required this.transactions,required this.deleteHandler})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: ((context, constraints) {
            return Column(
              children: [
                Container(
                    height: constraints.maxHeight * 0.2,
                    child: FittedBox(
                        child: Text(
                      "No Transaction added yet",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ))),
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
        : ListView( children: transactions.map((tx) => TransactionItem(key : ValueKey(tx.id),transaction: tx, deleteHandler: deleteHandler)).toList(),
            // itemBuilder: (context, index) {
            //   return TransactionItem(key : ValueKey(transactions[index].id),transaction: transactions[index], deleteHandler: deleteHandler);
            // },
            // itemCount: transactions.length,
          );
  }
}
