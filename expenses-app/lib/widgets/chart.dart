import 'package:flutter/material.dart';
import 'package:myexpenses_app/models/transaction.dart';
import 'package:myexpenses_app/widgets/chart_bar.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;
  Chart(this.recentTransaction);

  List<Map<String,Object>> get grouppedTransaction {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0;

      for (var i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].date.day == weekDay.day &&
            recentTransaction[i].date.month == weekDay.month &&
            recentTransaction[i].date.year == weekDay.year) {
          totalSum = totalSum + recentTransaction[i].amount;
        }
      }
      return {'day': DateFormat.E().format(weekDay), 'amount': totalSum};
    });
  }
      double get totalSpending{
        return grouppedTransaction.fold(0.0, (sum,item){
          return sum+item['amount'];
        });
    }
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: grouppedTransaction.map((data){
              return Flexible(
                fit:FlexFit.tight,
                child: ChartBar(
                  data['day'],
                  data['amount'],
                  totalSpending==0.0
                  ? 0.0:(data['amount'] as double)/totalSpending)
              );
            }).toList(),
              )
        ),
      );
  }
  }


