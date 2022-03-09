import 'package:flutter/material.dart';

class AdicionarScreen extends StatefulWidget {
  const AdicionarScreen({Key? key}) : super(key: key);

  final String title = "Adicionar Registo";

  @override
  State<AdicionarScreen> createState() => _AdicionarScreenState();
}

class _AdicionarScreenState extends State<AdicionarScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Text("Teste Adicionar"),
      ),

    );
  }
}