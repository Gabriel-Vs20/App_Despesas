import 'package:flutter/material.dart';

class TransactionsField extends StatelessWidget {

  final titleController = TextEditingController();
  final valueController = TextEditingController();

  final void Function( String, double) onSubmit;

  TransactionsField(this.onSubmit);

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
                      backgroundColor: WidgetStatePropertyAll(Colors.red),
                      foregroundColor: WidgetStatePropertyAll(const Color.fromARGB(255, 255, 255, 255))
          
                    ),
                    
                    onPressed: (){

                    final title = titleController.text;
                    final value = double.tryParse(valueController.text) ?? 0.0;

                    onSubmit(title, value);
                   
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