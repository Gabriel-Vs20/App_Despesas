import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionsList extends StatelessWidget {
  
  List<Transaction> transactions;

  TransactionsList(this.transactions);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      child: ListView(
                children: transactions.map((tr){
                    return Card(
                      child: Row(children: [
      
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10
                        ),
      
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.red,
                            width: 2
                          )
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'R\$ ' + tr.value.toStringAsFixed(2),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: const Color.fromARGB(255, 255, 8, 0)
                          ),
                        ),
                      
                      ),
      
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(tr.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                          ),
                          ),
                          Text(DateFormat('d/MMM/y').format(tr.date),
                          style: TextStyle(
                            color: const Color.fromARGB(255, 137, 128, 128)
                          ),
                          ),
                        ],
                      ),
                      ],
                      ),
                    );
                }).toList(),
              ),
    );
  }
}