import 'package:flutter/material.dart';
import 'package:mini_projeto/screens/dashboard.dart';

Widget popUpSuccessDeleteOrEdit(BuildContext context, String tipo) {
  return AlertDialog(
    actionsAlignment: MainAxisAlignment.center,
    title: Text('O registo selecionado foi $tipo com sucesso.', textAlign: TextAlign.center,),
    actions: <Widget>[
      TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Dashboard()),
          );
          //Navigator.pop(context);
        },
        child: const Text('Fechar'),
      ),
    ],
  );
}