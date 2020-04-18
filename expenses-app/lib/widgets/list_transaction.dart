import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myexpenses_app/models/transaction.dart';

class ListTransaction extends StatelessWidget{
  final List<Transaction> transactions;
  final Function deleteTransaction;
  ListTransaction(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: MediaQuery.of(context).size.height*0.65,
      child: transactions.length==0 ? Center(child:Text('No Transaction yet'),
      ) : ListView.builder(itemBuilder: (context,index){
        return Card(
          child: ListTile(
            leading: Container(
                  decoration:BoxDecoration(
                  border:Border.all(color:Theme.of(context).primaryColor, width: 1)),
                  margin: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                  ),
                  child:Text(NumberFormat('Rp #,###').format(transactions[index].amount),
                  style:TextStyle(fontWeight:FontWeight.bold,fontSize: 14,color: Theme.of(context).primaryColor),
                  textAlign: TextAlign.center),
                  padding: EdgeInsets.all(10),
            ),
            title : Text(transactions[index].title, style: Theme.of(context).textTheme.title),
            subtitle: Text(DateFormat('E, d MMM yyyy').format(transactions[index].date),
                  style: Theme.of(context).textTheme.subtitle),
            trailing: IconButton(
                      icon:Icon(Icons.delete),
                      onPressed:(){deleteTransaction(transactions[index].id);},
            ),
          ),
          );
        }, itemCount: transactions.length
      )
    );
  }
  }