import 'package:flutter/material.dart';
import '../screens/dashboard.dart';

Widget popUpSubmit(BuildContext context) {
  return AlertDialog(
    actionsAlignment: MainAxisAlignment.center,
    title: const Text('O seu registo foi submetido com sucesso.', textAlign: TextAlign.center,),
    actions: <Widget>[
      TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Dashboard()),
          );
          //Navigator.pop(context);
        },
        child: const Text('Close'),
      ),
    ],
  );
}
