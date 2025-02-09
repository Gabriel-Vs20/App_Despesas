import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionsList extends StatelessWidget {
  
  List<Transaction> transactions;
  final void Function (String) _deleteTransaction;

  TransactionsList(this.transactions, this._deleteTransaction);


  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty ? 
    LayoutBuilder(
      builder: (context, constraints){
      return Column(
      children: [
        Text("Nenhuma transação cadastrada."),
    
        SizedBox(height: constraints.maxHeight * 0.1),
    
        Container(
          height: constraints.maxHeight * 0.6,
          child: Image.asset('assets/img/zzz.png',
          fit: BoxFit.cover),
        )
        ],
      );
     },
    )
    : ListView(
      children: 
        transactions.map((tr){
          return Card(
            elevation: 5,
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FittedBox(
                    child: Text('R\$${tr.value}')),
                ),
              ),
              title: Text(
                tr.title
              ),
              subtitle: Text(
                DateFormat('d MMM y').format(tr.date),
              ),
              trailing: IconButton(onPressed: () => _deleteTransaction(tr.id), 
              icon: Icon(Icons.delete),
              color: Theme.of(context).colorScheme.error),
              ),
          );  
        }).toList(),
        );
  }
}