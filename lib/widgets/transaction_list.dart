import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:personal_expense/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  TransactionList(this.transactions,this.deleteTx);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical:10,horizontal:10),
                      child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: FittedBox(
                    child: Text('\$${transactions[index].amount}'
                    ),
                  ),
                ),
              ),

              title: Text(
                transactions[index].title,
                // ignore: deprecated_member_use
                style: Theme.of(context).textTheme.title,
              ),
              subtitle: Text(DateFormat.yMMMd().format(transactions[index].date),
              ),
              trailing: IconButton(color: Theme.of(context).errorColor,
              icon: Icon(Icons.delete),
              onPressed: () => deleteTx(transactions[index].id),
              
            ),
          ),);
        },
        itemCount: transactions.length,
      ),
    );
  }
}
