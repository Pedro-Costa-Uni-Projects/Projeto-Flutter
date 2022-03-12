import 'package:flutter/material.dart';

import '../screens/dashboard.dart';

Widget popUpSuccessDeleteOrEdit(BuildContext context, String tipo) {
  return AlertDialog(
    actionsAlignment: MainAxisAlignment.center,
    title: Text('O registo selecionado foi $tipo com sucesso.', textAlign: TextAlign.center,),
    actions: <Widget>[
      TextButton(
        onPressed: () {
          if(tipo == "editado") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Dashboard()),
            );
          } else {
            Navigator.pop(context);
          }

        },
        child: const Text('Fechar'),
      ),
    ],
  );
}