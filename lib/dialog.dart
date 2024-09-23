import 'package:flutter/material.dart';

void showLaunchDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      String? selectedOption;
      TextEditingController codeController = TextEditingController();

      return AlertDialog(
        title: Text('Selecione o Tipo de Lançamento'),
        content: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RadioListTile<String>(
                  title: const Text('Lançamento por Prestador'),
                  value: 'prestador',
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('Lançamento por Grupo'),
                  value: 'grupo',
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value;
                    });
                  },
                ),
                SizedBox(height: 16),
                TextField(
                  controller: codeController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Digite o código numérico',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            );
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              String code = codeController.text;
              if (selectedOption != null && code.isNotEmpty) {
                print('Lançamento do tipo $selectedOption com código: $code');
                Navigator.of(context).pop();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content:
                        Text('Por favor, selecione um tipo e insira o código.'),
                  ),
                );
              }
            },
            child: Text('Confirmar Lançamento'),
          ),
        ],
      );
    },
  );
}
