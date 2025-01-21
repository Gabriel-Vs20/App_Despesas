import 'package:flutter/material.dart';

class TransactionsField extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Card(
              elevation: 5,
               child: Padding(
                 padding: const EdgeInsets.all(10),
                 child: Column(
                 children: [
                 
                    TextField(
                      decoration: InputDecoration(
                      labelText: 'Titulo',
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                      labelText: 'Titulo',
                      ),
                    ),
                 
                 ],
                               ),
               ),
            );
  }
}