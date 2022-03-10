import 'package:flutter/material.dart';

Widget popUpFailDeleteOrEdit(BuildContext context, String tipo) {
  return AlertDialog(
    actionsAlignment: MainAxisAlignment.center,
    title: Text('Só podem ser $tipo registos datados dos últimos 7 dias.', textAlign: TextAlign.center,),
    actions: <Widget>[
      TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('Fechar'),
      ),
    ],
  );
}