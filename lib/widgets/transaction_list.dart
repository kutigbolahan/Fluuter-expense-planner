import 'package:expenseplanner/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleleTx;

  TransactionList(this.transactions, this.deleleTx, );

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (context, constraints){
            return Column(
            children: <Widget>[
              Text(
                'No transactions added yet',
                style: Theme.of(context).textTheme.title,
              ),
              SizedBox(height: 10),
              Container(
                height: MediaQuery.of(context).size.height* 0.3,
                child: Image.asset(
                  'assets/image/warning.png',
                  fit: BoxFit.cover,
                ),
              )
            ],
          );
        })
        : ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                elevation: 2,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: EdgeInsets.all(6.0),
                      child: FittedBox(
                          child: Text('\$${transactions[index].amount}')),
                    ),
                  ),
                  title: Text(
                    transactions[index].title,
                    style: Theme.of(context).textTheme.title,
                  ),
                  subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date)),
                  trailing: MediaQuery.of(context).size.width > 360
                   ? FlatButton.icon(
                     icon: Icon(Icons.delete),
                     label: Text('Delete'),
                     textColor:  Theme.of(context).errorColor,
                     onPressed: () => deleleTx(transactions[index].id),
                   ) 
                  : IconButton(
                    icon: Icon(Icons.delete),
                    color: Theme.of(context).errorColor,
                    onPressed: () => deleleTx(transactions[index].id),
                  ),
                ),
              );
            },
            itemCount: transactions.length,
          );
  }
}
