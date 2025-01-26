import 'package:flutter/material.dart';

class TransactionsField extends StatefulWidget {

  final void Function( String, double) _addTransaction;

  TransactionsField(this._addTransaction);

  @override
  State<TransactionsField> createState() => _TransactionsFieldState();
}

class _TransactionsFieldState extends State<TransactionsField> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
              elevation: 5,
               child: Padding(
                 padding: const EdgeInsets.all(10),
                 child: Column(
                 children: [
                 
                    TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                      labelText: 'Titulo',
                      
                      ),
                    ),
                    TextField(
                      controller: valueController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                      labelText: 'Valor R\$',
                      ),
                    ),
                 Container(
                  margin: EdgeInsets.only(top: 30),
                   child: ElevatedButton(
                
                    style: ButtonStyle(
                      foregroundColor: WidgetStatePropertyAll(const Color.fromARGB(255, 255, 255, 255))
          
                    ),
                    
                    onPressed: (){

                    final title = titleController.text;
                    final value = double.tryParse(valueController.text) ?? 0.0;

                    widget._addTransaction(title, value);
                    Navigator.pop(context);
                   
                   },
                   child: Text(
                    '+ Transação'
                   ),
                   ),
                 ),
                 ],
                               ),
               ),
            );
  }
}