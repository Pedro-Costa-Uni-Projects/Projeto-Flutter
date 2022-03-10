import 'package:flutter/material.dart';
import '../data/datasource.dart';

class EditarScreen extends StatefulWidget {
  EditarScreen(this.id, {Key? key});

  //Ver Melhor Forma de Fazer
  final int id;
  final String title = "Editar Registo";

  @override
  State<EditarScreen> createState() => _EditarScreenState(this.id);
}

class _EditarScreenState extends State<EditarScreen> {
  _EditarScreenState(this.id);

  //Ver Melhor Forma de Fazer
  final int id;
  DataSource _dataSource = DataSource.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Text(
          id.toString(),
        ),
      )
    );
  }
}