import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingTotal;

  ChartBar(this.label,this.spendingAmount,this.spendingTotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FittedBox(child: Text(spendingAmount.toString())),
        SizedBox(height:4),
//        Text(spendingAmount.toString()),
        Container(
            height: 60,
            width: 10,
            child: Stack(
              children: <Widget>[
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.circular(10)
                    ),
                ),
                FractionallySizedBox(
                    heightFactor: spendingTotal,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                )
              ],

            ),
        ),
        Text(label)
      ],
    );
  }
}
