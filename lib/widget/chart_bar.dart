import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double totalPercentageTransaction;
  final double amount;

  ChartBar(this.label, this.amount, this.totalPercentageTransaction);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(height: 20, child: FittedBox(child: Text('\$$amount'))),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    color: Color.fromRGBO(222, 222, 222, 1),
                    borderRadius: BorderRadius.circular(10)),
              ),
              FractionallySizedBox(
                heightFactor: totalPercentageTransaction,
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Theme.of(context).primaryColor)),
              )
            ],
          ),
        ),
        Text('$label')
      ],
    );
  }
}
