import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
 final List<Transaction> transaction;

  TransactionList(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: transaction.isEmpty
          ? Center(
            child: Column(
                children: <Widget>[
                  Text('No Transaction Added yet!',
                  style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 300,
                    child: Image.asset(
                      'Assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],

             ),
          )
          : ListView.builder(
        itemBuilder: (ctx,index) {
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  child: Text(
                    '\$${transaction[index].amount}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 2,
                    ),
                  ),
                  padding: EdgeInsets.all(10),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      transaction[index].title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    Text(
                      DateFormat.yMMMd().add_E().format(transaction[index].date),
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
        itemCount: transaction.length,
      ),
    );
  }
}
